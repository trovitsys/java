FROM blacklabelops/alpine:3.5

# build parameters
ARG JAVA_DISTRIBUTION=jdk
ARG JAVA_MAJOR_VERSION=6
ARG JAVA_UPDATE_VERSION=45
ARG JAVA_BUILD_NUMBER=06
ARG JAVA_HASH=
ARG GLIBC_VERSION=2.22-r8
ARG BUILD_DATE=undefined

ENV LANG en_US.UTF-8
ENV JAVA_VERSION=1.${JAVA_MAJOR_VERSION}.0_${JAVA_UPDATE_VERSION}
ENV JAVA_HOME=/opt/java/${JAVA_DISTRIBUTION}${JAVA_VERSION}
ENV PATH=$PATH:$JAVA_HOME/bin

# install java
RUN export JAVA_TARBALL=${JAVA_DISTRIBUTION}-${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-linux-x64.bin && \
    # Install tooling
    apk add --update \
      ca-certificates \
      wget && \
    # Install latest glibc
    wget --directory-prefix=/tmp https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add --allow-untrusted /tmp/glibc-${GLIBC_VERSION}.apk && \
    wget --directory-prefix=/tmp https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    apk add --allow-untrusted /tmp/glibc-bin-${GLIBC_VERSION}.apk && \
    wget --directory-prefix=/tmp https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk && \
    apk --allow-untrusted add /tmp/glibc-i18n-${GLIBC_VERSION}.apk && \
    /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    # Install oracle java
    wget --quiet --directory-prefix=/tmp \
         --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-b${JAVA_BUILD_NUMBER}/${JAVA_TARBALL} && \
    mkdir -p /opt/java && \
    chmod +x /tmp/${JAVA_TARBALL} && \
    /tmp/${JAVA_TARBALL} && \
    mv ${JAVA_DISTRIBUTION}${JAVA_VERSION} /opt/java && \
    ln -s ${JAVA_HOME}/bin/java /usr/bin/java && \
    # Remove obsolete packages
    apk del \
      ca-certificates \
      wget && \
    # Clean caches and tmps
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    rm -rf /var/log/*

LABEL com.blacklabelops.image.name.java="java-"${JAVA_DISTRIBUTION}"-base-image" \
      com.blacklabelops.application.name.java="java" \
      com.blacklabelops.application.version.java=${JAVA_DISTRIBUTION}${JAVA_MAJOR_VERSION}"-"${JAVA_UPDATE_VERSION}"-b"${JAVA_BUILD_NUMBER} \
      com.blacklabelops.application.name.glibc="glibc" \
      com.blacklabelops.application.version.glibc=${GLIBC_VERSION} \
      com.blacklabelops.image.builddate.java=${BUILD_DATE}
