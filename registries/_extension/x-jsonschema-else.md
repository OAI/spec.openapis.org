---
owner: baywet
issue:
description: The JSON Schema else conditional subschema, used with x-jsonschema-if when targeting OpenAPI versions that do not directly support it.
schema:
  $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-07 introduced the [`else`](https://json-schema.org/draft-07/json-schema-validation#rfc.section.6.6.3) keyword to define the subschema that applies when the `if` subschema does not match.

The `x-jsonschema-else` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-else`.

Use this extension only with JSON Schema versions before draft-07; draft-07 and later define `else` directly.

Although OpenAPI 3.0 used JSON Schema draft-07, it [prohibited this keyword](https://spec.openapis.org/oas/v3.0.4.html#json-schema-keywords), so use this extension with OpenAPI 3.0.

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
    Address:
      type: object
      properties:
        country:
          type: string
        postalCode:
          type: string
      x-jsonschema-if:
        properties:
          country:
            const: US
        required:
          - country
      x-jsonschema-else:
        properties:
          postalCode:
            minLength: 1
        required:
          - postalCode
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
