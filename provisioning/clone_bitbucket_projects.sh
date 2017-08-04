#! /usr/bin/env bash

function git_clone {
    repo=$1
    # only do a git clone if the directory for the project doesn't exist
    if [ ! -d /repos/${repo}/ ]; then
        git clone ssh://git@bitbucket.scm.otto.de/bestand/${repo}.git /repos/${repo}/
    fi
}

mkdir -p /repos

git_clone "intrastat"
git_clone "cd-server"
