#!/usr/bin/make -f

validate-account-id:
	@if [ -z "$(AWS_ACCOUNT_ID)" ]; then \
		echo "ERROR: No AWS account credentials detected." ; \
		exit 1 ; \
	fi
	@if [ "$(AWS_ACCOUNT_ID)" != "$(NAFTULI_ACCOUNT_ID)" ]; then \
		echo "ERROR: Your credentials are for an unknown AWS account ($(AWS_ACCOUNT_ID))." >&2 ; \
		exit 1 ; \
	fi

validate-terraform-version:
	@if [ "$(TERRAFORM_VERSION)" != "$(TERRAFORM_PINNED_VERSION)" ]; then \
		echo "ERROR: Detected Terraform version ($(TERRAFORM_VERSION)) does not match the pinned version ($(TERRAFORM_PINNED_VERSION))" >&2 ; \
		exit 1 ; \
	fi

validate: validate-account-id validate-terraform-version
