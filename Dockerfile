FROM maven

WORKDIR /code

RUN git clone https://github.com/spring-guides/gs-spring-boot.git && \
    cd gs-spring-boot/complete && \
    mvn package

EXPOSE 8080

CMD [ "java", "-jar", "/code/gs-spring-boot/complete/target/spring-boot-complete-0.0.1-SNAPSHOT.jar" ]