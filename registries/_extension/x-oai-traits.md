---
owner: ralfhandl
issue:
description: Identify in an OpenAPI Description where Overlay updates should be applied.
schema:
  type: array
  items:
    type: string
layout: default
---

{% capture summary %}
The `x-oai-traits` extension is used to identify places in an OpenAPI Description where Overlay updates should be applied. Its value is an array of strings, each string identifying a feature that an Overlay should apply.
{% endcapture %}

{% capture example %}
See:

* [Traits Example in Overlay Specification](https://spec.openapis.org/overlay/v1.0.0.html#traits-example)
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}  
