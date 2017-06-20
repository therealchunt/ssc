FROM tomcat:8.5.15
LABEL maintainer "chunt"

#args used during building of this image
ARG MY_FILES_DIR=files
ARG TMP_DIR=/root/mytemp
ARG TOMCAT_DIR=/usr/local/tomcat

#create temp dir for needed files
RUN mkdir $TMP_DIR/
COPY $MY_FILES_DIR/* $TMP_DIR/

#clear out "default" apps that tomcat includes
#put ssc war in webapps dir for deployment
RUN rm -rf $TOMCAT_DIR/webapps/* && \
	mkdir $TOMCAT_DIR/ssc_search_index && \
	mv $TMP_DIR/ssc.war $TOMCAT_DIR/webapps

#cleanup temp dir
RUN rm -rf $TMP_DIR
