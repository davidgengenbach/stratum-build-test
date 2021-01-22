#!/usr/bin/env bash

set -eux

export SDE_TAR="$PWD/third_party/bf_sde_9.3.0.tgz"
export SDE_INSTALL_TAR=/vagrant/third_party/bf_sde_9.3.0-install.tgz
export STRATUM_ROOT="$PWD/third_party/stratum"
export JOBS=`nproc`

main() {
    (install_deps)
    (build_stratum)
}

build_stratum() {
    cd $STRATUM_ROOT
    stratum/hal/bin/barefoot/build-bf-sde.sh -t $SDE_TAR
    stratum/hal/bin/barefoot/docker/build-stratum-bf-container.sh
}

install_deps() {
    sudo apt-get update
    # Stratum
    sudo apt-get install -y linux-headers-$(uname -r) python-pip

    # Docker
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    sudo groupadd docker || true
    sudo usermod -aG docker $USER || true
}


main