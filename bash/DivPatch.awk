#!/bin/awk -f
#
#extract kernel git patch to local kernel.patch 
#extract other git patch of android to local JB.patch 
#
/^project / && NF == 2 {
    #print $2
    repo = $2
}
BEGIN {
    system("rm -f 'kernel.patch'")
    system("rm -f 'JB.patch'")
}
{
    if (match(repo,/kernel\//)){
       print >> "kernel.patch"
    }else{
       print >> "JB.patch"
    }
}
