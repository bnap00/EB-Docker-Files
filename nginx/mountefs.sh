if [[ ! -z $MOUNT_DIRECTORY ]]
    if [[ ! -z $FILE_SYSTEM_URL ]]
        mkdir $MOUNT_DIRECTORY
        mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $FILE_SYSTEM_URL $MOUNT_DIRECTORY
    fi
fi 