---
owner: baywet
issue:
description: A structured example value for an Example Object, used when targeting OpenAPI versions prior to 3.2.
schema: {}
objects: [ "Example Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the [`dataValue`](https://spec.openapis.org/oas/v3.2.0.html#example-data-value) field on Example Objects to provide structured example data as any JSON value.

The `x-oai-dataValue` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to provide structured example data on an Example Object.

Use this extension only with OpenAPI versions before 3.2; OpenAPI 3.2 and later define `dataValue` directly.

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
paths: {}
components:
  examples:
    userExample:
      summary: A user example
      x-oai-dataValue:
        id: 123
        name: Ada
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
