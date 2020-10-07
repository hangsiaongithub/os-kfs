#/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config
export KFS

function create_part() {
    parted --script /dev/sdb \
    mklabel gpt \
    mkpart primary ext2 1Mib 101Mib \
    mkpart primary ext4 101Mib 5G \
    mkpart prmary ext4 5G 20G
}

function format_part() {
    mkfs -v -t ext2 /dev/sdb1
    mkswap /dev/sdb2
    mkfs -v -t ext4 /dev/sdb3
}

function mount_part() {
    mkdir -pv $KFS
    mount /dev/sdb3 $KFS
    /sbin/swapon -v /dev/sdb2
}


main() {
    create_part;
    format_part;
    mount_part;
}

main
