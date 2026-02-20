# assembly_rev_shell.asm
this is a very basic assembly-based reverse shell 


This was created for an assignment in CSC-848, but I will probably re-use it again, so I wanted to store it somewhere. Maybe another pen tester can also use it.

This uses execve syscall with /bin/nc 127.0.0.1 443. It assumes /bin/nc is a working path. 

Enjoy. 
