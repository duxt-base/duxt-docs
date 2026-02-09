---
title: API Reference
description: Complete API reference for all duxt_html components
layout: html-layout
order: 5
---

# API Reference

Every duxt_html component listed with its HTML element, specific parameters, and whether it accepts children.

## Common Parameters

All components accept these parameters (not repeated in the tables below):

| Parameter | Type | Description |
|-----------|------|-------------|
| `className` | `String?` | CSS class names |
| `style` | `String?` | Inline CSS string |
| `id` | `String?` | Element ID |
| `attributes` | `Map<String, String>?` | Custom HTML attributes |
| `events` | `Map<String, EventCallback>?` | Event handlers |
| `key` | `Key?` | Reconciliation key |

Components with children also accept `child` (single) or `children` (list) — never both.

---

## Document Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `Html` | `<html>` | yes | — |
| `Head` | `<head>` | yes | — |
| `Body` | `<body>` | yes | — |
| `Title` | `<title>` | yes | — |
| `StyleElement` | `<style>` | yes | `content` (inline CSS text), `media` |
| `Base` | `<base>` | no | `href`, `target` |
| `Meta` | `<meta>` | no | `name`, `content`, `charset`, `httpEquiv` |
| `HtmlLink` | `<link>` | no | `href` (required), `rel`, `type`, `as` |
| `Noscript` | `<noscript>` | yes | — |

> Renamed: `HtmlLink` (vs jaspr_router Link), `StyleElement` (vs Styles class).

---

## Content Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `Div` | `<div>` | yes | — |
| `P` | `<p>` | yes | — |
| `Ul` | `<ul>` | yes | — |
| `Ol` | `<ol>` | yes | `reversed`, `start`, `type` (NumberingType) |
| `Li` | `<li>` | yes | `value` (int) |
| `Dl` | `<dl>` | yes | — |
| `Dt` | `<dt>` | yes | — |
| `Dd` | `<dd>` | yes | — |
| `Blockquote` | `<blockquote>` | yes | `cite` |
| `Pre` | `<pre>` | yes | — |
| `Hr` | `<hr>` | no | — |
| `Menu` | `<menu>` | yes | — |

---

## Text Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `A` | `<a>` | yes | `href` (required), `target`, `download`, `type`, `referrerPolicy`, `onClick` |
| `Span` | `<span>` | yes | — |
| `Strong` | `<strong>` | yes | — |
| `B` | `<b>` | yes | — |
| `Em` | `<em>` | yes | — |
| `I` | `<i>` | yes | — |
| `U` | `<u>` | yes | — |
| `S` | `<s>` | yes | — |
| `Small` | `<small>` | yes | — |
| `Code` | `<code>` | yes | — |
| `Br` | `<br>` | no | — |
| `Wbr` | `<wbr>` | no | — |
| `Abbr` | `<abbr>` | yes | `title` |
| `Bdi` | `<bdi>` | yes | — |
| `Bdo` | `<bdo>` | yes | `dir` |
| `Cite` | `<cite>` | yes | — |
| `HtmlData` | `<data>` | yes | `value` |
| `Dfn` | `<dfn>` | yes | — |
| `Kbd` | `<kbd>` | yes | — |
| `Mark` | `<mark>` | yes | — |
| `Q` | `<q>` | yes | `cite` |
| `Rp` | `<rp>` | yes | — |
| `Rt` | `<rt>` | yes | — |
| `Ruby` | `<ruby>` | yes | — |
| `Samp` | `<samp>` | yes | — |
| `Sub` | `<sub>` | yes | — |
| `Sup` | `<sup>` | yes | — |
| `Time` | `<time>` | yes | `dateTime` |
| `HtmlVar` | `<var>` | yes | — |
| `Del` | `<del>` | yes | `cite`, `dateTime` |
| `Ins` | `<ins>` | yes | `cite`, `dateTime` |

> Renamed: `HtmlData` (vs common Data class), `HtmlVar` (vs `var` keyword).

---

## Heading Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `H1` | `<h1>` | yes | — |
| `H2` | `<h2>` | yes | — |
| `H3` | `<h3>` | yes | — |
| `H4` | `<h4>` | yes | — |
| `H5` | `<h5>` | yes | — |
| `H6` | `<h6>` | yes | — |

---

## Form Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `Form` | `<form>` | yes | `action`, `method`, `encType`, `autoComplete`, `name`, `noValidate`, `target` |
| `Input` | `<input>` | no | `type`, `name`, `value`, `placeholder`, `disabled`, `checked`, `indeterminate`, `onInput`, `onChange` |
| `Button` | `<button>` | yes | `type`, `disabled`, `autofocus`, `onClick` |
| `Select` | `<select>` | yes | `name`, `value`, `multiple`, `required`, `disabled`, `autofocus`, `autocomplete`, `size`, `onInput`, `onChange` |
| `Option` | `<option>` | yes | `label`, `value`, `selected`, `disabled` |
| `Optgroup` | `<optgroup>` | yes | `label` (required), `disabled` |
| `Textarea` | `<textarea>` | yes | `autoComplete`, `autofocus`, `cols`, `disabled`, `minLength`, `name`, `placeholder`, `readonly`, `required`, `rows`, `spellCheck`, `wrap`, `onInput`, `onChange` |
| `Label` | `<label>` | yes | `htmlFor` |
| `Fieldset` | `<fieldset>` | yes | `name`, `disabled` |
| `Legend` | `<legend>` | yes | — |
| `Datalist` | `<datalist>` | yes | — |
| `Meter` | `<meter>` | yes | `value`, `min`, `max`, `low`, `high`, `optimum` |
| `Progress` | `<progress>` | yes | `value`, `max` |
| `Output` | `<output>` | yes | `htmlFor`, `name` |

