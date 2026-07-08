---
owner: baywet
issue:
description: JSON Schema keywords exposed as OpenAPI Specification Extensions for versions that do not directly support them.
layout: default
---

{% capture summary %}
The `x-{{page.slug}}-` prefix is reserved for OpenAPI Specification Extensions that mirror JSON Schema keywords when targeting OpenAPI versions or JSON Schema dialects where those keywords are not directly available.

Extensions in this namespace are registered in the [OpenAPI Extension Registry](../extension/), like the `x-oai-` and `x-oas-` namespaces.
{% endcapture %}

{% include namespace-entry.md summary=summary %}
