ARG ROOT_CONTAINER=gitlab-registry.cern.ch/linuxsupport/alma8-base:latest
FROM $ROOT_CONTAINER

RUN yum install -y wget git tar

WORKDIR /home/

RUN wget https://raw.githubusercontent.com/fastmachinelearning/sonic-workflows/CMSSW_14_1_X/setup.sh \
    && chmod +x setup.sh \
    && ./setup.sh

RUN cd CMSSW_14_1_0_pre7/src/sonic-workflows \
    && cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]