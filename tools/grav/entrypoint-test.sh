#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

for var in "$@" 
do 
  echo "[$var]";
  shift;
done


while getopts u:p: option 
do 
 case "${option}" 
 in 
 	extension) EXTENSION=${OPTARG};;
 	searchpath) SEARCHPATH=${OPTARG};;
 	lib) LIB=${OPTARG};;
	default) DEFAULT=${OPTARG};;
 esac 
done 
 
echo "Extension: [$EXTENSION]"
echo "Searchpath: [$SEARCHPATH]"
echo "Lib: [$LIB]"
echo "Default: [$DEFAULT]"