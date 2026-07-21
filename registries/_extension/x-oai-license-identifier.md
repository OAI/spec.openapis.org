---
owner: baywet
issue:
description: An SPDX license expression for a License Object, used when targeting OpenAPI versions prior to 3.1.
schema:
  type: string
objects: [ "License Object" ]
layout: default
---

{% capture summary %}
OpenAPI 3.1 introduced the `identifier` field on License Objects to identify a license using an SPDX license expression.

The `x-oai-license-identifier` extension brings this same capability to OpenAPI versions prior to 3.1, allowing you to identify a license using an SPDX license expression on a License Object.

Use this extension only with OpenAPI versions before 3.1; OpenAPI 3.1 and later define `identifier` directly. When using this extension, follow the same semantics as `identifier`: use an SPDX license expression and do not use it together with `url` for the same License Object.

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

Used by: (informational)

* [Microsoft.OpenApi](https://github.com/microsoft/OpenAPI.NET) (.NET OpenAPI library)
* [TypeSpec](https://github.com/microsoft/typespec) (API description language and tooling)
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.0.3
info:
  title: My API
  version: 1.0.0
  license:
    name: Apache 2.0
    x-oai-license-identifier: Apache-2.0
paths: {}
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
