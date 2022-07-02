FROM maven AS build

WORKDIR /code

RUN git clone  https://github.com/spring-guides/gs-spring-boot.git && \
    cd gs-spring-boot/complete && \
    mvn package



FROM openjdk:17.0.2-oraclelinux8 

WORKDIR /app

COPY --from=build /code/gs-spring-boot/complete/target/spring-boot-complete-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java","-jar", "/app/spring-boot-complete-0.0.1-SNAPSHOT.jar"]
