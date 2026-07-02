---
owner: mikekistler
issue:
description: A map of nested encoding definitions for an Encoding Object, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: object
  additionalProperties:
    $ref: "#/$defs/encodingObject"
objects: [ "Encoding Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `encoding` field on Encoding Objects to define nested encoding information.

The `x-oai-encoding` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to define nested encoding information on an Encoding Object.

Each key in the object is the name of a nested property and the value is an Encoding Object.

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
              type: object
              properties:
                file:
                  type: string
                  format: binary
            encoding:
              file:
                contentType: application/octet-stream
                x-oai-encoding:
                  nested:
                    contentType: text/plain
      responses:
        "200":
          description: Upload successful
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
