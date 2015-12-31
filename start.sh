#!/bin/bash

if [ ! -f "resume.json" ]; then
	hackmyresume NEW $RESUME_FILE
fi

hackmyresume VALIDATE $RESUME_FILE

## Wait for 1.3
## npm install jsonresume-theme-kendall

hackmyresume build -t $OUTPUT_FORMAT $RESUME_FILE TO index.html
