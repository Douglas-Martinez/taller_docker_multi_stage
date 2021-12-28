# TALLER: DOCKER MULTI-STAGE Y SUS BENEFICIOS PRACTICOS

## MULTI-STAGE

Funcionalidad de Docker que permite definir multiples imagenes intermedias de Docker y varias etapas de construccion en un mismo Dockerfile para construir una imagen final. Se pueden usar multiples instrucciones **FROM** en el Dockerfile donde cada una de ellas inicia una nueva etapa o paso.

Entre las caracteristicas de las construcciones multi-stage tenemos:
- Creacion de Dockerfiles mas faciles de leer y mantener
- Optimizacion de imagenes
- Incremento de la diversidad de opciones del desarrollador al disponer de varias imagenes base.

Normalmente al construir una imagen de Docker se suele terminar con una imagen grande y pesada ya que se utiliza alguna imagen base generl de Dockerhub o algun repositorio privado para crearlas, y dentro de las mismas hay muchos archivos o paquetes por defecto de las imagenes que no se usan nunca durante la ejecucion del contenedor y solamente ocupan espacio. Una de las razones para evitar imagenes grandes es porque generan potenciales vulnerabilidades de seguridad e incrementan el area de ataque.

Se puede reducir el tamaño de las imagenes de Docker mediante el uso del [**Build Pattern**](https://en.wikipedia.org/wiki/Builder_pattern) o [**Builder**](https://www.ionos.es/digitalguide/paginas-web/desarrollo-web/patron-de-diseno-builder/) (en español) el cual es un patron de diseño que, en el caso de Docker, utiliza normalmente dos imagenes para crear primero una imagen base para la construccion de assets y compilacion de codigo fuente, y una segunda imagen que se utiliza para correr o desplegar la aplicacion final. Al principio este patron era implementado mediante el uso de multiples Dockerfiles pero desde ***Docker 17.06 CE*** se puede realizar en un solo Dockerfile por la introduccion y soporte de construcciones multi-stage.

## PRESENTACION

Ve la presentacion inicial del taller disponible en el siguiente [link de drive](https://docs.google.com/presentation/d/1JEaLs0aZjYXpom8GkpGWsG7uC_78S-VgRB1BSxq_dS8/edit?usp=sharing)

## YOUTUBE

El video del taller esta disponible en mi [canal de youtube](https://youtu.be/HzSacm5C_JY)

## REFERENCIAS
- https://docs.docker.com/develop/develop-images/multistage-build/
- https://earthly.dev/blog/docker-multistage/
- https://github.com/laserants-gt/curso-de-docker/tree/master/Construir%20una%20imagen%20con%20multistage
- https://github.com/GoogleContainerTools/distroless
