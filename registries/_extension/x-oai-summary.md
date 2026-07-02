---
owner: mikekistler
issue:
description: A short summary for a Response Object, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: string
objects: [ "Response Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `summary` field on Response Objects to provide a short summary of a response.

The `x-oai-summary` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to provide a short summary of a response.

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
  /widgets:
    get:
      responses:
        "200":
          description: A list of widgets
          x-oai-summary: Widget list
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
