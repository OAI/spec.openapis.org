---
owner: mikekistler
issue:
description: An identifier for a Server Object, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: string
objects: [ "serverObject" ]
layout: default
---

{% capture summary %}
The `x-oai-name` extension provides a unique identifier for a Server Object. In OpenAPI 3.2, this becomes the native `name` field on Server Objects.

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
servers:
  - url: https://api.example.com
    x-oai-name: production
    description: Production server
  - url: https://staging.example.com
    x-oai-name: staging
    description: Staging server
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
