# A few useful docker aliases

If you work long enough with docker containers (and only work from the command-line) you might be tired of typing ```docker ps -a``` to get a list of all containers
or ```docker exec -ti container_name bash``` to log into the container named 'container_name'. 

If so, here are three functions/aliases that you can define and drastically reduce your typing. If you have bash as your shell, you can put these in a file called .bash_aliases in your home directory

```
#docker helper functions
alias dps='docker ps -a'
function dosh(){
    docker exec -ti "$1" bash
}
function dolog(){
    docker logs --tail=10 -f "$1"
}
```

With these three aliases you can type ```dps``` instead of ```docker ps -a```. Or type ```dosh node01``` to log into a container called 'node01'. Or ```dolog nginx``` to get a tail on the logs of a container called 'nginx'.



