#!/bin/bash

cur_dir=${PWD##*/}
if [ ! "$cur_dir" == "crowdsource-platform" ];
then
	echo "Run in root directory"
  exit 1
fi

# check if inside a virtual environment
in_env=$(
python - <<EOF
import sys;
if hasattr(sys, 'real_prefix'):
	print "yes"
else:
	print "no"
EOF
)

# deactivate current virtual environment
if [ "$in_env" == "yes" ];
then
	deactivate
fi

# remove directory venv, if exists
if [ -d "venv" ];
then
	rm -rf venv/
fi

# create a new virtual env, configured not to use external packages
virtualenv --no-site-packages venv

# source above created virtual env
source venv/bin/activate

pip install -r requirements.txt
