#!/bin/bash

# Replace with your session ID for tickets.events.ccc.de
SESSIONID="";
# Replace with your email address
EMAIL="";

curl_command="curl -s 'https://tickets.events.ccc.de/' -i -H 'Cookie: sessionid=$SESSIONID'";
mail_command="mail -s 'Camp tickets are available' $EMAIL <<< 'Check tickets.events.ccc.de'";
eval_result=`eval $curl_command`;

if [[ $eval_result == *login* ]]
then
	echo "You didn't properly configure the script lol";
	exit;
fi

if [[ $eval_result != *whoops* ]]
then
	eval $mail_command;
	echo "Tickets available :-)";
else
	echo "Tickets not available :-("
fi
