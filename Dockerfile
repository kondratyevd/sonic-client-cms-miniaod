ARG ROOT_CONTAINER=gitlab-registry.cern.ch/linuxsupport/alma8-base:latest
FROM $ROOT_CONTAINER

RUN yum install -y wget

WORKDIR /home/

RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    wget https://raw.githubusercontent.com/fastmachinelearning/sonic-workflows/CMSSW_14_1_X/setup.sh \
    && source setup.sh

RUN cd CMSSW_14_1_0_pre7/src/sonic-workflows \
    && cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]