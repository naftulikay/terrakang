#!/usr/bin/make -f

include $(shell git rev-parse --show-toplevel)/terraform-config.mk

ifeq ($(TERRAFORM_PROVIDER),aws)
AWS_USER := $(shell aws iam get-user 2>/dev/null)
AWS_ACCOUNT_ID := $(shell echo '$(AWS_USER)' | jq -r '.User.Arn' 2>/dev/null | awk -F : '{print $$5;}')
AWS_USER_NAME := $(shell echo '$(AWS_USER)' | jq -r '.User.UserName' 2>/dev/null)
endif

GIT_BASE_DIR := $(shell git rev-parse --show-toplevel)
GIT_BRANCH := $(shell git symbolic-ref -q --short HEAD || echo ${TRAVIS_BRANCH:-unknown})
GIT_COMMIT := $(shell git rev-parse HEAD)
GIT_COMMIT_SHORT := $(shell git rev-parse --short HEAD)

LONGBAR_LENGTH := 64
LONGBAR := $(shell python -c "import sys; sys.stdout.write('-'.join(map(lambda i: '', range($(LONGBAR_LENGTH)))) + '\n')")

TERRAFORM_DIRECTORY := $(shell pwd)/.terraform
TERRAFORM_PARALLELISM := 100
TERRAFORM_PINNED_VERSION := 0.11.7
TERRAFORM_PLAN_FILE := $(TERRAFORM_DIRECTORY)/terraform.tfplan
TERRAFORM_PLAN_LOG_FILE := $(TERRAFORM_DIRECTORY)/terraform.tfplan.txt
TERRAFORM_PROJECT := $(shell pwd | sed 's|^$(GIT_BASE_DIR)||' | cut -b 2-)
TERRAFORM_STATE_BUCKET := BUCKET_NAME
TERRAFORM_STATE_FILE := $(TERRAFORM_DIRECTORY)/terraform.tfstate
TERRAFORM_STATE_PREFIX := $(TERRAFORM_DIRECTORY)
TERRAFORM_STATE_KEY := $(TERRAFORM_DIRECTORY).tfstate
TERRAFORM_VERSION := $(shell terraform -version |& head -1 | grep -oP '(?<=v)(\d+\.\d+\.\d+)')
