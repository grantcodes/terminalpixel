---
title: Musings on Semantic Forms
date: 2013/06/30
---

Forms are a core component of the web, so why are they marked up in such a stange way so often?

First up I'll dive into a few ways *not* to make forms before going onto ways I would recommend to build forms.
READMORE

## How not to do it.

### Paragraph tags

I've seen a fair bit of use of p tags to separate labels and inputs onto separate lines. Although this is easy to do and does the job, it's just plain wrong! p tags are for paragraphs and form items are certainly not paragraphs.

### Lists

Lists are a strange one, I've heard reasoning that ordered lists can be a valid way of laying out forms where the user is expected to fill out the fields in a certain order. I can see the logic behind it but there is something about it that just feels off. I'm not sure it's all that necessary anyway since forms naturally order themselves based on source order anyway.

## OK then. What's the correct way of doing it?

### div tags

The trusty div tag can always be relied upon.

> The `<div>` element has no special meaning at all.

<p class="quote-by"><a href="http://www.w3.org/wiki/HTML/Elements/div">W3C Wiki</a></p>

So I can't see any reason why div tags aren't suitable for form layouts.

### Fieldsets

Fieldsets and legends are a great, semantic way of marking up forms if used correctly.

Fieldsets, as the name implies, are for grouping related fields together such as address, postcode , city etc. Simple, symantic and styleable.

Legends are a bit strange in my opinion but they are effectively titles for fieldsets and go inside a fieldset.

### Put it all together

At the end of the day it comes down to personal opinion. I personally go for using as little markup as I can, usually labels and inputs are enough for styling, and I'll put in a fieldset where appropriate.

```html
	<form action="">
		<fieldset>
			<legend>Your Details</legend>

			<label for="street">Street</label>
			<input id="street" placeholder="10 Fake Street" type="text" required>

			<label for="phone">Phone</label>
			<input id="phone" placeholder="999" type="tel">
		</fieldset>
	</form>
```

## Bonus points

1. Use html5 form elements like email, date, tel etc. There is zero reason not to and they provide a better experience to everyone
2. And used the other html5 features such as required and placeholder
3. Labels, labels, labels. Inputs should almost always have labels, placeholders are fantastic but labels are still needed for accessability, even if they are hidden away.
4. Add hover styles to linked up labels:

```css
	label[for] {
		cursor: pointer;
	}
```