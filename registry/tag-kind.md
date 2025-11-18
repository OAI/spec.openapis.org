---
title: Tag Kinds Registry
layout: default
permalink: /registry/tag-kind/index.html
parent: Registries
---

# Tag Kinds Registry

## Supporting Versions

OpenAPI 3.2 added more structure to tags, including by adding a `kind` property to a [Tag Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.2.0.md#tag-object). Support for the values in this registry should not be expected until tools add support for the 3.2 version.

## Contributing

Please raise a [Pull-Request](https://github.com/OAI/spec.openapis.org/pulls) against the `main` branch and add a new Markdown file to the folder `registries/_tag-kind`. The name of the file is considered the registration entry, ignoring the file extension. Alternatively you can open an [Issue](https://github.com/OAI/OpenAPI-Specification/issues) to discuss a registry value.

## Values

|Value|Description
|---|---|---|
{% for value in site.tag-kind %}| <a href="./{{ value.slug }}.html">{{ value.slug }}</a> | {{ value.description }} |
{% endfor %}

