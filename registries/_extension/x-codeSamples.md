---
owner: baywet
issue:
description: Provides custom code samples for an operation in one or more programming languages.
schema:
  type: array
  items:
    type: object
    required:
      - lang
      - source
    properties:
      lang:
        type: string
      label:
        type: string
      source:
        oneOf:
          - type: string
          - type: object
            required:
              - $ref
            properties:
              '$ref':
                type: string
objects: [ "Operation Object" ]
layout: default
---

{% capture summary %}

The `x-codeSamples` extension provides custom code samples for an API operation. Documentation tools commonly render each item as a language-specific example or tab alongside the operation, either replacing generated snippets or adding examples that use a provider's preferred SDK, workflow, or request style.

Each code sample object includes a required `lang` string identifying the programming language or syntax highlighter, a required `source` value containing the sample code, and may include an optional `label` string for a display label. Some tools also accept a `source` value that references an external code sample file with a `$ref`.

The extension is commonly documented as the successor or camel-case alias of `x-code-samples`. This registry entry documents `x-codeSamples`; tooling may also support `x-code-samples` separately for compatibility.

It can appear as a property in the following objects: `{{page.objects|jsonify}}`.

References:

* [Redocly `x-codeSamples` documentation](https://redocly.com/docs/realm/content/api-docs/openapi-extensions/x-code-samples)
* [Speakeasy `x-codeSamples` guide](https://www.speakeasy.com/openapi/guides/x-codesamples)
* [Zudoku `x-code-samples` / `x-codeSamples` documentation](https://zudoku.dev/docs/openapi-extensions/x-code-samples)

Used by: (informational)

* [Redocly/ReDoc](https://github.com/Redocly/redoc/blob/1f67fe5ae769910c1144d76ac0786bcb5499d712/demo/openapi.yaml)
* [DigitalOcean OpenAPI](https://github.com/digitalocean/openapi/blob/0ddc6043112fcafa81f66f29255f953cfc998e2c/specification/resources/nfs/nfs_list.yml)
* [Elastic Kibana](https://github.com/elastic/kibana/blob/3ef2275d73e14bd9ff2547c74c5793c7460a7cbb/src/platform/plugins/shared/data_views/docs/openapi/bundled.json)
* [FerretDB](https://github.com/FerretDB/FerretDB/blob/799235dab9e350655e72e65a0b24d849f7d68143/internal/dataapi/api/openapi.json)
* [InfluxData OpenAPI](https://github.com/influxdata/openapi/blob/e48e73372cf10aec903a768bb0d236809051cfbc/src/common/paths/signin.yml)
* [Leaseweb API definitions](https://github.com/leaseweb/api-definitions/blob/405331c5950443780a9c57c93aa10fe89b14726d/apiKeyManagement/paths/apiKeys_v1_keys.yaml)
* [Lob OpenAPI](https://github.com/lob/lob-openapi/blob/55f03bd1767eff72ae8675979bb1d070ba0f092a/resources/uploads/upload.yml)
* [Palo Alto Networks pan.dev](https://github.com/PaloAltoNetworks/pan.dev/blob/06430c92c453df9efa654b9bbe5d51f3b4662e18/openapi-specs/code/Errors.json)
* [Permify](https://github.com/Permify/permify/blob/0cd0f917a103a33b7fb5b848a832116252bf62dd/docs/api-reference/openapi.json)
* [Rebilly API definitions](https://github.com/Rebilly/api-definitions/blob/2d7b6c5303cacad65f106f61409b7552137007a3/openapi/paths/tags.yaml)
{% endcapture %}

{% capture example %}

```yaml
openapi: 3.1.0
info:
  title: My API
  version: 1.0.0
paths:
  /pets:
    get:
      summary: List pets
      x-codeSamples:
        - lang: cURL
          label: CLI
          source: |
            curl --request GET \
              --url https://api.example.com/pets \
              --header 'accept: application/json'
        - lang: JavaScript
          label: fetch
          source: |
            const response = await fetch("https://api.example.com/pets", {
              headers: { accept: "application/json" }
            });
            console.log(await response.json());
        - lang: Python
          source:
            $ref: code_samples/list_pets.py
      responses:
        "200":
          description: A list of pets.
```
{% endcapture %}

{% include extension-entry.md summary=summary example=example %}
