if [ "$CONFIGURATION" == "AppStore" ]; then
filename="env-vars.sh"
elif [ "$CONFIGURATION" == "Release" ]; then
filename="env-vars-debug.sh"
else
filename="env-vars-debug.sh"
fi

#check if env-vars.sh exists
if [ -f ./APIKeys/$filename ]
then
source ./APIKeys/$filename
fi

#no `else` case needed if the CI works as expected
$PODS_ROOT/Sourcery/bin/sourcery --templates ./Sourcery/Stencils --sources ./DevOpsExample --output ./Sourcery/Output --args KEY1=$API_KEY_1,KEY2=$API_KEY_2,KEY3=$API_KEY_3

