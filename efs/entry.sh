 mkdir $MOUNT_DIRECTORY
 mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $ILE_SYSTEM_URL $MOUNT_DIRECTORY