---
owner: handrews
name: Forms
description: Ordered name-value pairs
media_types:
  - name: application/x-www-form-urlencoded
    iana: https://www.iana.org/assignments/media-types/application/x-www-form-urlencoded
    specifications:
    - name: WHATWG URL
      url: https://url.spec.whatwg.org/#application/x-www-form-urlencoded
    - name: HTTP 4.01 §17.13.4.1
      url: https://www.w3.org/TR/html401/interact/forms.html#h-17.13.4.1
      note: historical
    - name: RFC1866 §8.2.1
      url: https://datatracker.ietf.org/doc/html/rfc1866#section-8.2.1
      note: historical but cited by later RFCs and the OAS
  - name: multipart/form-data
    iana: https://www.iana.org/assignments/media-types/multipart/form-data
    specifications:
    - name: RFC7578
      url: https://www.rfc-editor.org/rfc/rfc7578.html
references:
  - section: Encoding By Name
    anchor: encoding-by-name
    parent: Encoding Usage and Restrictions
    parentAnchor: encoding-usage-and-restrictions
  - section: Encoding By Position
    anchor: encoding-by-position
    parent: Encoding Usage and Restrictions
    parentAnchor: encoding-usage-and-restrictions
  - section: Encoding the `x-www-form-urlencoded` Media Type
    anchor: encoding-the-x-www-form-urlencoded-media-type
    parent: Encoding Object
    parentAnchor: encoding-object
  - section: Encoding multipart Media Types
    anchor: encoding-multipart-media-types
    parent: Encoding Object
    parentAnchor: encoding-object
  - section: "Appendix C: Using RFC6570-Based Serialization"
    anchor: appendix-c-using-rfc6570-based-serialization
  - section: "Appendix E: Percent-Encoding and Form Media Types"
    anchor: appendix-e-percent-encoding-and-form-media-types
  - section: Non-JSON Data
    anchor: non-json-data
layout: default
---

{% capture summary %}
Web-style form data consists of name-value pairs, with duplicate names allowed, and are structured either in a way compatible with URI form query strings or as a `multipart` document.
{% endcapture %}

{% capture remarks %}
Both form media types use the [Encoding Object](https://spec.openapis.org/oas/latest.html#encoding-object) to map object properties from schema-ready data structures to name-value pairs, with special rules for arrays causing each array value to be treated as a separate pair with the same name.

As of OAS v3.2, endpoint URL query strings can be modeled as a media type using `in: querystring` in the [Parameter Object](https://spec.openapis.org/oas/latest.html#parameter-object).  The query string can also be modeled using multiple `in: query` Parameter Objects through mechanisms similar to the Encoding Object.

Note that URL-encoded forms have been defined by different standards organizations at different times, leading to inconsistencies regarding percent-encoding in later standards and implementations; this is addressed in detail in [Appendix E](https://spec.openapis.org/oas/latest.html#appendix-e-percent-encoding-and-form-media-types).

Since v3.3, the OAS provides for a way to preserve ordering, by treating the deserialized content as an array, rather than an object.
{% endcapture %}

{% capture examples %}

Treating the data as an object, this data:

```json
{
  "alpha": 1,
  "beta": 2,
  "gamma": [ 3, 4 ]
}
```

... serializes as `application/x-www-form-urlencoded` to: `alpha=1&beta=2&gamma=3&gamma=4`

and serializes as `multipart/form-data; boundary="4aKOX"` to:

```
--4aKOX
Content-Disposition: form-data; name="alpha"

1
--4aKOX
Content-Disposition: form-data; name="beta"

2
--4aKOX
Content-Disposition: form-data; name="gamma"

3
--4aKOX
Content-Disposition: form-data; name="gamma"

4
--4aKOX--
```

If preservation of value/part order is important, treat the data as an array, where each array item
is an object consisting of the key/value pair:

```json
[
  { "alpha": 1 },
  { "beta": 2 },
  { "gamma": 3 }
  { "gamma": 4 }
}
```

This distinction can be made clear to a deserializer by using `type: array` in the
schema, using the process as described in [Non-JSON Data](https://spec.openapis.org/oas/latest#non-json-data).

{% endcapture %}

{% include media-type-entry.md summary=summary remarks=remarks examples=examples %}
