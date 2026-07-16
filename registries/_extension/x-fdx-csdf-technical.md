---
owner: DavidBiesack
issue:
description: Tags API elements of the [FDX API](http://financialdataexchange.org) that cover US banking REG E and/or REG Z regulations
schema:
    const: true
objects:
  - Info Object
  - Schema Object
  - Operation Object
layout: default
---

{% capture summary %}
The FDX `x-fdx-csdf-technical` extension tag marks
FDX API entities and properties which may be needed
for technical implementation reasons to deliver the entities
and properties which are on the FDX Reference List for U.S.
CFPB section 1033 Personal Financial Data Rules (PFDR)
regulations for a Consensus Standard Data Format (CSDF).
`true` indicates that the entity or property likely should
be included by a Data Provider. The tag is only used
with the value `true`, often within a schema tagged
with `x-fdx-csdf-account-categories`, and indicates
data that is not related to U.S. banking data
pertaining to U.S. banking Regulation E and/or Regulation Z.

"csdf" refers to the "Consensus Standard Data Format" profile
of the FDX API which establishes a standard open banking API for the
U.S. finance industry.

The `x-fdx-csdf-technical` extension can appear as a property in
the following objects: `{{page.objects|jsonify}}`.
{% endcapture %}

{% capture example %}
```yaml
    Customers:
      title: Customers Entity
      description: List of customers
      type: object
      x-fdx-csdf-account-categories: [ANY]
      properties:
        page:
          $ref: './fdxapi.components.yaml#/components/schemas/PageMetadata'
          description: Information required to paginate results
          x-fdx-csdf-technical: true
        links:
          $ref: './fdxapi.components.yaml#/components/schemas/PageMetadataLinks'
          description: Links used to paginate results
          x-fdx-csdf-technical: true
        ...
```

Used by: (informational)

* [financialdataexchange.org](http://financialdataexchange.org)
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
