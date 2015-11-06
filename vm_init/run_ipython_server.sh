#!/usr/bin/env bash

#From http://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
pypathadd() {
    if [ -d "$1" ] && [[ ":PYTHONPATH:" != *":$1:"* ]]; then
        export PYTHONPATH="${PYTHONPATH:+"PYTHONPATH:"}$1"
    fi
}

pypathadd /vagrant/src
cd /vagrant/notebooks/
ipython notebook --ip=0.0.0.0 --no-browser
