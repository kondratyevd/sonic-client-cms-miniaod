FROM rockylinux:9

RUN dnf -y install git wget

WORKDIR /home/

RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    wget https://raw.githubusercontent.com/fastmachinelearning/sonic-workflows/CMSSW_16_0_X/setup.sh && \
    chmod +x setup.sh && \
    ./setup.sh && \
    cd CMSSW_16_0_0_pre4/src/sonic-workflows && \
    cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]