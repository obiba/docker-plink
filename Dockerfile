FROM obiba/ssh:latest

RUN apt-get update && apt-get install -y plink wget unzip
RUN mkdir -p /tmp/plink1.90 && cd /tmp/plink1.90 && \
    wget -q http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20200219.zip && \
    unzip plink_linux_x86_64_20200219.zip && \
    cp plink /usr/local/bin && \
    cd /root && rm -rf /tmp/plink1.90 && apt-get remove -y wget unzip

EXPOSE 22
