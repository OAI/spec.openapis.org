---
owner: baywet
issue:
description: The JSON Schema examples annotation for Schema Objects, used when targeting OpenAPI versions that do not directly support it.
schema:
  type: array
  items: {}
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-06 introduced the [`examples`](https://json-schema.org/draft-06/json-schema-validation#rfc.section.6.4) annotation to provide an array of example values for a schema.

The `x-jsonschema-examples` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-examples`.

Use this extension only with JSON Schema versions before draft-06; draft-06 and later define `examples` directly.

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
    User:
      type: object
      properties:
        id:
          type: integer
        name:
          type: string
      x-jsonschema-examples:
        - id: 123
          name: Ada
        - id: 456
          name: Grace
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
