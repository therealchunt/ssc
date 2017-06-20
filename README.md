# ssc
Fortify Software Security Center with Docker

in the ssc.war configuration utility, specify the search index directory as noted in the Dockerfile (/usr/share/tomcat/ssc_search_index) or customize

https deployment will require modification of the Dockerfile to include importing the certs

# Start
with link to db image
```
docker run --name <image_name> --link <ssc_db_image_name>:mysql -p 80:8080 <ssc_image>
```
to monitor ssc.log:
```
docker exec <image_name> -it tail -f /usr/local/tomcat/logs/ssc.log
```
