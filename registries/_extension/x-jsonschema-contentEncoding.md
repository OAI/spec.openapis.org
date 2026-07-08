---
owner: baywet
issue:
description: The JSON Schema contentEncoding annotation, used when targeting OpenAPI versions that do not directly support it.
schema:
  type: string
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-07 introduced the [`contentEncoding`](https://json-schema.org/draft-07/json-schema-validation#rfc.section.8.3) annotation to describe how a string value is encoded.

The `x-jsonschema-contentEncoding` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-contentEncoding`.

Use this extension only with JSON Schema versions before draft-07; draft-07 and later define `contentEncoding` directly.

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
    ImageData:
      type: string
      x-jsonschema-contentEncoding: base64
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
