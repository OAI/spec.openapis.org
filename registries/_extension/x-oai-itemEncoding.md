---
owner: mikekistler
issue:
description: Encoding properties for individual items in a multipart request part, used when targeting OpenAPI versions prior to 3.2.
schema:
  $ref: "#/$defs/encodingObject"
objects: [ "mediaTypeObject", "encodingObject" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `itemEncoding` field on Media Type Objects to define the encoding for individual items within a media type, applicable to multipart or array-based content.

The `x-oai-itemEncoding` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to define the encoding for individual items within a media type.

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
            x-oai-itemEncoding:
              contentType: application/octet-stream
      responses:
        "200":
          description: Upload successful
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
