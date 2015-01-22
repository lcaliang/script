/^project / && NF == 2 {
    #print $2
    repo = $2
}
/^diff / && NF ==4{
    aend = substr($3,3)
    apre = substr($3,0,3)
    bend = substr($4,3)
    bpre = substr($4,0,3)
    $3 = apre repo aend
    $4 = bpre repo bend
    #print 
}
/^\+\+\+ / && NF == 2{
    aend = substr($2,3)
    apre = substr($2,0,3)
    $2 = apre repo aend
    print
} 
/^--- a/ && NF == 2{
    aend = substr($2,3)
    apre = substr($2,0,3)
    $2 = apre repo aend
    #print
} 
