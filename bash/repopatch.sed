#sed for repo patch it
:top
/^project kernel/,/^project /{
w kernel.patch
d
b top
}
{
w JB.patch
}

