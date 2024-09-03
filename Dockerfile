FROM bellsoft/liberica-openjdk-alpine
ENV TZ=Asia/Seoul
ARG JAR_FILE=build/libs/youcanorder-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]