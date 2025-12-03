---
owner: ioggstream
issue:
description: Used to associate a JSON-LD type to a schema, enabling semantic interoperability.
schema:
  oneOf:
    - type: string
    - type: array
      items:
        type: string
objects: [ "schemaObject" ]
layout: default
---

{% capture summary %}
The `x-jsonld-type` extension is used to associate a JSON-LD `@type` to a schema, enabling semantic interoperability by specifying the type of the resource in terms of ontologies and vocabularies. It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

It can be used in conjunction with `x-jsonld-context`.

This extension is defined in [draft-polli-restapi-ld-keywords](https://datatracker.ietf.org/doc/draft-polli-restapi-ld-keywords/) and is based on the [JSON-LD 1.1](https://www.w3.org/TR/json-ld11/#interpreting-json-as-json-ld) specification.
{% endcapture %}

{% capture example %}
```yaml
openapi: 3.0.0
...
components:
  schemas:
    Person:
      "x-jsonld-type": "https://schema.org/Person"
      "x-jsonld-context":
        "@vocab": "https://schema.org/"
      type: object
      properties:
        familyName: { type: string, maxLength: 255  }
        givenName:  { type: string, maxLength: 255  }
      example:
        familyName: "Doe"
        givenName: "John"
```

Used by:

* Italian Agencies
* https://schema.gov.it
* https://api.gov.it
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}  

