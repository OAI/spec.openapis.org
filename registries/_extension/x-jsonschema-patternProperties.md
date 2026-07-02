---
owner: baywet
issue:
description: A map of regular expressions to schemas for matching property names, used when targeting OpenAPI versions that do not directly support patternProperties.
schema:
  type: object
  additionalProperties:
    $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The `x-jsonschema-patternProperties` extension mirrors the JSON Schema `patternProperties` keyword by serializing it as `x-jsonschema-patternProperties` when targeting OpenAPI versions where `patternProperties` is not directly available.

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
      x-jsonschema-patternProperties:
        "^S_":
          type: string
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
