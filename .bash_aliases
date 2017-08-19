#docker helper functions
alias dps='docker ps -a'
function dosh(){
    docker exec -ti "$1" bash
}
function dolog(){
    docker logs --tail=10 -f "$1"
}
function getip(){
    docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}
