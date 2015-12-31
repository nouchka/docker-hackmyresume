# docker-hackmyresume
Docker image to build personal website with resume. Need nginx to run the website, this docker image generates the files.

docker-compose up

ENV OUTPUT_TEMPLATE specify basic template or https://jsonresume.org/themes/ template (ex. kendall in docker-compose.yml, default: modern)

ENV RESUME_FILE specify a different resume file (default: resume.json)

VOLUME /usr/share/nginx/html/

Change URL of your resume.json in docker-compose.yml to download an other resume or mount directory /usr/share/nginx/html/ to a local directory.

