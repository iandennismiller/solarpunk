---
layout:     page-nosocial
title:      Practice
permalink:  /practice/
menu:       main
image:      /media/thumb-big.jpg
excerpt:    a collection of Solarpunk readings and other media
---

In practice, Solarpunk is expressed as techniques that build harmony among humans and nature.

<ul>
  {% for item in site.data.practice %}
    <li>
      <a href="{{ site.baseurl }}/practice/{{ item.id|downcase }}.html">
        {{ item.title }}.
      </a>
      ({{ item.year }}).
      {{ item.author }}.
    </li>
  {% endfor %}
</ul>
