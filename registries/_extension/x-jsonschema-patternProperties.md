---
owner: baywet
issue:
description: A map of regular expressions to schemas for matching property names, used when targeting OpenAPI versions that do not directly support patternProperties.
schema:
  type: object
  additionalProperties:
    $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-03 introduced the [`patternProperties`](https://json-schema.org/draft-03/draft-zyp-json-schema-03.pdf#page=8) keyword to map regular expressions to schemas for matching property names.

The `x-jsonschema-patternProperties` extension mirrors the JSON Schema `patternProperties` keyword by serializing it as `x-jsonschema-patternProperties` when targeting OpenAPI versions where `patternProperties` is not directly available.

Use this extension only with JSON Schema versions before draft-03; draft-03 and later define `patternProperties` directly.

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
      x-jsonschema-patternProperties:
        "^S_":
          type: string
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
