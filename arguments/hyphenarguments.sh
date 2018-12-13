# This snippet allows you to pass command line hyphen arguments
options=$@
for argument in $options
  do
    case $argument in
      --arg1=*)           VAR1=${argument/*=/""} ;;
      --arg2=*)           VAR2=${argument/*=/""} ;;
    esac
done

echo Variable1 : $VAR1
echo Variable2 : $VAR2
