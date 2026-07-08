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
JSON Schema 2019-09 introduced the [`unevaluatedProperties`](https://json-schema.org/draft/2019-09/json-schema-core#unevaluatedProperties) keyword to apply a schema to object properties not already evaluated by adjacent keywords.

The `x-jsonschema-unevaluatedProperties` extension mirrors the JSON Schema `unevaluatedProperties` keyword by serializing it as `x-jsonschema-unevaluatedProperties` when targeting OpenAPI versions where `unevaluatedProperties` is not directly available.

Use this extension only with JSON Schema versions before 2019-09; 2019-09 and later define `unevaluatedProperties` directly.

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
    ExtensibleResource:
      type: object
      patternProperties:
        ^x-: true

    Invoice:
      type: object
      allOf:
        - $ref: '#/components/schemas/ExtensibleResource'
      properties:
        id:
          type: string
        total:
          type: number
          format: double
      x-jsonschema-unevaluatedProperties: false
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
