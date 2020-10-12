#!/usr/bin/make -f

.PHONY: debug
.DEFAULT_GOAL := debug

debug-aws:
	@echo "AWS Variables"
	@echo $(LONGBAR)
	@echo "AWS_ACCOUNT_ID=$(AWS_ACCOUNT_ID)"
	@echo "AWS_USER_NAME=$(AWS_USER_NAME)"
	@echo

debug-git:
	@echo "Git Variables"
	@echo $(LONGBAR)
	@echo "GIT_BASE_DIR=$(GIT_BASE_DIR)"
	@echo "GIT_BRANCH=$(GIT_BRANCH)"
	@echo "GIT_COMMIT=$(GIT_COMMIT)"
	@echo "GIT_COMMIT_SHORT=$(GIT_COMMIT_SHORT)"
	@echo

debug-naftuli:
	@echo "Naftuli Variables"
	@echo $(LONGBAR)
	@echo "NAFTULI_ACCOUNT_ID=$(NAFTULI_ACCOUNT_ID)"
	@echo "NAFTULI_REGION=$(NAFTULI_REGION)"
	@echo

debug-terraform:
	@echo "Terraform Variables"
	@echo $(LONGBAR)
	@echo "TERRAFORM_DIRECTORY=$(TERRAFORM_DIRECTORY)"
	@echo "TERRAFORM_PARALLELISM=$(TERRAFORM_PARALLELISM)"
	@echo "TERRAFORM_PINNED_VERSION=$(TERRAFORM_PINNED_VERSION)"
	@echo "TERRAFORM_PLAN_FILE=$(TERRAFORM_PLAN_FILE)"
	@echo "TERRAFORM_PLAN_LOG_FILE=$(TERRAFORM_PLAN_LOG_FILE)"
	@echo "TERRAFORM_PROJECT=$(TERRAFORM_PROJECT)"
	@echo "TERRAFORM_STATE_BUCKET=$(TERRAFORM_STATE_BUCKET)"
	@echo "TERRAFORM_STATE_KEY=$(TERRAFORM_STATE_KEY)"
	@echo "TERRAFORM_VERSION=$(TERRAFORM_VERSION)"
	@echo

debug: debug-aws debug-git debug-naftuli debug-terraform
