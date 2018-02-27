#!/bin/bash

case "$1" in
    '')
	sleep inf
	;;
    *)
	/opt/scripts/$*
	;;
esac
