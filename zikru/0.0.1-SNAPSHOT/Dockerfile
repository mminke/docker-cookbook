FROM mminke/apache-tomcat:7.0.57

MAINTAINER Morten Minke

ADD scripts/start-zikru.sh /opt/zikru/
ADD scripts/zikru-config.properties.template /opt/zikru/conf/

RUN wget -nv --no-cookies http://sourceforge.net/projects/zikru/files/snapshots/zikru-backend-webservice-0.0.1-SNAPSHOT.war/download -O /opt/apache-tomcat-7.0.57/webapps/zikru-backend-webservice.war
RUN wget -nv --no-cookies http://sourceforge.net/projects/zikru/files/snapshots/zikru-frontend-webapp-0.0.1-SNAPSHOT.war/download -O /opt/apache-tomcat-7.0.57/webapps/zikru-frontend-webapp.war
	
ENV ZIKRU_HOME /opt/zikru

# CMD [""]
ENTRYPOINT ["/opt/zikru/start-zikru.sh"]
