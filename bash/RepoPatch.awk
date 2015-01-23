#!/bin/awk -f
#
# modify input JB.patch generate by divpatch.awk to JBOK.patch
#
function sinsert(sorign,ssub) {
    aend = substr(sorign,3)
    apre = substr(sorign,0,3)
    sorign = apre ssub aend
    return sorign
}
BEGIN {system("rm -f 'JBOK.patch'")}
/^project / && NF == 2 {
    repo = $2
    hit = 0
}
/^diff / && NF ==4{
    $3 = sinsert($3,repo)
    $4 = sinsert($4,repo)
    print >> "JBOK.patch"
    hit = 1 
}
/^\+\+\+ / && NF == 2{
    $2 = sinsert($2,repo)
    print >> "JBOK.patch"
    hit = 1
} 
/^--- a/ && NF == 2{
    $2 = sinsert($2,repo)
    print >> "JBOK.patch"
    hit = 1
}
{
   if (hit == 0){
       print >> "JBOK.patch"
   }
   hit = 0
}
