#!/bin/bash
# mirror openstack repo from github.com

UPSTREAM_BASE_URL=http://git.openstack.org
REPO_BASE_DIR=/opt/src/openstack_mirror
COMPONENTS="ceilometer \
            cinder \
            glance \
            heat \
            horizon \
            ironic \
            keystone \
            neutron \
            neutron-fwaas \
            neutron-lbaas \
            neutron-vpnaas \
            nova \
            sahara \
            swift \
            trove \
            requirements \
            tempest-lib \
            tempest"
#  OpenStack Server Components

#git clone --mirror https://github.com/openstack/ceilometer.git
#git clone --mirror https://github.com/openstack/cinder.git
#git clone --mirror https://github.com/openstack/glance.git
#git clone --mirror https://github.com/openstack/heat.git
#git clone --mirror https://github.com/openstack/horizon.git
#git clone --mirror https://github.com/openstack/ironic.git
#git clone --mirror https://github.com/openstack/keystone.git
#git clone --mirror https://github.com/openstack/neutron.git
#git clone --mirror https://github.com/openstack/neutron-fwaas.git
#git clone --mirror https://github.com/openstack/neutron-lbaas.git
#git clone --mirror https://github.com/openstack/neutron-vpnaas.git
#git clone --mirror https://github.com/openstack/nova.git
#git clone --mirror https://github.com/openstack/sahara.git
#git clone --mirror https://github.com/openstack/swift.git
#git clone --mirror https://github.com/openstack/trove.git

# Testing Components

#git clone --mirror https://github.com/openstack/requirements.git
#git clone --mirror https://github.com/openstack/tempest.git
#git clone --mirror https://github.com/openstack/tempest-lib.git

if [ ! -d $REPO_BASE_DIR ]; then
    mkdir -p $REPO_BASE_DIR
fi

cd $REPO_BASE_DIR
if [ ! -d "devstack.git" ]; then
    git clone --mirror $UPSTREAM_BASE_URL/openstack-dev/devstack.git
fi

# Server && Testing Components

for i in $COMPONENTS
do
    cd $REPO_BASE_DIR
    if [ ! -d "$i.git" ]; then
        git clone --mirror $UPSTREAM_BASE_URL/openstack/$i.git
    fi
done
