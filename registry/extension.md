---
# title: Extensions Registry
layout: default
permalink: /registry/extension/index.html
parent: Registries
---

# Extensions Registry

## Master Issue

* [#1351](https://github.com/OAI/OpenAPI-Specification/issues/1351)

## Contributing

Please raise a [Pull-Request](https://github.com/OAI/spec.openapis.org/pulls) and
follow the instructions in
[`CONTRIBUTING.md`](https://github.com/OAI/spec.openapis.org/blob/main/CONTRIBUTING.md),
or open an [Issue](https://github.com/OAI/OpenAPI-Specification/issues)
to contribute or discuss a registry value.

## Values

|Value|Description|Issue|
|---|---|---|
{% for value in site.extension %}| <a href="./{{ value.slug }}.html">{{ value.slug }}</a> | {{ value.description }} | {% if value.issue %}<a href="https://github.com/OAI/OpenAPI-Specification/issues/{{ value.issue }}">#{{ value.issue }}</a>{% endif %} |
{% endfor %}
