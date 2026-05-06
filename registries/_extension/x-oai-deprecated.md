---
owner: mikekistler
issue:
description: Indicates that a Security Scheme is deprecated, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: boolean
objects: [ "securitySchemeObject" ]
layout: default
---

{% capture summary %}
The `x-oai-deprecated` extension indicates that a Security Scheme Object is deprecated and SHOULD be transitioned out of usage. In OpenAPI 3.2, this becomes the native `deprecated` field on Security Scheme Objects.

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
components:
  securitySchemes:
    legacyApiKey:
      type: apiKey
      in: header
      name: X-API-Key
      x-oai-deprecated: true
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
