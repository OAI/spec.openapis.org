---
owner: baywet
issue:
description: The JSON Schema unevaluatedProperties keyword, used when targeting OpenAPI versions that do not directly support it.
schema:
  oneOf:
    - type: boolean
    - $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The `x-jsonschema-unevaluatedProperties` extension mirrors the JSON Schema `unevaluatedProperties` keyword by serializing it as `x-jsonschema-unevaluatedProperties` when targeting OpenAPI versions where `unevaluatedProperties` is not directly available.

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
    User:
      type: object
      allOf:
        - type: object
          properties:
            id:
              type: string
      x-jsonschema-unevaluatedProperties: false
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
