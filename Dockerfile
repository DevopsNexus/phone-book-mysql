FROM centos
MAINTAINER Aditya Patawari "aditya@adityapatawari.com"

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install git python-pip gcc python-devel mysql-devel curl
RUN pip install flask flask-sqlalchemy flask-migrate uwsgi mysql
RUN mkdir /phone-book
WORKDIR /phone-book
RUN curl https://raw.githubusercontent.com/DevopsNexus/phone-book-mysql/master/app.py 
EXPOSE 8080
CMD ["uwsgi", "-s", "0.0.0.0:8080", "--manage-script-name", "--mount", "/phonebook=app:app"]
