FROM geddes-registry.rcac.purdue.edu/docker-hub-cache/library/rockylinux:9

RUN dnf -y install git wget which procps-ng brotli glibc-headers glibc-devel dnf-plugins-core \
    && dnf config-manager --set-enabled crb \
    && dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    && dnf -y install https://repo.osg-htc.org/osg/25-main/osg-25-main-el9-release-latest.rpm \
    && dnf -y install osg-ca-certs

WORKDIR /home/

COPY filenames_patch.py /home/filenames_patch.py

RUN source /cvmfs/cms.cern.ch/cmsset_default.sh && \
    wget https://raw.githubusercontent.com/fastmachinelearning/sonic-workflows/CMSSW_17_0_X/setup.sh && \
    chmod +x setup.sh && \
    sed -i '2iset -e' setup.sh && \
    sed -i 's/ -p$//' setup.sh && \
    ./setup.sh -a https && \
    python3 /home/filenames_patch.py && \
    cd /home/CMSSW_17_0_0_pre1/src && \
    cmsenv

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]