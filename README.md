### Prune
is a small bash script for compiling and running a C++ program on save.
It allows for fast debugging and lets you see the changes you make immediately.
##### Set up
To set up prune, run

`wget https://raw.githubusercontent.com/crt0o/prune/master/prune.sh`

from your project folder and install the dependencies with 

`sudo apt-get update`

`sudo apt-get install inotify-tools findutils gcc`

##### How to use 
You can run prune with

`chmod +x prune.sh`

`./prune.sh` 

or

`bash prune.sh`

After you make a change to one of your project files, prune will compile all .cpp files together using `g++` and, if no errors are found, run the resulting binary.
