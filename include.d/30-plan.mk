#!/usr/bin/make -f

plan: get
	@terraform plan \
			-input=false \
			-no-color \
			-parallelism=$(TERRAFORM_PARALLELISM) \
			-out "$(TERRAFORM_PLAN_FILE)" |& \
		tee "$(TERRAFORM_PLAN_LOG_FILE)"