---

## Table Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `Table` | `<table>` | yes | — |
| `Caption` | `<caption>` | yes | — |
| `Thead` | `<thead>` | yes | — |
| `Tbody` | `<tbody>` | yes | — |
| `Tfoot` | `<tfoot>` | yes | — |
| `Tr` | `<tr>` | yes | — |
| `Th` | `<th>` | yes | `abbr`, `colspan`, `headers`, `rowspan`, `scope` |
| `Td` | `<td>` | yes | `colspan`, `headers`, `rowspan` |
| `Col` | `<col>` | no | `span` |
| `Colgroup` | `<colgroup>` | yes | `span` |

---

## Media Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `Img` | `<img>` | no | `src` (required), `alt`, `width`, `height`, `crossOrigin`, `loading`, `referrerPolicy` |
| `Video` | `<video>` | yes | `src`, `poster`, `width`, `height`, `autoplay`, `controls`, `loop`, `muted`, `crossOrigin`, `preload` |
| `Audio` | `<audio>` | yes | `src`, `autoplay`, `controls`, `loop`, `muted`, `crossOrigin`, `preload` |
| `Source` | `<source>` | no | `src`, `type` |
| `Iframe` | `<iframe>` | yes | `src` (required), `allow`, `csp`, `name`, `sandbox`, `width`, `height`, `loading`, `referrerPolicy` |
| `Embed` | `<embed>` | no | `src` (required), `type`, `width`, `height` |
| `ObjectEmbed` | `<object>` | yes | `data`, `name`, `type`, `width`, `height` |
| `Script` | `<script>` | no | `src`, `content`, `async`, `defer` |
| `Picture` | `<picture>` | yes | — |
| `Canvas` | `<canvas>` | yes | `width`, `height` |
| `Track` | `<track>` | no | `src`, `kind`, `srclang`, `label`, `isDefault` |
| `ImageMap` | `<map>` | yes | `name` |
| `Area` | `<area>` | no | `href`, `alt`, `shape`, `coords`, `target`, `download` |
| `Figure` | `<figure>` | yes | — |
| `Figcaption` | `<figcaption>` | yes | — |

> Renamed: `ObjectEmbed` (vs Dart's Object), `ImageMap` (vs Dart's Map).

---

## Semantic Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `Header` | `<header>` | yes | — |
| `Footer` | `<footer>` | yes | — |
| `Nav` | `<nav>` | yes | — |
| `Main` | `<main>` | yes | — |
| `Article` | `<article>` | yes | — |
| `Aside` | `<aside>` | yes | — |
| `Section` | `<section>` | yes | — |
| `Details` | `<details>` | yes | `open` |
| `Summary` | `<summary>` | yes | — |
| `Dialog` | `<dialog>` | yes | `open` |
| `Address` | `<address>` | yes | — |
| `Hgroup` | `<hgroup>` | yes | — |
| `Search` | `<search>` | yes | — |

---

## SVG Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `Svg` | `<svg>` | yes | `viewBox`, `width` (Unit), `height` (Unit) |
| `Rect` | `<rect>` | yes | `x`, `y`, `rx`, `ry`, `width`, `height`, `fill`, `stroke`, `strokeWidth` |
| `Circle` | `<circle>` | yes | `cx`, `cy`, `r`, `fill`, `stroke`, `strokeWidth` |
| `Ellipse` | `<ellipse>` | yes | `cx`, `cy`, `rx`, `ry`, `fill`, `stroke`, `strokeWidth` |
| `Line` | `<line>` | yes | `x1`, `y1`, `x2`, `y2`, `fill`, `stroke`, `strokeWidth` |
| `Path` | `<path>` | yes | `d`, `fill`, `stroke`, `strokeWidth` |
| `Polygon` | `<polygon>` | yes | `points`, `fill`, `stroke`, `strokeWidth` |
| `Polyline` | `<polyline>` | yes | `points`, `fill`, `stroke`, `strokeWidth` |

---

## Web Component Elements

| Component | HTML | Children | Specific Parameters |
|-----------|------|----------|-------------------|
| `HtmlTemplate` | `<template>` | yes | — |
| `Slot` | `<slot>` | yes | `name` |

---

## Helper Functions

| Function | Description | Parameters |
|----------|-------------|------------|
| `Text(content)` | Create a text node | `String content`, `Key? key` |
| `Raw(html)` | Insert raw HTML (unescaped) | `String html`, `Key? key` |
| `Fragment(children)` | Group components without a wrapper element | `List<Component> children`, `Key? key` |

---

## Exported Types

duxt_html re-exports these types from Jaspr for convenience:

| Type | Used by |
|------|---------|
| `Component` | All components |
| `Key` | All components |
| `EventCallback` | `events` parameter |
| `VoidCallback` | `onClick` on Button/A |
| `ValueChanged` | `onInput`/`onChange` on Input/Select/Textarea |
| `Styles` | Jaspr styles object |
| `FormMethod` | Form `method` |
| `FormEncType` | Form `encType` |
| `AutoComplete` | Form/Textarea `autoComplete` |
| `InputType` | Input `type` |
| `ButtonType` | Button `type` |
| `SpellCheck` | Textarea `spellCheck` |
| `TextWrap` | Textarea `wrap` |
| `NumberingType` | Ol `type` |
| `Target` | A/Form `target` |
| `ReferrerPolicy` | A/Img/Iframe `referrerPolicy` |
| `CrossOrigin` | Img/Video/Audio `crossOrigin` |
| `Preload` | Video/Audio `preload` |
| `MediaLoading` | Img/Iframe `loading` |
| `Unit` | SVG `width`/`height` |
| `Color` | SVG `fill`/`stroke` |
| `Colors` | Named color constants |
