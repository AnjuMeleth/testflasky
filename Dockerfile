FROM python:3.6-alpine

ARG FLASK_APP 
ARG FLASK_CONFIG 
RUN adduser -D flasky
USER flasky

WORKDIR /home/flasky

COPY requirements requirements
RUN python -m venv venv
RUN venv/bin/pip install -r requirements/docker.txt

COPY app app
COPY migrations migrations
COPY flasky.py config.py boot.sh ./
COPY data-dev.sqlite ./

# run-time configuration
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
