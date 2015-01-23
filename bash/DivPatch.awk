#!/bin/awk -f
#
#extract kernel git patch to local kernel.patch 
#extract other git patch of android to local JB.patch 
#
/^project / && NF == 2 {
    #print $2
    repo = $2
}
{
    if (match(repo,/kernel\//)){
       rm -f "kernel.patch"
       print >> "kernel.patch"
    }else{
       rm -f "JB.patch"
       print >> "JB.patch"
    }
}
