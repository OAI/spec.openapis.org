---
owner: baywet
issue:
description: The canonical absolute URI for an OpenAPI document, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: string
  format: uri
objects: [ "OpenAPI Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `self` field on OpenAPI Objects to identify the canonical absolute URI for an OpenAPI document.

The `x-oai-$self` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to identify the canonical absolute URI for an OpenAPI document.

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

Used by: (informational)

* [Microsoft.OpenApi](https://github.com/microsoft/OpenAPI.NET) (.NET OpenAPI library)
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.1.0
info:
  title: My API
  version: 1.0.0
x-oai-$self: https://example.org/api/openapi.json
paths: {}
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
