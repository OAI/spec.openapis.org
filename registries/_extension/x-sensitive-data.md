---
owner: sharmaadityaHQ
issue:
description: Marks a schema property as sensitive so its value is masked in displayed examples and API responses.
schema:
  type: object
  properties:
    mask:
      type: string
      enum: [ full, regex, hash, remove ]
    pattern:
      type: string
  required: [ mask ]
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The `x-sensitive-data` extension marks a Schema Object property as sensitive so
that its value is masked in displayed output — code sample request/response
bodies and interactive "Try It" panels. Masking is **display-only**: the real
value is still sent on actual API calls, and a visibility toggle lets the reader
reveal the real value on screen.

The `mask` field selects the masking strategy:

| Strategy | Result | Use when |
|----------|--------|----------|
| `full`   | `••••••` | Hide the value entirely |
| `remove` | *(field omitted)* | Remove the field from the example |
| `hash`   | `3d2a1f8c` | Show that two values are equal without revealing either |
| `regex`  | partial mask (e.g. `••••••@example.com`) | Mask only part of the value; use with `pattern` |

`pattern` is a regular expression string used only when `mask` is `regex`; the
matched portion of the value is replaced with the mask placeholder. If `regex`
is used without a `pattern`, the entire value is masked (equivalent to `full`).

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.1.0
info:
  title: My API
  version: 1.0.0
components:
  schemas:
    LoginRequest:
      type: object
      properties:
        username:
          type: string
          example: alice
        password:
          type: string
          x-sensitive-data:
            mask: full        # displayed as ••••••
        email:
          type: string
          x-sensitive-data:
            mask: regex
            pattern: ^[^@]+   # displayed as ••••••@example.com
        apiToken:
          type: string
          x-sensitive-data:
            mask: hash        # displayed as an 8-char hex fingerprint, e.g. 3d2a1f8c
        internalNote:
          type: string
          x-sensitive-data:
            mask: remove      # field omitted from the example entirely
```

Used by: (informational)

* [Kong spec-renderer](https://github.com/Kong/spec-renderer)
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
