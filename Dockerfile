FROM centos:7.6.1810

MAINTAINER Fernando Martinez <fernando.martinezmeana@altran.com>

# Install openvswitch
RUN yum update -y
RUN yum install gcc gcc-c++ autoconf automake libtool openssl-devel python-devel desktop-file-utils groff graphviz checkpolicy selinux-policy-devel python-sphinx python-twisted-core python-zope-interface python-six libcap-ng-devel unbound unbound-devel wget rpm-build -y
RUN yum clean all
RUN useradd ovs
RUN su - ovs
RUN wget http://openvswitch.org/releases/openvswitch-2.11.0.tar.gz
RUN mkdir -p ~/rpmbuild/SOURCES
RUN cp openvswitch-2.11.0.tar.gz ~/rpmbuild/SOURCES/
RUN tar xfz openvswitch-2.11.0.tar.gz
RUN rpmbuild -bb --nocheck openvswitch-2.11.0/rhel/openvswitch-fedora.spec
RUN exit
RUN yum localinstall /home/ovs/rpmbuild/RPMS/x86_64/openvswitch-2.11.0-1.el7.x86_64.rpm -y

# Instal neutron
RUN yum -y install centos-release-openstack-rocky 
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-rocky.repo 
RUN yum --enablerepo=centos-openstack-rocky,epel -y install openstack-neutron openstack-neutron-ml2 openstack-neutron-openvswitch
