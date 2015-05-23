#! /bin/sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
ansible-playbook -i hosts -vv elixlr.yaml
