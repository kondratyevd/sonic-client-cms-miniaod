ARG ROOT_CONTAINER=gitlab-registry.cern.ch/linuxsupport/alma8-base:latest
FROM $ROOT_CONTAINER

RUN dnf -y install https://repo.opensciencegrid.org/osg/3.6/osg-3.6-el8-release-latest.rpm  &&\
    dnf -y install git bash perl which python3 epel-release dnf-plugins-core glibc-static bzip2 \
    openssh-server openssh-clients openssl-devel

WORKDIR /home/

COPY setup.sh /home/

RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    chmod +x setup.sh &&\
    ./setup.sh -a https &&\
    cd /home/CMSSW_14_1_0_pre7/src/sonic-workflows \
    && cmsenv

RUN mkdir -p /data/
COPY test_aodsim.root /data/
COPY step2_PAT.py /home/CMSSW_14_1_0_pre7/src/sonic-workflows

RUN mkdir -p /etc/SITECONF/local/JobConfig/
COPY site-local-config.xml /etc/SITECONF/local/JobConfig/
# later: export CMS_PATH=/etc/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]