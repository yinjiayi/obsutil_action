FROM ubuntu

ADD https://obs-community.obs.cn-north-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz /

RUN tar -xzf /obsutil_linux_amd64.tar.gz

RUN mv /obsutil_linux_amd64*/obsutil /usr/local/bin/obsutil

RUN chmod a+x /usr/local/bin/obsutil

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
