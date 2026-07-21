---
owner: baywet
issue:
description: The JSON Schema contentMediaType annotation, used when targeting OpenAPI versions that do not directly support it.
schema:
  type: string
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-07 introduced the [`contentMediaType`](https://json-schema.org/draft-07/json-schema-validation#rfc.section.8.4) annotation to describe the media type of a string value's decoded content.

The `x-jsonschema-contentMediaType` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-contentMediaType`.

Use this extension only with JSON Schema versions before draft-07; draft-07 and later define `contentMediaType` directly.

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
    PngImage:
      type: string
      x-jsonschema-contentEncoding: base64
      x-jsonschema-contentMediaType: image/png
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
