---
owner: earth2marsh
issue:
description: "Tags with `kind: skill` group operations by the task or capability."
layout: default
---

{% capture summary %}
Tags with `kind: skill` group together operations by the task or capability they 
enable for a system or agent. Depending on how a provider chose to implement behaviors,
a specific skill tag might be used to control access (e.g., an inferred OAuth scope). 

Similarly, a accompanying Arazzo document might identify specific workflows for that skill. 
By following a convention, each named skill might declare its corresponding workflows in a
companion document called `{skillname}-arazzo.yaml` as well as the corresponding 
instructions for the skill, such as `{skillname}-skill.md`.

In this way, API documentation tools might identify how API users might choose to leverage 
related skills for any given operation.
{% endcapture %}

{% include tag-kind-entry.md summary=summary %}  
