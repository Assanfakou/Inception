# Simple Explanation of the HTML Resume Website

---

# `<!DOCTYPE html>`

Tells the browser:

> "This file is an HTML5 document."

It helps the browser understand how to read the page correctly.

---

# `<html lang="en">`

This is the root of the HTML page.

`lang="en"` means:
- the language of the page is English.

---

# `<head>`

The `<head>` contains information about the page.

The user usually does not see this content directly.

---

# `<meta charset="UTF-8">`

Allows the page to support:
- letters
- symbols
- special characters

without breaking text encoding.

---

# `<meta name="viewport" content="width=device-width, initial-scale=1.0">`

Makes the page responsive on:
- phones
- tablets
- computers

Without this line, mobile view can look broken.

---

# `<title>Assan Kou Resume</title>`

The title shown in:
- browser tab
- bookmarks

---

# `<style>`

This section contains CSS.

CSS is used to:
- design
- color
- style
- organize the page

---

# `body`

```css
body {
    background-color: #f4f4f4;
    font-family: Arial, sans-serif;
}
```

`body` means:
> the whole page

---

## `background-color`

Changes page background color.

---

## `font-family`

Changes the writing style (font).

---

# `.container`

```css
.container {
    width: 70%;
    margin: 40px auto;
}
```

`.container` is a class.

It is the white box containing all the content.

---

## `width: 70%`

Makes the box take:
- 70% of screen width

---

## `margin: 40px auto`

Adds space around the box.

`auto` centers the box horizontally.

---

# `padding`

```css
padding: 30px;
```

Adds internal space inside the white box.

Without padding:
- text touches borders.

---

# `border-radius`

```css
border-radius: 10px;
```

Makes corners rounded.

---

# `h1`

```css
h1 {
    text-align: center;
}
```

Styles the main title.

---

## `text-align: center`

Centers text horizontally.

---

# `h2`

Used for section titles like:
- About Me
- Skills
- Projects

---

# `border-bottom`

```css
border-bottom: 1px solid #ccc;
```

Adds a gray line under titles.

---

# `p`

```css
p {
    line-height: 1.6;
}
```

`p` means paragraph.

---

## `line-height`

Controls space between text lines.

Higher value:
- easier to read.

---

# `ul`

Means:
> unordered list

Used for bullet lists.

---

# `li`

Means:
> list item

Each bullet point is an `<li>`.

---

# `<body>`

Everything inside `<body>` appears on the page.

---

# `<div class="container">`

Creates the main content box.

`class="container"` connects HTML to CSS.

The CSS rule:

```css
.container
```

styles this div.

---

# `<h1>Assan Kou</h1>`

Main title of the page.

---

# `<p>`

Used for normal text paragraphs.

---

# `<strong>`

Makes text bold.

Example:

```html
<strong>1337 School</strong>
```

---

# `<br>`

Means:
> line break

Moves text to a new line.

---

# `<ul>` and `<li>`

Creates bullet lists.

Example:

```html
<ul>
    <li>Docker</li>
</ul>
```

---

# `<div class="footer">`

Footer section at the bottom of the page.

---

# `© 2026 Assan Kou`

Simple copyright text.

---

# Closing tags

Examples:

```html
</body>
</html>
```

They close the elements opened earlier.

---

# Simple Mental Model

HTML:
> structure of the page

CSS:
> design and appearance

---

# Final Flow

```text
HTML → structure
CSS → style
Browser → renders the final website
```
