FROM centos:7.6.1810

MAINTAINER Fernando Martinez <fernando.martinezmeana@altran.com>

RUN yum update -y
RUN yum -y install centos-release-openstack-stein
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-stein.repo
RUN yum --enablerepo=centos-openstack-stein,epel -y install openstack-glance
RUN yum clean all

EXPOSE 9292

ADD run-glance.sh /run-glance.sh
RUN chmod -v +x /run-glance.sh

CMD ["/run-glance.sh"]
