---
owner: handrews
name: Token-Oriented Object Notation (TOON)
description: Compact encoding of the JSON data model for LLM prompts
media_types:
  - name: text/toon
    iana: false
    specifications:
    - name: TOON Specification
      url: https://github.com/toon-format/spec/blob/main/SPEC.md
layout: default
---

{% capture summary %}
Since TOON is simply an alternate serialization of the JSON data model, and serialization is not a concern of the OAS, `text/toon` can be treated the same as `application/json` for the purposes of the Schema Object.
{% endcapture %}

{% capture remarks %}
Note, however, that TOON specifies object property order preservation in terms of encounter order, which is not necessarily the same as the order of properties in a Schema Object.  JSON Schema is not able to specify object property order.

Similarly, TOON encoding options such as keyfolding are outside of the scope of the Schema Object and the OAS, as they are not specified as media type parameters.

Finally, the `text/toon` media type is provisional; if it is changed, it is expected that the new media type will work the same as the current one.
{% endcapture %}

{% include media-type-entry.md summary=summary remarks=remarks %}
