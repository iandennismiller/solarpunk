#!/bin/bash
# (cc) 2016 diamond-patterns

LOGIN=covid-web
HOSTNAME=somewhere.pool.example.com

echo "This script will set up git hooks on a remote git repository."
ssh ${LOGIN}@${HOSTNAME} "cp ~/site/_bin/publish.sh ~/site.git/hooks/post-receive"
