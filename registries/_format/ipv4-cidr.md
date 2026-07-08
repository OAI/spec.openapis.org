---
owner: ChihweiLHBird
issue:
description: An IPv4 address in CIDR notation
base_type: string
layout: default
source_label: RFC 4632
source: https://www.rfc-editor.org/rfc/rfc4632#section-3.1
---

{% capture summary %}
The `{{page.slug}}` format represents an IPv4 address in CIDR notation, with the address and prefix-length syntax described in [RFC4632](https://www.rfc-editor.org/rfc/rfc4632#section-3.1).

The address MUST be a valid `ipv4` address, and the prefix length MUST be a decimal integer from `0` to `32`, inclusive. A plain IPv4 address without a prefix length is not accepted.

Examples of valid values include `10.0.0.0/8` and `192.168.1.0/24`.
{% endcapture %}

{% include format-entry.md summary=summary %}
