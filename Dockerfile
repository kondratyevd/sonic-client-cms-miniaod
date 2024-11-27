ARG ROOT_CONTAINER=gitlab-registry.cern.ch/linuxsupport/alma8-base:latest
FROM $ROOT_CONTAINER


# Install dependencies
RUN dnf -y install git bash perl

WORKDIR /home/

COPY setup.sh /home/

RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    chmod +x setup.sh &&\
    ./setup.sh

RUN cd CMSSW_14_1_0_pre7/src/sonic-workflows \
    && cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]