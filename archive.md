---
layout: main
title: Archive
---

{% for post in site.posts %}

## <span class="archive-date">({{post.date | date: "%b '%y"}})</span>[ {{post.title}}]({{site.baseurl}}{{post.url}})

<div class="archive-summary">{{post.excerpt}}</div>

[Read More]({{post.url}})

  <hr>
{% endfor %}
