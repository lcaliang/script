#sed -f bash/reoppatch.awk testcase/20141029-20141222.patch
/^project kernel/,/^project /{
w kernel.patch
d
n
}
{
w JB.patch
}
