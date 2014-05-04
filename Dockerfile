FROM ubuntu:saucy
MAINTAINER komica <komica@dr.com>
ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y -f install
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes --force-yes install -f mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql
RUN update-rc.d apache2 enable
RUN service apache2 start
RUN update-rc.d mysql defaults
RUN service mysql start
EXPOSE 80
