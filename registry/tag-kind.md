---
title: Tag Kinds Registry
layout: default
permalink: /registry/tag-kind/index.html
parent: Registries
---

# Tag Kinds Registry

## Unreleased feature

The `kind` addition to OpenAPI tags is planned for release in OpenAPI 3.2, so support for the values here should not be expected until tools officially support the 3.2 version.

## Contributing

Please raise a [Pull-Request](https://github.com/OAI/spec.openapis.org/pulls) against the `main` branch and add a new Markdown file to the folder `registries/_tag-kind`. The name of the file is considered the registration entry, ignoring the file extension. Alternatively you can open an [Issue](https://github.com/OAI/OpenAPI-Specification/issues) to discuss a registry value.

## Values

|Value|Description
|---|---|---|
{% for value in site.tag-kind %}| <a href="./{{ value.slug }}.html">{{ value.slug }}</a> | {{ value.description }} |
{% endfor %}

