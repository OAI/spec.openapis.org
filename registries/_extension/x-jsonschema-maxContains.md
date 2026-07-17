---
owner: baywet
issue:
description: The maximum number of array elements that may match contains, used when targeting OpenAPI versions that do not directly support maxContains.
schema:
  type: integer
  minimum: 0
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema 2019-09 introduced the [`maxContains`](https://json-schema.org/draft/2019-09/json-schema-validation#rfc.section.6.4.4) keyword to set the maximum number of array elements that may match `contains`.

The `x-jsonschema-maxContains` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-maxContains`.

Use this extension only with JSON Schema versions before 2019-09; 2019-09 and later define `maxContains` directly.

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
      x-jsonschema-maxContains: 1
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
