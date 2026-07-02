---
owner: baywet
issue:
description: The minimum number of array elements that must match contains, used when targeting OpenAPI versions that do not directly support minContains.
schema:
  type: integer
  minimum: 0
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema defines the `minContains` keyword to set the minimum number of array elements that must match `contains`.

The `x-jsonschema-minContains` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-minContains`.

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

Used by: (informational)

* [Microsoft.OpenApi](https://github.com/microsoft/OpenAPI.NET) (.NET OpenAPI library)
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.0.4
info:
  title: My API
  version: 1.0.0
paths: {}
components:
  schemas:
    Roles:
      type: array
      items:
        type: string
      x-jsonschema-contains:
        const: admin
      x-jsonschema-minContains: 1
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
