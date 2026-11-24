---
owner: nhunsaker
issue:
description: Cross-field validation rules (required when, compare, at least one of, exactly one of, all or none) that servers and clients evaluate the same way.
schema:
  type: object
  required: [version, rules]
  additionalProperties: false
  properties:
    version:
      const: 1
    rules:
      type: array
      items:
        type: object
        required: [id, kind, message]
        properties:
          id: { type: string }
          kind:
            enum: [required_when, compare, at_least_one_of, exactly_one_of, all_or_none]
          message:
            type: object
            required: [key]
          path: { type: string }
          server_only: { type: boolean }
  description: Condensed. The full schema is https://schemas.metatoy.com/validonce/rules-v1.json
objects: [ "Schema Object" ]
layout: default
---

{% capture summary %}
The `x-validonce` extension carries cross-field validation rules on a Schema Object, as data, so the server that
publishes the OpenAPI document and every client that reads it enforce the same rules: "company is required when plan
is pro", "end is on or after start", "email or phone", "card or invoice, not both", "street, city and zip together".

Its value is a rule set (format version 1) with five rule kinds: `required_when` (with conditions `eq`, `ne`, `in`,
`present`, `absent`, `all`, `any`, `not`), `compare` (`lt`, `le`, `gt`, `ge`, `eq`, `ne` over number, string, date or
datetime, against another field or a constant), `at_least_one_of`, `exactly_one_of` and `all_or_none`. Field-level
constraints (types, lengths, patterns) stay in standard JSON Schema keywords; `x-validonce` adds only what JSON Schema
cannot express between fields. Each rule names the field its error belongs to, and a message key with parameters for
localisation.

The exact semantics (what counts as blank, no type coercion, date and datetime comparison) are specified in the rule
format and checked by a shared conformance suite that every implementation runs.

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

References:
- [Rule format v1](https://github.com/metatoy/validonce/blob/main/docs/rule-format-v1.md) - the specification
- [JSON Schema of the value](https://schemas.metatoy.com/validonce/rules-v1.json)
- [JSON Schema 2020-12 dialect](https://schemas.metatoy.com/validonce/dialect-v1.json) - for `jsonSchemaDialect`
- [Conformance cases](https://github.com/metatoy/validonce/tree/main/conformance/rules)

Used by:

* [validonce](https://github.com/metatoy/validonce) - writes the rules from FluentValidation (ASP.NET Core) and Pydantic (FastAPI); evaluates them in C#, Python and TypeScript (Zod, React, Angular). Apache-2.0.
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.1.0
info:
  title: Sign-up API
  version: 1.0.0
paths: {}
components:
  schemas:
    Signup:
      type: object
      required: [plan, start]
      properties:
        plan: { type: string, enum: [free, pro] }
        company: { type: [string, "null"] }
        start: { type: string, format: date }
        end: { type: [string, "null"], format: date }
      x-validonce:
        version: 1
        rules:
          - id: Signup.required_when.company
            kind: required_when
            field: company
            when: { eq: { field: plan, value: pro } }
            message: { key: rules.company_required }
          - id: Signup.compare.end
            kind: compare
            left: { field: end }
            op: ge
            right: { field: start }
            type: date
            message: { key: rules.end_after_start }
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
