FROM centos:7.6.1810

MAINTAINER Fernando Martinez <fernando.martinezmeana@altran.com>

RUN yum update -y
RUN yum -y install centos-release-openstack-stein
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-stein.repo
RUN yum --enablerepo=centos-openstack-stein,epel -y install openstack-nova mod_wsgi httpd
RUN yum clean all

EXPOSE 6080 6081 6082 8774 8775 8778 80

ADD run-nova.sh /run-nova.sh
RUN chmod -v +x /run-nova.sh

CMD ["/run-nova.sh"]
