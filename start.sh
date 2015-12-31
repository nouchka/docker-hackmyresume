#!/bin/bash

if [ ! -f "$RESUME_FILE" ]; then
	hackmyresume NEW $RESUME_FILE
fi

hackmyresume VALIDATE $RESUME_FILE

if [ ! -d "/usr/local/lib/node_modules/hackmyresume/node_modules/fresh-themes/themes/$OUTPUT_TEMPLATE" ]; then
	npm install jsonresume-theme-$OUTPUT_TEMPLATE
	OUTPUT_TEMPLATE="node_modules/jsonresume-theme-$OUTPUT_TEMPLATE"
fi

hackmyresume build -t $OUTPUT_TEMPLATE $RESUME_FILE TO index.html

