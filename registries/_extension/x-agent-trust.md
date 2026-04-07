---
owner: razashariff
issue:
description: Trust-level metadata block for agent-authenticated security schemes. Required by `apiKey` security schemes that use `Agent-Signature` as the header. Carries algorithm, trust level vocabulary, and JWKS endpoint for local verification.
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
objects: [ "securitySchemeObject" ]
layout: default
---

{% capture summary %}
The `x-agent-trust` extension carries trust-level metadata for agent authentication. It is intended to be used as a property of a Security Scheme Object of `type: apiKey` whose header is `Agent-Signature`. For such schemes, the `x-agent-trust` field is required for correct behaviour: it tells tooling which signing algorithm is in use, which trust-level vocabulary is recognised, and where the issuer's public keys can be resolved (JWKS). This dependency is documented here in prose since the OpenAPI grammar does not allow a base `apiKey` scheme to mandate the presence of an extension field.

The extension may also be used alongside other security schemes when the `Agent-Signature` header is sent in addition to a primary credential (for example a traditional `apiKey` or `oauth2` scheme).

When the parent security scheme is referenced from a Security Requirement Object, the `scopes` array entries are interpreted as the **minimum trust level** required for the operation (for example `[ "L3" ]`). This reuses the existing `scopes` array shape so that current OpenAPI tooling can display and reason about the requirement without grammar changes.

**Note:** the `Agent-Signature` HTTP header should not be declared as a regular operation parameter. Doing so produces contradictions with the security layer and unclear runtime behaviour. Declare it via the `apiKey` security scheme as shown below.

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

References:
- [IETF draft-sharif-agent-identity-framework](https://datatracker.ietf.org/doc/draft-sharif-agent-identity-framework/) (umbrella framework, threat model, IANA Field Name Registration for `Agent-Signature` and `Agent-Passport-Id`)
- [IETF draft-sharif-mcps-secure-mcp](https://datatracker.ietf.org/doc/draft-sharif-mcps-secure-mcp/) (MCP message signing)
- [RFC 8941](https://www.rfc-editor.org/rfc/rfc8941) (HTTP Structured Fields, the format of the `Agent-Signature` header)
- [RFC 7517](https://www.rfc-editor.org/rfc/rfc7517) (JSON Web Key, JWKS)
- [RFC 7638](https://www.rfc-editor.org/rfc/rfc7638) (JWK Thumbprint, used as `keyid` value)
- [Live demo](https://x-agent-auth.fly.dev/) (sign + verify, with HTTP wire format and tamper test)
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.1.0
info:
  title: My API
  version: 1.0.0
components:
  securitySchemes:
    AgentTrust:
      type: apiKey
      description: Uses agent trust information in lieu of a traditional API key. Requires the `x-agent-trust` extension.
      in: header
      name: Agent-Signature
      x-agent-trust:
        algorithm: ES256
        trustLevels: [L0, L1, L2, L3, L4]
        issuerKeysUrl: /.well-known/agent-trust-keys
security:
  - AgentTrust: [L3]
```

Used by: (informational)

* [x-agent-auth.fly.dev](https://x-agent-auth.fly.dev/) (reference implementation, with live HTTP wire format and tamper test)
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
