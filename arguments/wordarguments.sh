COLOR='\033[1;36m'
reset=`tput sgr0`
if [ $# -lt 1 ]
then
        echo -e "${COLOR}`basename ${0}` : usage: deploy | restart${reset}"
        exit
fi

case "$1" in
deploy)
        if [ $# -lt 2 ]
                then
                echo "`basename ${0}` deploy jarName TopologyName"
                exit
        else
                echo "Deploying jar "$2
                echo "Topology : "$3
                echo "Killing existing topology"
        fi
;;
restart)
        if [ $# -lt 2 ]
                then
                echo "`basename ${0}` restart TopologyName"
                exit
        else
                echo "Topology : "$3
        fi
;;
*)  
        echo "`basename ${0}` : usage: deploy | restart" 
        exit 
;;

esac
