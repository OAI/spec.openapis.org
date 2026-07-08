---
owner: baywet
issue:
description: The JSON Schema $anchor identifier for a schema resource, used when targeting OpenAPI versions that do not directly support it.
schema:
  type: string
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The `x-jsonschema-$anchor` extension mirrors the JSON Schema `$anchor` keyword by serializing it as `x-jsonschema-$anchor` when targeting OpenAPI versions where `$anchor` is not directly available.

Use this extension only with JSON Schema versions before 2019-09; 2019-09 and later define [`$anchor`](https://json-schema.org/draft/2019-09/json-schema-core#anchor) directly.

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
      x-jsonschema-$anchor: User
      properties:
        id:
          type: string
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
