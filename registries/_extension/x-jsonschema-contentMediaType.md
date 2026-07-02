---
owner: mikekistler
issue:
description: The JSON Schema contentMediaType annotation, used when targeting OpenAPI versions that do not directly support it.
schema:
  type: string
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema defines the `contentMediaType` annotation to describe the media type of a string value's decoded content.

The `x-jsonschema-contentMediaType` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-contentMediaType`.

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
