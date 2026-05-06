---
owner: mikekistler
issue:
description: The device authorization URL for an OAuth2 flow (RFC 8628), used when targeting OpenAPI versions prior to 3.2.
schema:
  type: string
  format: uri
objects: [ "oauthFlowObject" ]
layout: default
---

{% capture summary %}
The `x-oai-deviceAuthorizationUrl` extension specifies the URL to be used for device authorization as defined in [RFC 8628](https://www.rfc-editor.org/rfc/rfc8628). In OpenAPI 3.2, this becomes the native `deviceAuthorizationUrl` field on OAuth Flow Objects.

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
