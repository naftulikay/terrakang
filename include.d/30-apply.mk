#!/usr/bin/make -f

apply: init get
	@terraform apply \
		-auto-approve \
		-input=false \
		-no-color \
		-parallelism=$(TERRAFORM_PARALLELISM)
