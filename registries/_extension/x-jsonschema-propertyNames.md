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
The JSON Schema `propertyNames` keyword defines a schema that applies to property names in an object.

The `x-jsonschema-propertyNames` extension mirrors the JSON Schema `propertyNames` keyword when targeting OpenAPI versions where the keyword is not directly available. It is serialized as `x-jsonschema-propertyNames` so tools can preserve and process property-name constraints.

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
