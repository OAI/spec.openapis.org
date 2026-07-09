---
owner: baywet
issue:
description: A schema applied to property names in an object, used when targeting OpenAPI versions that do not directly support propertyNames.
schema:
  $ref: "#/$defs/schemaObject"
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
JSON Schema draft-06 introduced the [`propertyNames`](https://json-schema.org/draft-06/json-schema-validation#rfc.section.6.22) keyword to define a schema that applies to property names in an object.

The `x-jsonschema-propertyNames` extension mirrors this JSON Schema keyword when targeting OpenAPI versions where the keyword is not directly available, serializing it as `x-jsonschema-propertyNames`.

Use this extension only with JSON Schema versions before draft-06; draft-06 and later define `propertyNames` directly.

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
    Metadata:
      type: object
      additionalProperties:
        type: string
      x-jsonschema-propertyNames:
        pattern: "^[a-z_]+$"
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
