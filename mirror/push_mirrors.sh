#!/bin/bash

MIRRORS="ceilometer \
            cinder \
            glance \
            heat \
            ironic \
            keystone \
            neutron-fwaas \
            neutron-lbaas \
            neutron-vpnaas \
            sahara \
            swift \
            trove \
            requirements \
            tempest-lib \
            tempest \
            devstack"
BARE="nova \
      neutron \
      horizon"

MIRRORS_DIR=/opt/src/openstack
BARE_DIR=/opt/src/openstack_bare

LOCAL_MIRRORS=http://code.z.local

## Push mirror clone
for i in $MIRRORS; do
   cd $MIRRORS_DIR/$i.git
   echo "## Git Remote update $i.git"
   git remote update
   echo "## Git Push $i.git to local mirrors"
   git push --mirror $LOCAL_MIRRORS/openstack/$i.git
   echo "## Complete Push $i.git to local mirrors"
   echo "============================================================"
done

## Push bare clone
for i in $BARE; do
   cd $BARE_DIR/$i.git
   echo "## Git Remote update $i.git"
   git remote update
   echo "## Git Push $i.git to local mirrors"
   git push --mirror $LOCAL_MIRRORS/openstack/$i.git
   echo "## Complete Push $i.git to local mirrors"
   echo "============================================================"
done
