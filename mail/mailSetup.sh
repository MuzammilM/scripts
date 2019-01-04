#       Author: MuzammilM
#       Script that enables sending emails via gmail.
#       ./mailSetup.sh | prompts for username, password and test recipient mail address if desired.
#       ./mailSetup.sh notest | prompts for username, password ; does not send testmail
#       ./mailSetup.sh notest username | prompts for password ; does not send testmail
#       ./mailSetup.sh notest username password | no useraction required.
#       ./mailSetup.sh testmail |  prompts for username, password and test recipient mail address
#       ./mailSetup.sh testmail username | prompts for password and test recipient mail address
#       ./mailSetup.sh testmail username password | prompts for test recipient mail address
#       ./mailSetup.sh testmail username password recipientEmail | no useraction required ; sends a t
function isRoot () {
        if [ "$EUID" -ne 0 ]; then
                return 1
        fi
}
function install () {
if [ -z "$1" ]
then
        read -rp"Enter username: " -e USERNAME
        read -srp"Enter password: " -e PASSWORD
elif [ -z "$2" ]
then
        echo "Setting username to : "$1
        USERNAME=$1
        read -srp"Enter password: " -e PASSWORD
else
        echo "Setting username to : "$1
        echo "Setting password to : "$2
        USERNAME=$1
        PASSWORD=$2
fi
echo -e "\nInstalling ...."
sudo apt-get -y update
sudo apt-get install -y ssmtp heirloom-mailx
echo -e "mailhub=smtp.gmail.com:465\nFromLineOverride=YES\nUseTLS=YES\nroot=$USERNAME\nAuthUser=$USERNAME\nAuthPass=$PASSWORD" > /etc/ssmtp/ssmtp.conf
}
function testmail () {
        if [ -z "$1" ]
        then
                read -rp"Enter test mail recipient : " -e TOMAIL
        else
                TOMAIL=$1
        fi
        echo "Sending to :"$TOMAIL
        echo "Mail from "`curl -s ifconfig.me` | mail -r USER -s "Test Mail" $TOMAIL
}
if ! isRoot; then
        echo "Sorry, Please run as root user to install packages"
        exit 1
fi

if [ $# -lt 1 ]
then
        install
        until [[ $USER_VAR =~ (y|n) ]]; do
        read -rp"Would you like to send a test mail? [y/n]: " -e -i y USER_VAR
        done
        if [[ $USER_VAR == "y" ]];then
                testmail
        fi
elif [ "$1" == "notest" ]; then
        install $2 $3
        exit
elif [ "$1" == "testmail" ]; then
        install $2 $3
        testmail $4
else
        echo "Argument not supported"
fi
