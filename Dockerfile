FROM centos:latest
MAINTAINER Nick Campion <nick.campion@fasthosts.com>
RUN yum update -y && \
    yum install -y php-cli git vim lsof php-xml php-devel patch make bzip2 gcc gcc-c++ automake glibc-static xdg-utils epel-release && \
    yum install -y php-pdo supervisor && \
    git clone https://github.com/greeninja/phoronix-test-suite.git && \
    cd phoronix-test-suite/ && \
    bash install-sh;
ADD phoronix-test-suite.xml /etc/phoronix-test-suite.xml
ADD phoromatic.ini /etc/supervisord.d/phoromatic.ini
ADD supervisord.conf /etc/supervisord.conf
EXPOSE 80 8080 8088
CMD ["supervisord"]
