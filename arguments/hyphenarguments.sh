# Snippet to pass hyphenated options as arguments 
# Author: MuzammilM

options=$@

for argument in $options
  do
    case $argument in
        -a1=*|--arg1=*) VAR1=${argument/*=/""} ;;
        -a2=*|--arg2=*) VAR2=${argument/*=/""} ;;
        -f|--force)     f=y;shift;;
        *)              echo "No argument passed";;
    esac
done

if [ -z $VAR1 ];then
        :
else
echo Variable1 : $VAR1
fi
if [ -z $VAR2 ];then
        :
else
echo Variable2 : $VAR2
fi
if [[ $f == "y" ]];then
        echo "Force enabled"
else
        echo "Force disabled"
fi
