FROM centos:7.6.1810

MAINTAINER Fernando Martinez <fernando.martinezm@altran.com>

RUN yum update -y
RUN yum -y install centos-release-openstack-stein
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-stein.repo
RUN yum --enablerepo=centos-openstack-stein,epel -y install mariadb-server MySQL-python
RUN yum clean all

EXPOSE 3306

ADD run-mariadb.sh /run-mariadb.sh
RUN chmod -v +x /run-mariadb.sh

CMD ["/run-mariadb.sh"]
