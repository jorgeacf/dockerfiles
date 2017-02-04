#!/bin/bash
set -e
set -o pipefail

SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
JOBS=${JOBS:-2}

build(){
	base=$1
	suite=$2
	build_dir=$3

	echo "Building ${REPO_URL}/${base}:${suite} for context ${build_dir}"
	docker build --rm --force-rm -t ${REPO_URL}/${base}:${suite} ${build_dir} || return 1
}

dofile(){
	f=$1
	image=${f%Dockerfile}
	base=${image%%\/*}
	build_dir=$(dirname $f)
	suite=${build_dir##*\/}

	if [[ -z "$suite" ]] || [[ "$suite" == "$base" ]]; then
		suite=latest
	fi

	{
		$SCRIPT build "${base}" "${suite}" "${build_dir}"
	} || {
		# add to errors
		echo "${base}:${suite}" >> $ERRORS
	}
}

main(){
	IFS=$'\n'
		files=( $(find tools/* -iname '*Dockerfile' | sed 's|./||' | sort) )
	unset IFS
	echo $files
	echo $SCRIPT

	build $files 

}

main