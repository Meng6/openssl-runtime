#!/usr/bin/env bash

PRIVATE_KEY_FILE=data/private.pem
PUBLIC_KEY_FILE=data/public.pem

MESSAGE_FILE=data/message.txt
SIGNED_MESSAGE_FILE=products/message.txt.sha1

# ------------------------------------------------------------------------------

bash_cell 'sign a tro declaration' << END_CELL

openssl dgst -sha256 \
  -sign ${PRIVATE_KEY_FILE} \
  -out ${SIGNED_MESSAGE_FILE} \
  ${MESSAGE_FILE}

END_CELL

# ------------------------------------------------------------------------------

bash_cell 'verify the signed tro declaration' << END_CELL

openssl dgst -sha256 \
  -verify ${PUBLIC_KEY_FILE} \
  -signature ${SIGNED_MESSAGE_FILE} \
  ${MESSAGE_FILE}

END_CELL

# ------------------------------------------------------------------------------