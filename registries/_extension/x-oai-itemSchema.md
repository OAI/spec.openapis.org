---
owner: mikekistler
issue:
description: Schema for individual items in a multipart request part, used when targeting OpenAPI versions prior to 3.2.
schema:
  $ref: "#/$defs/schemaObject"
objects: [ "Media Type Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `itemSchema` field on Media Type Objects to define the schema for individual items within a media type, applicable to multipart or array-based content.

The `x-oai-itemSchema` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to define the schema for individual items within a media type.

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

Used by: (informational)

* [Microsoft.OpenApi](https://github.com/microsoft/OpenAPI.NET) (.NET OpenAPI library)
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.1.0
info:
  title: My API
  version: 1.0.0
paths:
  /upload:
    post:
      requestBody:
        content:
          multipart/form-data:
            schema:
              type: array
              items:
                type: string
                format: binary
            x-oai-itemSchema:
              type: string
              format: binary
      responses:
        "200":
          description: Upload successful
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
