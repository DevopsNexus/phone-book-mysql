FROM centos
MAINTAINER Aditya Patawari "aditya@adityapatawari.com"

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install git python-pip gcc python-devel mysql-devel
RUN pip install flask flask-sqlalchemy flask-migrate uwsgi mysql
RUN git clone https://github.com/training-devops/phone-book-mysql phone-book
WORKDIR /phone-book
EXPOSE 8080
CMD ["uwsgi", "-s", "0.0.0.0:8080", "--manage-script-name", "--mount", "/phonebook=app:app"]
