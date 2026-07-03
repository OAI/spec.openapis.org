---
owner: DavidBiesack
issue:
description: Tags API elements of the [FDX API](http://financialdataexchange.org) that cover US banking REG E and/or REG Z regulations
schema:
    type: array
    items:
      type: string
      minItems: 1
      uniqueItems: true
      enum:
        - REG_E
        - REG_Z
        - ANY
objects:
  - Info Object
  - Schema Object
  - Operation Object
layout: default
---

{% capture summary %}
The `x-fdx-csdf-account-categories` extension is used to tag API elements
of the FDX API (the API, data schemas and properties, and operations)
that convey data supporting U.S. banking Regulation E
([Electronic Funds Transfer Act (EFTA)](https://www.federalreserve.gov/boarddocs/caletters/2008/0807/08-07_attachment.pdf))
and/or Regulation Z
(Regulation Z [Truth in Lending Act (TILA)](https://www.ftc.gov/legal-library/browse/statutes/truth-lending-act).
"csdf" refers to the "Consensus Standard Data Format" profile
of the FDX API which establishes a standard open banking API for the
U.S. finance industry.

The `x-fdx-csdf-account-categories` extension can appear as a property in
the following objects: `{{page.objects|jsonify}}`.
{% endcapture %}

{% capture example %}
```yaml
components:
  schemas:
    AccountCategoryLineOfCredit:
      title: Account Category - Line Of Credit type
      description: The categories of Line of Credit account types
      type: string
      x-fdx-csdf-account-categories: [REG_Z]
      enum:
        - BNPL_ACCOUNT
        - LOAN_ACCOUNT
        - LOC_ACCOUNT
```

Used by: (informational)

* [financialdataexchange.org](http://financialdataexchange.org)
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
