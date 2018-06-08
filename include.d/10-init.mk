#!/usr/bin/make -f

SHELL:=$(shell which bash)

init: validate
	@# if no plugins are found or the S3 remote config isn't expected, initialize
	@if ! find ".terraform" -type f 2>/dev/null | grep -qP 'terraform-provider-aws' || \
	    [ "$$(jq -r .backend.type "$(TERRAFORM_STATE_FILE)")" != "s3" ] || \
	    [ "$$(jq -r .backend.config.bucket "$(TERRAFORM_STATE_FILE)")" != "$(TERRAFORM_STATE_BUCKET)"  ] || \
	    [ "$$(jq -r .backend.config.key "$(TERRAFORM_STATE_FILE)")" != "$(TERRAFORM_STATE_KEY)" ]; then \
		terraform init -input=true -no-color -backend-config="bucket=$(TERRAFORM_STATE_BUCKET)" \
			-backend-config="key=$(TERRAFORM_STATE_KEY)" ; \
	else \
		terraform init -backend=false -get-plugins=true >/dev/null ; \
	fi
