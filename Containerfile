FROM docker.io/brody/openjdk17-alpine

EXPOSE 2888

COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

CMD java -jar java-maven-app-*.jar
