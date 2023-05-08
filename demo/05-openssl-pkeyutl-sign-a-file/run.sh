#!/usr/bin/env bash


PRIVATE_KEY_FILE=data/private.pem
PUBLIC_KEY_FILE=data/public.pem

MESSAGE_FILE=data/message.txt
MESSAGE_SIGNATURE_FILE=products/message.sig

# ------------------------------------------------------------------------------

bash_cell 'sign a file' << END_CELL

openssl pkeyutl -sign -in ${MESSAGE_FILE} -inkey ${PRIVATE_KEY_FILE} -out ${MESSAGE_SIGNATURE_FILE}

END_CELL

# ------------------------------------------------------------------------------

bash_cell 'verify a file' << END_CELL

openssl pkeyutl -verify -in ${MESSAGE_FILE} -sigfile ${MESSAGE_SIGNATURE_FILE} -pubin -inkey ${PUBLIC_KEY_FILE}

END_CELL

# ------------------------------------------------------------------------------
