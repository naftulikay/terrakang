#!/usr/bin/make -f

refresh: init get
	terraform refresh
