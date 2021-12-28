# Utilizo la imagen base de golang, por defecto sera el tag 'latest'
FROM golang

# Creo un directorio de trabajo dentro de la imagen
WORKDIR /go/src/app

# Copio todos los archivos que terminen en .go (en este caso solo main.go) al directorio anterior
COPY *.go .

# Creo el go.mod y descargo las librerias utilizadas
RUN go mod init
RUN go get -d -v ./...

# Comando que se ejecutara al crear un contenedor
CMD ["go", "run", "main.go"]


# Build de la imagen
# sudo docker build -t taller_docker .

# Creacion del contenedor
# sudo docker run -d --name prueba_normal -p 8081:8080 taller_docker