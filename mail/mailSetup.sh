function isRoot () {
        if [ "$EUID" -ne 0 ]; then
                return 1
        fi
}
if ! isRoot; then
        echo "Sorry, Please run as root user to install packages"
        exit 1
fi
sudo apt-get update
sudo apt-get install ssmtp heirloom-mailx 
read -rp"Enter username: " -e USERNAME
read -srp"Enter password: " -e PASSWORD
echo -e "mailhub=smtp.gmail.com:465\nFromLineOverride=YES\nUseTLS=YES\nroot=$USERNAME\nAuthUser=$USERNAME\nAuthPass=$PASSWORD" > /etc/ssmtp/ssmtp.conf
if [ $# -lt 1 ]
then
        until [[ $USER_VAR =~ (y|n) ]]; do
        read -rp"Would you like to send a test mail? [y/n]: " -e -i y USER_VAR
        done
        if [[ $USER_VAR == "y" ]];then
                read -rp"Enter test mail recipient : " -e TOMAIL
                echo "Mail from "`curl ifconfig.me` | mail -r USER -s "Test Mail" $TOMAIL
                exit
        fi
elif [ "$1" == "notest" ]; then
        exit
elif [ "$1" == "testmail" ]; then
        if [ -z "$2" ]
        then
                read -rp"Enter test mail recipient : " -e TOMAIL
                echo "Mail from "`curl ifconfig.me` | mail -r USER -s "Test Mail" $TOMAIL
                exit
        else
                echo "Mail from "`curl ifconfig.me` | mail -r USER -s "Test Mail" $2
        fi
fi
