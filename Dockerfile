FROM tomcat:8.5.43-jdk8

RUN apt-get update && \
  apt-get install -yq wget pwgen && \
  apt-get install zip -y && \
  apt-get install unzip -y  && \
  rm -rf /var/lib/apt/lists/*

# DOWNLOAD THE DROOLS JARS
RUN wget https://github.com/mmrajesh90/drools-tomcat/raw/master/Drools-essential-jars.zip
  
#COPY Drools-essential-jars Drools-essential-jars
RUN ls -la
RUN pwd
RUN unzip Drools-essential-jars.zip
RUN cd Drools-essential-jars
#RUN ls -la
RUN cp Drools-essential-jars/*.jar ${CATALINA_HOME}/lib
RUN cp Drools-essential-jars/btm-config.properties ${CATALINA_HOME}/conf
RUN cp Drools-essential-jars/resources.properties ${CATALINA_HOME}/conf
RUN cp Drools-essential-jars/tomcat-users.xml ${CATALINA_HOME}/conf
RUN cp Drools-essential-jars/setenv.sh ${CATALINA_HOME}/bin

WORKDIR $CATALINA_HOME

EXPOSE 8080
EXPOSE 8009

CMD ["catalina.sh", "run"]
