#!/bin/bash

OPTS="-f --security.passphrase ""$FREELAN_PASSPHRASE"" --tap_adapter.ipv4_address_prefix_length $FREELAN_IP"
for i in $FREELAN_CONTACT; do
	OPTS="$OPTS --fscp.contact $i"
done

exec freelan2 $OPTS
