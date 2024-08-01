#GENERAR LA IMAGEN
# docker build -t app-authors .
# docker tag app-authors kevinchiguano/app-authors --> en caso no se quiera generar la imagen desde 0
# docker build -t kevinchiguano/app-authors .

# docker login
#docker push kevinchiguano/app-authors

FROM eclipse-temurin:21-jre-jammy


RUN mkdir /app

WORKDIR /app

COPY build/install/app-authors/lib .

CMD ["java", "-jar", "app-authors-1.0-SNAPSHOT.jar"]