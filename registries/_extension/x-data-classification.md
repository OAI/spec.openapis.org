---
owner: darkmatterforge
issue:
description: Classifies a schema property by data category and sensitivity, and declares a masking strategy used by tooling to redact the value — for example before writing logs.
schema:
  type: object
  required: [category, masking]
  properties:
    category:
      type: string
    sensitivity:
      type: string
    masking:
      type: object
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The `x-data-classification` extension annotates a Schema Object property with
a data category, an optional sensitivity level, and a masking strategy.
Tooling reads the annotation to redact the value at runtime — for example
before writing it to logs — instead of every service hand-maintaining its own
list of sensitive field names.

`category` is one of `PII`, `financial`, `government-id`, `health`, `secret`,
`credential`, `contact`, or `other`. `sensitivity` is one of `public`,
`internal`, `confidential`, or `restricted` (defaults to `confidential`).
`masking.strategy` is one of `full`, `partial`, `regex`, `hash`, `remove`, or
`tokenize`, with strategy-specific parameters (`keep`, `pattern`,
`replacement`, `algorithm`, `maskChar`).

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

References:
- [Discussion #4330](https://github.com/OAI/OpenAPI-Specification/discussions/4330) — original proposal and design discussion.

Used by: (informational)

* [openapi-data-classification](https://github.com/darkmatterforge/openapi-data-classification) — Node.js, Java/Logback, and Python reference implementations, each with a passing test suite covering every masking strategy.
{% endcapture %}

{% capture example %}
```yaml
components:
  schemas:
    Customer:
      type: object
      properties:
        email:
          type: string
          x-data-classification:
            category: contact
            sensitivity: confidential
            masking: { strategy: regex, pattern: "(^.).*(@.*)$", replacement: "$1***$2" }
        card_number:
          type: string
          x-data-classification:
            category: financial
            sensitivity: restricted
            masking: { strategy: partial, keep: last-4 }
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
