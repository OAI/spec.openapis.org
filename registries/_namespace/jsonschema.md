---
owner: OAI
issue:
description: JSON Schema keywords exposed as OpenAPI Specification Extensions for versions that do not directly support them.
layout: default
registry: ../extension/index.html
---

{% capture summary %}
The `x-{{page.slug}}-` prefix is intended for version 3.0 and earlier of the OpenAPI Specification, as those versions do not support changing the JSON Schema dialect for their Schema Objects. When using OpenAPI 3.1 or later, the [OpenAPI jsonSchemaDialect](https://spec.openapis.org/oas/latest#specifying-schema-dialects) field, or JSON Schema's `"$schema"` keyword, should be used instead.

Extensions in this namespace are registered in the [OpenAPI Extension Registry](../extension/), like the `x-oai-` and `x-oas-` namespaces.
{% endcapture %}

{% include namespace-entry.md summary=summary %}
