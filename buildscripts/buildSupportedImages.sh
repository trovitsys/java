#!/bin/bash -x

set -o errexit # abort script at first error

# Setting environment variables
readonly CUR_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

printf '%b\n' ":: Reading release config...."
source $CUR_DIR/release.sh

# JDK 8
source $CUR_DIR/buildImage.sh java-oracle-alpine/Dockerfile jdk8 jdk $ORACLE_8_JAVA_MAJOR_VERSION $ORACLE_8_JAVA_UPDATE_VERSION $ORACLE_8_JAVA_BUILD_NUMBER
source $CUR_DIR/buildImage.sh java-oracle-alpine/Dockerfile jdk8.$ORACLE_8_JAVA_UPDATE_VERSION.$ORACLE_8_JAVA_BUILD_NUMBER jdk $ORACLE_8_JAVA_MAJOR_VERSION $ORACLE_8_JAVA_UPDATE_VERSION $ORACLE_8_JAVA_BUILD_NUMBER
source $CUR_DIR/buildImage.sh java-oracle-centos/Dockerfile centos.jdk8 jdk $ORACLE_8_JAVA_MAJOR_VERSION $ORACLE_8_JAVA_UPDATE_VERSION $ORACLE_8_JAVA_BUILD_NUMBER
source $CUR_DIR/buildImage.sh java-oracle-centos/Dockerfile centos.jdk8.$ORACLE_8_JAVA_UPDATE_VERSION.$ORACLE_8_JAVA_BUILD_NUMBER jdk $ORACLE_8_JAVA_MAJOR_VERSION $ORACLE_8_JAVA_UPDATE_VERSION $ORACLE_8_JAVA_BUILD_NUMBER

# JDK 6
source $CUR_DIR/buildImage.sh java-jdk-6-alpine/Dockerfile jdk6 jdk $ORACLE_6_JAVA_MAJOR_VERSION $ORACLE_6_JAVA_UPDATE_VERSION $ORACLE_6_JAVA_BUILD_NUMBER
source $CUR_DIR/buildImage.sh java-jdk-6-alpine/Dockerfile jdk6.$ORACLE_6_JAVA_UPDATE_VERSION.$ORACLE_6_JAVA_BUILD_NUMBER jdk $ORACLE_6_JAVA_MAJOR_VERSION $ORACLE_6_JAVA_UPDATE_VERSION $ORACLE_6_JAVA_BUILD_NUMBER
source $CUR_DIR/buildImage.sh java-jdk-6-centos/Dockerfile centos.jdk6 jdk $ORACLE_6_JAVA_MAJOR_VERSION $ORACLE_6_JAVA_UPDATE_VERSION $ORACLE_6_JAVA_BUILD_NUMBER
source $CUR_DIR/buildImage.sh java-jdk-6-centos/Dockerfile centos.jdk6.$ORACLE_6_JAVA_UPDATE_VERSION.$ORACLE_6_JAVA_BUILD_NUMBER jdk $ORACLE_6_JAVA_MAJOR_VERSION $ORACLE_6_JAVA_UPDATE_VERSION $ORACLE_6_JAVA_BUILD_NUMBER