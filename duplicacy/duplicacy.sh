#!/bin/bash

PATH_DUPLICACY=~/.duplicacy-web/repositories/localhost/0

(cd $PATH_DUPLICACY && duplicacy backup)
