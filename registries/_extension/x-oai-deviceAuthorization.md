---
owner: baywet
issue:
description: A device authorization OAuth2 flow, used when targeting OpenAPI versions prior to 3.2.
schema:
  type: object
objects: [ "OAuth Flows Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `deviceAuthorization` field on OAuth Flows Objects to define a device authorization OAuth2 flow.

The `x-oai-deviceAuthorization` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to define a device authorization OAuth2 flow.

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
  securitySchemes:
    oauth2:
      type: oauth2
      flows:
        x-oai-deviceAuthorization:
          authorizationUrl: https://auth.example.com/authorize
          tokenUrl: https://auth.example.com/token
          x-oai-deviceAuthorizationUrl: https://auth.example.com/device
          scopes:
            read: Read access
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
