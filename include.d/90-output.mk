#!/usr/bin/make -f

output-json: init get
	@terraform output -json -no-color

output-plain: init get
	@terraform output -no-color

output: output-json
