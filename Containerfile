FROM registry.redhat.io/openjdk/openjdk-11-rhel8

EXPOSE 8080

COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

CMD java -jar java-maven-app-*.jar
