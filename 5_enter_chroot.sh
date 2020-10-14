#!/bin/bash
# Author < HangsiaHONG hangsia@koompi.org >

CWD=$PWD
source $CWD/config
export LFS

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login +h



# if [ -x $LFS/usr/bin/env ]; then
# 	ENVLFS=/usr/bin/env
# else
# 	ENVLFS=/tools/bin/env
# fi