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
The JSON Schema `then` keyword defines the subschema that applies when the `if` subschema matches.

The `x-jsonschema-then` extension mirrors the JSON Schema `then` keyword when targeting OpenAPI versions where the keyword is not directly available. It is serialized as `x-jsonschema-then` so tools can preserve and process the conditional subschema alongside `x-jsonschema-if`.

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
