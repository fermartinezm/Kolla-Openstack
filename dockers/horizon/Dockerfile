FROM centos:7.6.1810

MAINTAINER Fernando Martinez <fernando.martinezmeana@altran.com>

RUN yum update -y
RUN yum -y install centos-release-openstack-stein
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-stein.repo
RUN yum --enablerepo=centos-openstack-stein,epel -y install openstack-dashboard httpd
RUN yum clean all

EXPOSE 80

ADD run-horizon.sh /run-horizon.sh
RUN chmod -v +x /run-horizon.sh

CMD ["/run-horizon.sh"]
