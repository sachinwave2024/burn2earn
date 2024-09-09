#!/bin/bash

NAME="django_app"                                   # Name of the application

DJANGODIR=/var/www/html/jasonwellnessenv/jason_wellness
             # Django project directory
SOCKFILE=/var/www/html/jasonwellnessenv/run/gunicorn.sock  # we will communicte using this unix socket
USER=root                                         # the user to run as
GROUP=root                                        # the group to run as
NUM_WORKERS=3                                       # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=jason_wellness.settings      # which settings file should Django use
DJANGO_WSGI_MODULE=jason_wellness.wsgi              # WSGI module name
echo "Starting $NAME as `whoami`"

# Activate the virtual environment

cd $DJANGODIR
source /var/www/html/jasonwellnessenv/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist

RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)

exec gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --bind=unix:$SOCKFILE \
  --log-level=debug \
  --log-file=-
