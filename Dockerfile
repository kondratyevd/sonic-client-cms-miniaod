ARG ROOT_CONTAINER=gitlab-registry.cern.ch/linuxsupport/alma8-base:latest
FROM $ROOT_CONTAINER

# Set SCRAM architecture
ENV SCRAM_ARCH=el8_amd64_gcc12

# Install dependencies
RUN yum install -y wget bash perl git which python3 glibc-static glibc-devel libxcrypt-compat

WORKDIR /home/

RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    wget https://raw.githubusercontent.com/fastmachinelearning/sonic-workflows/CMSSW_14_1_X/setup.sh && \
    chmod +x setup.sh &&\
    ./setup.sh

RUN cd CMSSW_14_1_0_pre7/src/sonic-workflows \
    && cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]