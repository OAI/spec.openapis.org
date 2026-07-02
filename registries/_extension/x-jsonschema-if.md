---
owner: baywet
issue:
description: The JSON Schema if conditional subschema, used when targeting OpenAPI versions that do not directly support it.
schema:
  $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The JSON Schema `if` keyword defines a conditional subschema that controls whether `then` or `else` applies.

The `x-jsonschema-if` extension mirrors the JSON Schema `if` keyword when targeting OpenAPI versions where the keyword is not directly available. It is serialized as `x-jsonschema-if` so tools can preserve and process the conditional subschema.

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
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
