# Django template language

## Basic
Template:
  - Text document, or Python string.
  - Using Django template language.
  - Contains *block tag* or *variable*.

**block tag**
  - surrounded by `{%` and `%}`
  - do something
  Example:

      {% if is_logged_in %} Thanks for logging in! {% else %} Please log in. {%
      endif %>

**variable**
  - surrounded by `{{` and `}}`
  - output a value

  Example:

      My first name is {{ first_name }}

## Using the template system

### Class **Template**
Two steps:
  - Compile: raw template code -> Template object
  - Render: call `render()` of a *Template* object with a context.

**Compiling a string**

    from django.template import Template
    t = Template("My name is {{ my_name }}.")
    print(t)
    <django.template.Template instance>

The system parses the template code once, then stored it as a “node”. Parsing uses a short regular expression.

**Rendering a context**
  **render(context)**

## Variable and lookups

## How invalid variables are handled

## Built-in variables

## Limitations with string literals

## Playing with Context objects



## Subclassing Context: `RequestContext`
