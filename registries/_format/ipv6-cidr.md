---
owner: ChihweiLHBird
issue:
description: An IPv6 address in CIDR-style notation
base_type: string
layout: default
source_label: RFC 4291
source: https://www.rfc-editor.org/rfc/rfc4291#section-2.3
---

{% capture summary %}
The `{{page.slug}}` format represents an IPv6 address in CIDR notation, with the syntax described in [RFC4291](https://www.rfc-editor.org/rfc/rfc4291#section-2.3).

The address MUST be a valid `ipv6` address, and the prefix length MUST be a decimal integer from `0` to `128`, inclusive. A plain IPv6 address without a prefix length is not accepted.

Examples of valid values include `2001:db8::/32` and `::1/128`.
{% endcapture %}

{% include format-entry.md summary=summary %}
