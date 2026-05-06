---
owner: mikekistler
issue:
description: Encoding properties for individual items in a multipart request part, used when targeting OpenAPI versions prior to 3.2.
schema:
  $ref: "#/$defs/encodingObject"
objects: [ "mediaTypeObject" ]
layout: default
---

{% capture summary %}
The `x-oai-itemEncoding` extension defines the encoding for individual items within a media type, applicable to multipart or array-based content. In OpenAPI 3.2, this becomes the native `itemEncoding` field on Media Type Objects.

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
