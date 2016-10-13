# docker-hackmyresume

[![Docker Hub repository](http://dockeri.co/image/nouchka/hackmyresume)](https://registry.hub.docker.com/u/nouchka/hackmyresume/)

[![](https://images.microbadger.com/badges/version/nouchka/hackmyresume.svg)](https://microbadger.com/images/nouchka/hackmyresume "Get your own version badge on microbadger.com")
[![Build Status](https://travis-ci.org/nouchka/docker-hackmyresume.svg?branch=master)](https://travis-ci.org/nouchka/docker-hackmyresume)

Docker image to build personal website with resume (Ex. https://japromis.katagena.com/)

# Versions

Version follows npm package version

* 1.0 (latest) (npm package version >=1.3.0 <2)

# Image

This image generates html / pdf file using npm package [hackmyresume](https://www.npmjs.com/package/hackmyresume).
[HackMyResume](http://please.hackmyresume.com/)  use standard format https://jsonresume.org/schema/ to generate the files.

[docker-hackmyresume-web](https://github.com/nouchka/docker-hackmyresume-web) extends this image with a webserver (nginx) for an all-in-one solution.

The entrypoint of the image checks:
* if json file is missing, generates one
* update personal datas missing in json (###PHONE###, ###EMAIL### and ###ADDRESS###)
* validate json file
* install missing template
* generate output resume

# Use

Use from command line, put your resume.json in /tmp/resume/ and file will be generate in same directory:

	docker run -e 'OUTPUT_TEMPLATE=kendall' \
		-e 'PHONE=+33602030405' \
		-e 'EMAIL=docker@katagena.com' \
		-e 'ADDRESS=25 Rue Delphin Loche' \
		-e 'DISPLAY=unix$DISPLAY' \
		-v /tmp/resume/:/usr/share/nginx/html/ \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		nouchka/hackmyresume
or use with docker compose:

	docker-compose up -d
Environment variables:

	# specify basic template or https://jsonresume.org/themes/ template (ex. kendall in docker-compose.yml, default: modern)
	OUTPUT_TEMPLATE=kendall
	# will replace ###PHONE### by this value
	PHONE=+33602030405
	# will replace ###EMAIL### by this value
	EMAIL=docker@katagena.com
	# will replace ###ADDRESS### by this value
	ADDRESS=25 Rue Delphin Loche
	# used with /tmp/.X11-unix to allow wkhtmltopdf to generate PDF. Can be remove if only html files needed.
	DISPLAY=unix$DISPLAY
	# specify a different json file
	RESUME_FILE=resume.json

# Todo

* Migrate docker-compose file format to version 2
* Add parameters to define path to resume.json file
