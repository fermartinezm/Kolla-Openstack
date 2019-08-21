FROM centos:7.6.1810

MAINTAINER Fernando Martinez <fernando.martinezm@altran.com>

RUN yum update -y
RUN yum -y install centos-release-openstack-stein
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-stein.repo
RUN yum --enablerepo=centos-openstack-stein,epel -y install openstack-keystone openstack-utils python-openstackclient mod_wsgi httpd
RUN yum clean all

EXPOSE 5000 35357 80

ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
