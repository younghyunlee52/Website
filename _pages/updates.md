---
layout: single
title: "Updates"
permalink: /updates/
author_profile: false
show_title: false
page_class: updates-page
---

{% assign updates_sorted = site.updates | sort: "date" | reverse %}
{% assign current_year = "" %}

{% for update in updates_sorted %}
  {% assign update_year = update.date | date: "%Y" %}
  {% if update_year != current_year %}
    {% assign current_year = update_year %}
<h2 class="updates-page__year">{{ current_year }}</h2>
  {% endif %}

  <article class="update-entry{% if update.image %} update-entry--with-media{% endif %}">
    {% if update.image %}
      {% assign image_src = update.image %}
      {% assign image_first_char = image_src | slice: 0 %}
      {% unless image_src contains '://' or image_first_char == '/' %}
        {% assign image_src = '/images/' | append: image_src %}
      {% endunless %}
      <div class="update-entry__media">
        <img src="{{ image_src | relative_url }}" alt="{{ update.image_alt | default: update.title }}">
        {% if update.caption %}
          <p class="update-entry__caption">{{ update.caption }}</p>
        {% endif %}
      </div>
    {% endif %}
    <div class="update-entry__body">
      <h3 class="update-entry__title">{{ update.title }}</h3>
      <p class="update-entry__meta">
        {% if update.display_date %}{{ update.display_date }}{% else %}{{ update.date | date: "%B %-d, %Y" }}{% endif %}{% if update.location %} | {{ update.location }}{% endif %}
      </p>
      <div class="update-entry__content">
        {{ update.content | markdownify }}
      </div>
      {% if update.more_url %}
        <p class="update-entry__link"><a href="{{ update.more_url }}">{{ update.more_label | default: "More information" }}</a></p>
      {% endif %}
    </div>
  </article>
{% endfor %}
