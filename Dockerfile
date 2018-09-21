FROM mysql:5.7.23
MAINTAINER ajtuss
ADD service_station.sql /docker-entrypoint-initdb.d
ENV MYSQL_ROOT_PASSWORD=root