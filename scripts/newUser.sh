#!/usr/bin/env bash
echo 'creating new users'
# Default values


usage() {
	echo "Usage: $0 [Options}"
	echo "Options:"
	echo "-h --help"
	echo "-a --add    adds files to user input"
	echo "-u --user   adds user to hosts directory"
	echo "-b --bagel  adds everything to host directory"
       	echo "We are adding a directory name to a new NIX Host"
}

addUser() {
	sudo mkdir /etc/nixos/hosts/$1
}
addFiles() {
	sudo cp -r /etc/nixos/hosts/default /etc/nixos/hosts/$1
}

has_argument() {
	[[ (("$1" == *=* && -n ${1#*=}) || ( ! -z "$2" && "$2" != -*)) && ($1 != 'default') ]];
}

# Function to handle options and arguments
handle_options() {
  while [ $# -gt 0 ]; do
    case $1 in
      -h | --help)
        usage
        exit 0
        ;;
      -a | --add)
	if ! has_argument $@; then
	  echo "User not Specified" > &2
	  usage
	  exit
	fi
	  addFiles $@ 
        ;;
      -u | --user)
        if ! has_argument $@; then
          echo "User not specified." >&2
          usage
          exit 1
        fi
          addUser $1
        shift
        ;;
      *)
        echo "Invalid option: $1" >&2
        usage
        exit 1
        ;;
    esac
    shift
  done
}

handle_options "$@"
