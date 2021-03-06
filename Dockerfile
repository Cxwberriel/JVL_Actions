FROM tomcat

COPY . .

RUN apt-get update ; apt-get install maven default-jdk -y ; update-alternatives --config javac

RUN mvn clean package ; cp target/*.war /usr/local/tomcat/webapps/

EXPOSE 23
EXPOSE 80
EXPOSE 999999
ENV password="SOOPERSECRET"

CMD ["catalina.sh","run"]
