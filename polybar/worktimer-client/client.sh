#! /bin/bash

setStat() {
	curl -siL -X POST 127.0.0.1:4000 | grep -i state | sed -E 's/^State: ([a-z]*)\s*$/\1/g'
	if [[ $? -ne 0 ]]; then
		echo "Error SET"
	fi
	exit 0
}

getStat() {
	curl -siL 127.0.0.1:4000 | grep -i state | sed -E 's/^State: ([a-z]*)\s*$/\1/g'
	if [[ $? -ne 0 ]]; then
		echo "Error GET"
	fi
}

while getopts 's' flag; do
	case $flag in
	s) setStat
	esac
done

getStat
