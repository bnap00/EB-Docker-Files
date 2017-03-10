$fsurl
$mountpoint = $1


mkdir $mountpoint
 mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2  "${fsurl}" "${mountpoint}"