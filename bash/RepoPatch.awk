#!/usr/bin/awk -f
#
# modify input *.patch generate by kernel.patch to JB.patch
#
function sinsert(sorign,ssub) {
    aend = substr(sorign,3)
    apre = substr(sorign,0,3)
    sorign = apre ssub aend
    return sorign
}
BEGIN {
       system("rm -f 'kernel.patch'")
       system("rm -f 'JB.patch'")
      }
/^project / && NF == 2 {
    repo = $2
}
{
    if (match(repo,/kernel\//)){
       print >> "kernel.patch"
       JB = 0
    }else{
       JB = 1
    }
    hit = 0
}
/^diff / && NF ==4 && JB{
    $3 = sinsert($3,repo)
    $4 = sinsert($4,repo)
    print >> "JB.patch"
    hit = 1 
}
(/^\+\+\+ / || /^--- a/) && NF == 2 && JB{
    $2 = sinsert($2,repo)
    print >> "JB.patch"
    hit = 1
} 
(!hit) && JB{
       print >> "JB.patch"
}
