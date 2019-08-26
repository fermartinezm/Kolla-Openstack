FROM centos:7.6.1810

MAINTAINER Fernando Martinez <fernando.martinezmeana@altran.com>

RUN yum update -y
RUN yum -y install centos-release-openstack-stein
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-stein.repo
RUN yum -y install qemu-kvm libvirt virt-install
RUN yum --enablerepo=centos-openstack-stein,epel -y install openstack-nova-compute
RUN yum clean all

EXPOSE 5900-5999

ADD run-nova-compute.sh /run-nova-compute.sh
RUN chmod -v +x /run-nova-compute.sh

CMD ["/run-nova-compute.sh"]
