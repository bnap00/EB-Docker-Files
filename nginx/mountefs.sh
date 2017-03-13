#!/bin/bash
EFS_FILE_SYSTEM_URL=$FILE_SYSTEM_URL

echo "Mounting EFS filesystem to directory ${MOUNT_DIRECTORY} ..."

echo 'Stopping NFS ID Mapper...'
service rpcidmapd status &> /dev/null
if [ $? -ne 0 ] ; then
    echo 'rpc.idmapd is already stopped!'
else
    service rpcidmapd stop
    if [ $? -ne 0 ] ; then
        echo 'ERROR: Failed to stop NFS ID Mapper!'
        exit 1
    fi
fi

echo 'Checking if EFS mount directory exists...'
if [ ! -d ${MOUNT_DIRECTORY} ]; then
    echo "Creating directory ${MOUNT_DIRECTORY} ..."
    mkdir -p ${MOUNT_DIRECTORY}
    if [ $? -ne 0 ]; then
        echo 'ERROR: Directory creation failed!'
        exit 1
    fi
    chmod 777 ${MOUNT_DIRECTORY}
    if [ $? -ne 0 ]; then
        echo 'ERROR: Permission update failed!'
        exit 1
    fi
else
    echo "Directory ${MOUNT_DIRECTORY} already exists!"
fi

umount ${MOUNT_DIRECTORY}
mountpoint -q ${MOUNT_DIRECTORY}
if [ $? -ne 0 ]; then
    echo "mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${FILE_SYSTEM_URL} ${MOUNT_DIRECTORY}"
    mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${FILE_SYSTEM_URL} ${MOUNT_DIRECTORY}
    if [ $? -ne 0 ] ; then
        echo 'ERROR: Mount command failed!'
        exit 1
    fi
else
    echo "Directory ${MOUNT_DIRECTORY} is already a valid mountpoint!"
fi

echo 'EFS mount complete.'
