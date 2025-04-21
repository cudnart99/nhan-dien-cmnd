#!/bin/bash

echo "🔹 Collect static files"
python3 server/manage.py collectstatic --noinput

echo "🚀 Starting Django server on 0.0.0.0:80"
python3 server/manage.py runserver --insecure 0.0.0.0:80
