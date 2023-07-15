#!/usr/bin/env bash


export CONTAINER=$(cat /config.yaml \
	| grep container \
	| sed 's/^[ \t]*//;s/[ \t]*$//' \
    | tr -d '"' \
	| awk '{print $2}')

export SUB_DIR=$(cat /config.yaml \
	| grep subdirectory \
	| sed 's/^[ \t]*//;s/[ \t]*$//' \
    | tr -d '"' \
	| awk '{print $2}')
