#!/usr/bin/make -f

.PHONY: new_secret decrypt_secret encrypt_secret

ENCRYPTED_FILE:="encrypted-credentials.asc"
DECRYPTED_FILE:="decrypted-credentials"
ALLOWED_CHARS:='A-Za-z0-9%()+-:<=>?\^_~'

define n


endef

ifndef RECIPIENTS
$(error "RECIPIENTS is not set. Set it with e.g.: $n$n\
$$ export RECIPIENTS='--r me@naftuli.wtf --r me@smaslennikov.com --r more@examples.pizza'")
endif

new_secret: TR = $(shell if ! which gtr >/dev/null 2>&1; then echo tr; else echo gtr; fi)
new_secret:
	$(TR) -dc $(ALLOWED_CHARS) </dev/urandom | head -c 32 | gpg -ase $(RECIPIENTS) -o $(ENCRYPTED_FILE)

decrypt_secret:
	gpg -o $(DECRYPTED_FILE) -d $(ENCRYPTED_FILE)

encrypt_secret:
	gpg -ase $(RECIPIENTS) -o $(ENCRYPTED_FILE) $(DECRYPTED_FILE)
