# ssc
Fortify Software Security Center with Docker

# Setup
in the ssc.war configuration utility, specify the search index directory as noted in the Dockerfile (/usr/share/tomcat/ssc_search_index) or customize and update the searchIndex.location property in ssc.properties.

https deployment will require modification of the Dockerfile to include importing the certs

dataSource.properties and ssc.properties can be copied from existing ssc and used with automation mode of the ssc.war configuration tool

```java -jar ${SSC_ZIP_EXPLODED}/ssc-configuration-wizard.jar -automationMode -war /path/to/ssc.war -jdbcDriver mysql-connector-java-5.1.35.jar -license /path/to/fortify.license -loadfrom dataSource.properties -loadfrom ssc.properties```

# Build
```
docker build --no-cache -t ${SSC_IMG} .
```

# Start
with link to db image
```
docker run --name ${SSC_CONT_NAME} --network=${NETWORK_HOST} --ip ${SSC_IP} -p 80:8080 -d ${SSC_IMG}
```
tail ssc.log
```
docker exec -it ${SSC_CONT_NAME} tail -f /usr/local/tomcat/logs/ssc.log
```
