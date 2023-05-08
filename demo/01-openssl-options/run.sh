#!/usr/bin/env bash

# ------------------------------------------------------------------------------

bash_cell 'show openssl version' << END_CELL

openssl version

END_CELL

# ------------------------------------------------------------------------------

bash_cell 'show openssl help' << END_CELL

openssl dgst -h 2>&1

END_CELL

# ------------------------------------------------------------------------------
