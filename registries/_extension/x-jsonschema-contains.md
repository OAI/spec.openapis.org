---
owner: baywet
issue:
description: The JSON Schema contains subschema for array elements, used when targeting OpenAPI versions that do not directly support it.
schema:
  $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-06 introduced the [`contains`](https://json-schema.org/draft-06/json-schema-validation#rfc.section.6.14) keyword to describe a subschema that at least one array element should match.

The `x-jsonschema-contains` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-contains`.

Use this extension only with JSON Schema versions before draft-06; draft-06 and later define `contains` directly.

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
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
