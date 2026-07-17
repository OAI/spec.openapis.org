---
owner: baywet
issue:
description: The JSON Schema then conditional subschema, used with x-jsonschema-if when targeting OpenAPI versions that do not directly support it.
schema:
  $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-07 introduced the [`then`](https://json-schema.org/draft-07/json-schema-validation#rfc.section.6.6.2) keyword to define the subschema that applies when the `if` subschema matches.

The `x-jsonschema-then` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-then`.

Use this extension only with JSON Schema versions before draft-07; draft-07 and later define `then` directly.

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
      x-jsonschema-then:
        properties:
          postalCode:
            pattern: "^[0-9]{5}$"
        required:
          - postalCode
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
