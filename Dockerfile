ARG ROOT_CONTAINER=gitlab-registry.cern.ch/linuxsupport/alma8-base:latest
FROM $ROOT_CONTAINER


# Install dependencies
RUN dnf -y update && \
    dnf -y install epel-release dnf-plugins-core && \
    dnf config-manager --set-enabled powertools && \
    # Install OSG repository
    dnf -y install https://repo.opensciencegrid.org/osg/3.6/osg-3.6-el8-release-latest.rpm && \
    # Install other repositories
    dnf -y install https://dl.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/t/tini-0.19.0-1.el8.x86_64.rpm && \
    # Install packages
    dnf -y install \
    'dnf-command(config-manager)' \
    sudo wget perl which git bzip2 \
    openssh-server openssh-clients openssl-devel \
    emacs vim-enhanced jq xterm-resize \
    libXft libXpm libXext libSM mesa-libGL libnsl.x86_64 \
    glibc-locale-source glibc-langpack-en \
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