---
owner: mikekistler
issue:
description: The device authorization URL for an OAuth2 flow (RFC 8628), used when targeting OpenAPI versions prior to 3.2.
schema:
  type: string
  format: uri
objects: [ "OAuth Flow Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.2 introduced the `deviceAuthorizationUrl` field on OAuth Flow Objects to specify the URL to be used for device authorization as defined in [RFC 8628](https://www.rfc-editor.org/rfc/rfc8628).

The `x-oai-deviceAuthorizationUrl` extension brings this same capability to OpenAPI versions prior to 3.2, allowing you to specify the device authorization URL for an OAuth2 flow.

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
    oauth2:
      type: oauth2
      flows:
        clientCredentials:
          tokenUrl: https://auth.example.com/token
          x-oai-deviceAuthorizationUrl: https://auth.example.com/device
          scopes:
            read: Read access
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
