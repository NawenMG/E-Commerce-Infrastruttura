# Utilizza l'ultima versione di OpenJDK
FROM openjdk:latest

# Imposta la variabile d'ambiente per il nome del file JAR
ARG JAR_FILE=target/demo-0.0.1-SNAPSHOT.jar

# Copia il file JAR nell'immagine Docker
COPY ${JAR_FILE} demo-0.0.1-SNAPSHOT.jar

# Espone la porta su cui l'applicazione Spring Boot ascolta
EXPOSE 8080

# Comando per eseguire l'applicazione Spring Boot
ENTRYPOINT ["java", "-jar", "/my_app.jar"]
