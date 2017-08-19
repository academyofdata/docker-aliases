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

And of course you can adjust or add new functions according to your needs. For instance if you work a lot with containers running Apache Cassandra you will typically log into the container and start cqlsh. This means that you could define a function to do directly that

```
function docql(){
    docker exec -ti "$1" cqlsh
}
```

Subsequently just type ```docql cassnode01``` to drop into a cqlsh prompt on container called 'cassnode01'

One other frequent command that people use is typing 'docker inspect' to get a container's IP address. Here's a function that does exactly that

```
function getip(){
    docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}
```
After you get this in your .bash_aliases you can type ```getip mysql``` to get the IP of a container called mysql

***NOTE***
If you want to make these functions and aliases available to all users on the system, simply define these functions in a file that is executed for all users, such as /etc/profile




