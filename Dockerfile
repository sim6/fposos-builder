FROM debian
MAINTAINER Simó Albert i Beltran <sim6@probeta.net>
# http://code.fairphone.com/projects/fp-osos/dev/fairphone-os-build-instructions.html#fairphone-os-build-instructions
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk bison g++-multilib git gperf libxml2-utils make python-networkx zlib1g-dev zip curl lib32z1
# lib32z1: out/host/linux-x86/bin/aapt: error while loading shared libraries: libz.so.1: cannot open shared object file: No such file or directory
RUN curl https://storage.googleapis.com/git-repo-downloads/repo -o /usr/local/bin/repo
RUN chmod u+x /usr/local/bin/repo
RUN mkdir fairphone_os
RUN cd fairphone_os && repo init -u http://code.fairphone.com/gerrit/fp2-dev/manifest -b fp2-sibon
RUN cd fairphone_os && repo sync
COPY fposos_build /usr/local/bin/
