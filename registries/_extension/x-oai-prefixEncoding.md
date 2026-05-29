---
owner: mikekistler
issue:
description: Encoding properties applied before the item encoding in a multipart request part, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: array
  items:
    $ref: "#/$defs/encodingObject"
objects: [ "mediaTypeObject" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `prefixEncoding` field on Media Type Objects to define an ordered list of encodings applied before the item encoding within a media type.

The `x-oai-prefixEncoding` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to define an ordered list of encodings applied before the item encoding.

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
            x-oai-prefixEncoding:
              - contentType: application/json
      responses:
        "200":
          description: Upload successful
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
