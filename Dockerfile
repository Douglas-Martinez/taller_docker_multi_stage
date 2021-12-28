# PASO 1: Utilizo la imagen base de golang:latest y lo nombro como 'build'
FROM golang as build
WORKDIR /go/src/app
COPY *.go .
RUN go mod init
RUN go get -d -v ./...

# Compilo mi codigo fuente y con el argumento -o el ejecutable se creara donde se indique a continuacion.
# El argumento CGO_ENABLED=0 se utiliza para que el resultado corra sin dependencias de librerias externas
# y sea apto para imagenes mas pequeñas
RUN CGO_ENABLED=0 go build -o /go/bin/app


# PASO 2: Utilizo la imagen de golang:alpine que es mas pequeña para copiar el ejecutable y utilizar en produccion
FROM  golang:alpine

# Copio la infomacion ubicada en /go/bin/app de la imagen llamada 'build' (imagen del paso 1)
# y la pego en la carpeta raiz de la nueva imagen de golang
COPY --from=build /go/bin/app /

# Comando que se ejecutara al crear un contenedor
CMD ["/app"]


# Build de la imagen
# sudo docker build -t docker_multi .

# Creacion del contenedor
# sudo docker run -it -d --name prueba_multi -p 8082:8080 docker_multi