#!/usr/bin/env bash

TRO_JSONLD_FILE=products/tro.jsonld

# ------------------------------------------------------------------------------

bash_cell 'digest of a file' << END_CELL

openssl dgst -sha256 data/message.txt | cut -d" " -f 2

END_CELL

# ------------------------------------------------------------------------------

bash_cell 'create tro declaration containing the digest of data' << END_CELL

# Create tro.jsonld
cat > ${TRO_JSONLD_FILE} << EOF
{
    "@context": [{
        "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
        "trov": "https://w3id.org/trace/2022/10/trov#"
    }],

    "@graph": [{

        "@id": "trov:tro/01",
        "@type": "trov:ResearchObject",

        "trov:generatedBySystem": { "@id": "trov:system/01" },
        "trov:digest": "$(openssl dgst -sha256 data/message.txt | cut -d" " -f 2)",
        "trov:troFilePath": "products/message.tar.gz"
    }]
}
EOF

END_CELL

# ------------------------------------------------------------------------------