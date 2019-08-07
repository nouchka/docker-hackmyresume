#!/bin/bash

sleep 5

if [ ! -f "$RESUME_FILE" ]; then
	hackmyresume NEW $RESUME_FILE
fi

sed -i 's/###PHONE###/'$PHONE'/' $RESUME_FILE
sed -i 's/###EMAIL###/'$EMAIL'/' $RESUME_FILE
sed -i "s/###ADDRESS###/$ADDRESS/" $RESUME_FILE

hackmyresume VALIDATE $RESUME_FILE

if [ ! -d "/usr/local/lib/node_modules/hackmyresume/node_modules/fresh-themes/themes/$OUTPUT_TEMPLATE" ]; then
	if [ "$TEMPLATE_GIT" ]; then
		npm install $TEMPLATE_GIT
	else
		npm install jsonresume-theme-$OUTPUT_TEMPLATE
	fi
	OUTPUT_TEMPLATE="node_modules/jsonresume-theme-$OUTPUT_TEMPLATE"
fi

hackmyresume build -t $OUTPUT_TEMPLATE $RESUME_FILE TO index.all
