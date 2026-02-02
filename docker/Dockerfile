FROM opensciencegrid/osg-wn:latest

RUN dnf -y install git bash perl which python3 epel-release dnf-plugins-core glibc-static bzip2 \
    openssh-server openssh-clients openssl-devel

WORKDIR /home/

COPY setup-patched.sh /home/setup.sh
RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    chmod +x /home/setup.sh && \
    cd /home && \
    bash ./setup.sh -a https && \
    cd /home/CMSSW_14_1_0_pre7/src/sonic-workflows \
    && cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]