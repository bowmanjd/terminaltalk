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
download: false
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

<!--

The stereotype of the command-line is that it is inhospitable

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

The command line can be:

- fun
- personal
- humorous
- good-looking
- helpful

<!-- And now we are all wondering if the command line may in fact be a pleasant date. Indeed, my hope for you is that if you give it a chance you will find it downright companionable, a partner you would miss if you ever parted. -->

---
layout: two-cols
---

<!-- <div style="align-content: center"> -->
![handheld game console](/gameboy.svg)

::right::

![terminal](/terminal.svg)

<!--
Yet another word association -- the command-line console can also be a bit of a game console.
-->

---

<SlidevVideo v-click autoplay autoreset='click'>
  <source src="/tetris.webm" type="video/webm" />
</SlidevVideo>

<!-- 
For instance, you can actually play games... Tetris is a great fit for the terminal.
-->

---

<SlidevVideo v-click autoplay autoreset='click'>
  <source src="/ttyper.webm" type="video/webm" />
</SlidevVideo>

<!-- 
Typing tutors suit the terminal well. This one is called "ttyper".
-->

---

<SlidevVideo v-click autoplay autoreset='click'>
  <source src="/solitaire.webm" type="video/webm" />
</SlidevVideo>

<!-- Solitaire! I will admit I am not yet convinced this is a perfect fit for the terminal. Honestly, using a physical card deck might appeal to me more. -->

---

<SlidevVideo v-click autoplay autoreset='click'>
  <source src="/adventure.webm" type="video/webm" />
</SlidevVideo>

<!-- One type of game I love playing in the terminal is what used to be called text adventure games, and are now more often called interactive fiction. Here is the first one, created around 1975. You can play it today, still, and it is worth a few hours of fun, at least. -->

---

![zork](/zork.png)

<!-- Zork is another classic, from a couple years later. Zork 1, 2, and 3 are all publicly available now. -->

---

![gourmet](/gourmet.png)

<!-- But don't be deceived, this is a contemporary genre as well, with new authors and competitions and festivals. One of my favorite interactive fiction pieces is fairly short -- you can likely finish it an hour or two, and it is called Gourmet. It is also an excellent example of interactive fiction that is not the old dungeons or fantasy style. It takes place in a restaurant. And the primary conflict revolves around a very troublesome lobster. -->

---

# Interactive Fiction

- You likely need a "Z-machine interpreter" like Frotz
- [Beginner Resources](http://brasslantern.org/beginners/)
- [The Interactive Fiction Community Forum](https://intfiction.org/)
- [The Interactive Fiction Wiki](https://ifwiki.org/)
- [Interactive Fiction Database](https://ifdb.org/)
- [Planet Interactive Fiction](https://planet-if.com/)
- [The Interactive Fiction Archive](https://www.ifarchive.org/)

---

Does your terminal support sixel? Some options:

- WezTerm, Visual Studio Code, Warp
- iTerm2 and MacTerm
- Windows Terminal Preview
- xterm, konsole, foot, xfce-terminal, contour

---
layout: image
image: /sixel.gif
backgroundSize: contain
---

Does your terminal support sixel?

---

# Discussion

- A command I really like is _____
- Is there a command for this thing I want to do: __________?

---
