#!/bin/bash
source myprojectenv/bin/activate
export FLASK_APP=flasky.py
flask run --host 0.0.0.0
