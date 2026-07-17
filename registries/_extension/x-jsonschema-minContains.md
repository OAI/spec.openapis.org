---
owner: baywet
issue:
description: The minimum number of array elements that must match contains, used when targeting OpenAPI versions that do not directly support minContains.
schema:
  type: integer
  minimum: 0
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema 2019-09 introduced the [`minContains`](https://json-schema.org/draft/2019-09/json-schema-validation#rfc.section.6.4.5) keyword to set the minimum number of array elements that must match `contains`.

The `x-jsonschema-minContains` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-minContains`.

Use this extension only with JSON Schema versions before 2019-09; 2019-09 and later define `minContains` directly.

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
    Roles:
      type: array
      items:
        type: string
      x-jsonschema-contains:
        const: admin
      x-jsonschema-minContains: 1
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
