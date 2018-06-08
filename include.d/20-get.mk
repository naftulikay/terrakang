#!/usr/bin/make -f

get: init
	@if ! terraform get -no-color . >/dev/null ; then \
		terraform get -no-color . ; \
	fi
