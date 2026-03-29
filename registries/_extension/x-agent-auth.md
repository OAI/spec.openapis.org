---
owner: razashariff
issue:
description: Agent authentication extension for AI agent trust verification using signed trust tokens (ECDSA P-256).
schema:
  type: object
  properties:
    algorithm:
      type: string
    trustLevels:
      type: array
      items:
        type: string
    issuerKeysUrl:
      type: string
objects: [ "openApiObject", "operationObject" ]
layout: default
---

{% capture summary %}
The `x-agent-auth` extension declares agent authentication requirements for API endpoints. AI agents present signed trust tokens (JWT-structured, ECDSA P-256) that are verified locally using cached issuer public keys (JWKS pattern). Trust levels (L0-L4) gate access per endpoint. It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

Related per-endpoint extension: `x-agent-trust-required` (string, e.g. "L2") specifies the minimum trust level for a given operation.

References:
- [IETF draft-sharif-agent-payment-trust](https://datatracker.ietf.org/doc/draft-sharif-agent-payment-trust/) (trust level framework)
- [IETF draft-sharif-mcps-secure-mcp](https://datatracker.ietf.org/doc/draft-sharif-mcps-secure-mcp/) (MCP message signing)
- [Live demo](https://x-agent-auth.fly.dev/)
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.1.0
info:
  title: My API
  version: 1.0.0
x-agent-auth:
  algorithm: ES256
  trustLevels: [L0, L1, L2, L3, L4]
  issuerKeysUrl: /.well-known/agent-trust-keys
paths:
  /v1/charges:
    post:
      x-agent-trust-required: L2
```

Used by: (informational)

* [x-agent-auth.fly.dev](https://x-agent-auth.fly.dev/) (reference implementation)
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
