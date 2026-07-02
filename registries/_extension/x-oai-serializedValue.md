---
owner: mikekistler
issue:
description: A serialized example value for an Example Object, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: string
objects: [ "Example Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `serializedValue` field on Example Objects to provide already-serialized example data.

The `x-oai-serializedValue` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to provide already-serialized example data on an Example Object.

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
    csvExample:
      summary: A CSV example
      x-oai-serializedValue: "id,name\n1,Ada"
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
