#GENERAR LA IMAGEN
# docker build -t app-books .
# docker tag app-books kevinchiguano/app-books --> en caso no se quiera generar la imagen desde 0
# docker build -t kevinchiguano/app-books .

# docker login
#docker push kevinchiguano/app-books

FROM eclipse-temurin:21-jre-jammy


RUN mkdir /app

WORKDIR /app

COPY build/install/app-books/lib .
CMD ["java", "-jar", "app-books-1.0-SNAPSHOT.jar"]