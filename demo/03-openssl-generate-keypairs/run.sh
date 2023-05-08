#!/usr/bin/env bash

PRIVATE_KEY_FILE=products/private.pem
PUBLIC_KEY_FILE=products/public.pem

# ------------------------------------------------------------------------------

bash_cell 'generate a rsa private key' << END_CELL

# 2048-bit key, saved to file named private.pem
openssl genrsa -out ${PRIVATE_KEY_FILE} 2048

END_CELL

# ------------------------------------------------------------------------------

bash_cell 'generate a public key' << END_CELL

# Use the rsa option to produce a public version of your private RSA key
openssl rsa -in ${PRIVATE_KEY_FILE} -pubout > ${PUBLIC_KEY_FILE}

END_CELL

# ------------------------------------------------------------------------------