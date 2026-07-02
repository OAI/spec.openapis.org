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
The JSON Schema `else` keyword defines the subschema that applies when the `if` subschema does not match.

The `x-jsonschema-else` extension mirrors the JSON Schema `else` keyword when targeting OpenAPI versions where the keyword is not directly available. It is serialized as `x-jsonschema-else` so tools can preserve and process the conditional subschema alongside `x-jsonschema-if`.

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
