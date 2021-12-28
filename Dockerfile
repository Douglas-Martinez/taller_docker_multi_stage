# PASO 1: Utilizo la imagen base de golang:alpine y lo nombro como 'build'
FROM golang:alpine as build
WORKDIR /go/src/app
COPY *.go .
RUN go mod init
RUN go get -d -v ./...
RUN CGO_ENABLED=0 go build -o /go/bin/app

# PASO 2: Utilizo una imagen distroless de google para reducir significativamente
# el tamaño de la imagen resultante. (dependiendo de la aplicacion hasta menos de 5 MB)
FROM  gcr.io/distroless/static
COPY --from=build /go/bin/app /
# Comando que se ejecutara al crear un contenedor
CMD ["/app"]


# Build de la imagen
# sudo docker build -t docker_distroless .

# Creacion del contenedor
# sudo docker run -d --name prueba_distroless -p 8083:8080 docker_distroless