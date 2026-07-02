---
owner: mikekistler
issue:
description: A map of schemas that apply when corresponding properties are present, used when targeting OpenAPI versions that do not directly support dependentSchemas.
schema:
  type: object
  additionalProperties:
    $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The JSON Schema `dependentSchemas` keyword maps property names to schemas that apply when the corresponding property is present.

The `x-jsonschema-dependentSchemas` extension mirrors the JSON Schema `dependentSchemas` keyword when targeting OpenAPI versions where the keyword is not directly available. It is serialized as `x-jsonschema-dependentSchemas` so tools can preserve and process dependent schemas.

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
    Payment:
      type: object
      properties:
        creditCard:
          type: string
        billingAddress:
          type: string
      x-jsonschema-dependentSchemas:
        creditCard:
          required:
            - billingAddress
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
