ARG ROOT_CONTAINER=gitlab-registry.cern.ch/linuxsupport/alma8-base:latest
FROM $ROOT_CONTAINER


# Install dependencies
RUN dnf -y install \
    'dnf-command(config-manager)' \
    sudo wget perl which git bzip2 \
    openssh-server openssh-clients openssl-devel \
    emacs vim-enhanced jq xterm-resize \
    libXft libXpm libXext libSM mesa-libGL libnsl.x86_64 \
    glibc-locale-source glibc-langpack-en \
    stress apptainer compat-openssl10 \
    s3cmd htop \
    boost-devel diffutils ncurses-compat-libs cmake \
    glibc-static

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