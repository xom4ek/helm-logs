FROM centos:7

ENV werf_version=v1.2.10+fix27
RUN yum install --setopt=tsflags=nodocs --nogpgcheck -y wget ca-certificates gettext git && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN curl -sSL https://dl.bintray.com/flant/werf/${werf_version}/werf-linux-amd64-${werf_version} \
    -o /usr/local/bin/werf && \
    chmod a+x /usr/local/bin/werf && echo 'werf helm $@' >> /usr/local/bin/helm && chmod a+x /usr/local/bin/helm
RUN helm plugin install https://github.com/chartmuseum/helm-push
