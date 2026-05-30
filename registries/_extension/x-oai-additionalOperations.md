---
owner: mikekistler
issue:
description: Represents non-standard HTTP method operations on a Path Item when targeting OpenAPI versions prior to 3.2.
schema:
  type: object
  additionalProperties:
    $ref: "#/$defs/operationObject"
objects: [ "Path Item Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `additionalOperations` field on Path Item Objects to represent operations for HTTP methods that are not part of the standard set defined by the Path Item Object of the target OpenAPI version. For example, the non-standard `POLL` method has no standard operation in OpenAPI 3.2, so it can be represented as an entry in the `additionalOperations` field.

The `x-oai-additionalOperations` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to represent operations for HTTP methods that are not part of the standard set defined by the Path Item Object of the target OpenAPI version. For example, the HTTP QUERY method has no standard operation in OpenAPI 3.0 or 3.1, so it can be represented as an entry in the `x-oai-additionalOperations` extension.

Each key in the object is an HTTP method name (e.g. `QUERY`) and the value is an Operation Object.

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
  /search:
    x-oai-additionalOperations:
      QUERY:
        summary: Search with a request body
        requestBody:
          content:
            application/json:
              schema:
                type: object
                properties:
                  q:
                    type: string
        responses:
          "200":
            description: Search results
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
