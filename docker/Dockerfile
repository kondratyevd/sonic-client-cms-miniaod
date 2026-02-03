FROM opensciencegrid/osg-wn:latest

RUN dnf -y install git bash perl which python3 epel-release dnf-plugins-core glibc-static bzip2 \
    openssh-server openssh-clients openssl-devel procps-ng brotli wget

WORKDIR /home/

# Setup steps from sonic-workflows README (CMSSW_16_0_X)
RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    wget https://raw.githubusercontent.com/fastmachinelearning/sonic-workflows/CMSSW_16_0_X/setup.sh && \
    chmod +x setup.sh && \
    ./setup.sh && \
    cd CMSSW_16_0_0_pre4/src/sonic-workflows && \
    cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]