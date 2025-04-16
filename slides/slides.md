---
theme: default
title: Tools (and Toys) for the Terminal
author: Jonathan Bowman
info: |
  ## Tools (and Toys) for the Terminal
  The hospitality and playfulness of the console

  terminal.bowmanjd.com
highlighter: shiki
selectable: true
presenter: dev
download: true
drawings:
  presenterOnly: true
  persist: false
mdc: true
transition: slide-left
class: text-center
hideInToc: true
---

# Tools (and Toys) for the Terminal

## The hospitality and playfulness of the console

[terminal.bowmanjd.com](https://terminal.bowmanjd.com)

<!--
It is an honor to be here. I am Jonathan Bowman. I am a hobbyist developer. I have been a teacher, preacher, web developer, IT director, software project manager, and now I write SQL, Javascript, and C# all day at Cargas. Cargas is the most humane and thoughtful place I have ever worked with technology, and I am proud to be there. There are other things I am proud of. I use Vim, I like Linux, I am pretty good with Python and bash and Powershell, and even a little Rust.

Whether Linux, Windows, or Mac, or BSD, I do feel pretty comfortable on the command-line. And I hope that this time together today might encourage you to be a bit more comfortable on the command line, and find ways it can support, or entertain, you.
-->

---
layout: two-cols
hideInToc: true
---

![qr code for terminal.bowmanjd.com](/qrcode.svg)

# [terminal.bowmanjd.com](https://terminal.bowmanjd.com)

::right::

- [github.com/bowmanjd/terminaltalk](https://github.com/bowmanjd/terminaltalk)
- <span class="email">jonathan@bowma<i>.obfusticinator.</i>njd.com</span>
- [bowmanjd.com](https://bowmanjd.com)
- [dev.to/bowmanjd](https://dev.to/bowmanjd/)
- [linkedin.com/in/jonathan-d-bowman](https://www.linkedin.com/in/jonathan-d-bowman/)
- [twitter.com/jdbowman](https://twitter.com/jdbowman)
- [fosstodon.org/@bowmanjd](https://fosstodon.org/@bowmanjd)

<!--

This is the link to this slide deck as well as a few links my online presences. Feel free to reach out any time. Note the companion repo to this presentation if you are interested.

-->

---

![dmesg output](/dmesg.gif)

---

````md magic-move
```text
console (noun)
con·sole ˈkän-ˌsōl 
Synonyms of console
1 : an architectural member projecting from a wall to form a bracket or from a keystone for ornament
2 : console table
3 a : an upright case that houses the keyboards and controlling mechanisms of an organ and from which the organ is played
  b
: a combination of readouts or displays and an input device (such as a keyboard or switches)
  by which an operator can monitor and interact with a system (such as a computer or dubber)
4 a : a cabinet (as for a radio or television set) designed to rest directly on the floor
  b : a small storage cabinet between bucket seats in an automobile
5 : an electronic system that connects to a display (such as a television set) and is used primarily to play video games

console (verb)
con·sole kən-ˈsōl 
consoled; consoling
transitive verb
: to alleviate the grief, sense of loss, or trouble of : comfort
  console a widow
  I consoled myself with the thought that things could be much worse.
```

```text
: a combination of readouts or displays and an input device (such as a keyboard or switches)
  by which an operator can monitor and interact with a system (such as a computer or dubber)
: to alleviate the grief, sense of loss, or trouble of : comfort
```
````

<!--

Let's do a little bit of word play. There is console the noun and console the verb, as seen in this excerpt from Merriam-Webster. Console (noun) is used to control or support a system. Console (verb) means to comfort. Let's try to bring those two together today.

-->

---
layout: image-right
image: /console-bracket.jpg
backgroundSize: contain
---

## Alleviate the Load

<!--

- console and console (v) come from the same root in French, so console (n) is something that alleviates the load (wiktionary)
- Here is a console bracket, designed to alleviate the load

-->

---
layout: two-cols
---

<!-- <div style="align-content: center"> -->
![handheld game console](/gameboy.svg)

::right::

![terminal](/terminal.svg)

---
layout: image
image: /sixel.gif
backgroundSize: contain
---

---
