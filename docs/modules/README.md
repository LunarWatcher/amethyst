---
{
    "title": "Module list",
    "type": "page_list"
}
---
# Module list

This page lists all the modules that are available.

<ul>
{% for page in listPages(".") %}
    {%- if page.type != "page_list" -%}
        <li><a href="{{ abspath(page.url) }}">{{ page.title}}</a>: {{ page.summary }}</li>
    {%- endif -%}
{% endfor %}
</ul>
