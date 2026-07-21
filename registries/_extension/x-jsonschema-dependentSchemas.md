---
owner: baywet
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
JSON Schema 2019-09 introduced the [`dependentSchemas`](https://json-schema.org/draft/2019-09/json-schema-core#rfc.section.9.2.2.4) keyword to map property names to schemas that apply when the corresponding property is present.

The `x-jsonschema-dependentSchemas` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-dependentSchemas`.

Use this extension only with JSON Schema versions before 2019-09; 2019-09 and later define `dependentSchemas` directly.

Like the `x-jsonschema-` namespace, this extension is intended for OpenAPI 3.0 and earlier. When using OpenAPI 3.1 or later, the [OpenAPI `jsonSchemaDialect`](https://spec.openapis.org/oas/latest#specifying-schema-dialects) field, or JSON Schema's `"$schema"` keyword, should be used instead.

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
