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

# Pick your terminal (what you already have is good)

- [WezTerm](https://wezterm.org/)
- Mac: [iTerm2](https://iterm2.com/) or Terminal
- Windows Terminal
- Linux: [Konsole](https://konsole.kde.org/) or [Gnome Terminal](https://help.gnome.org/users/gnome-terminal/stable/) (I love [foot](https://codeberg.org/dnkl/foot))
- ChromeOS: [enable Linux](https://chromeos.dev/en/productivity/terminal)
- Also great: [Kitty](https://sw.kovidgoyal.net/kitty/), [Alacritty](https://alacritty.org/), [Ghostty](https://ghostty.org/)
- Android: [Termux](https://termux.dev)
- iOS: [a-shell](https://apps.apple.com/us/app/a-shell/id1473805438) or [iSH](https://apps.apple.com/us/app/ish-shell/id1436902243) or use an SSH app (such as [Termius](https://www.apple.com/us/search/termius)) and connect to a server

<!--

A brief detour just to help us get started. First you need a terminal.

-->

---

# Choose your package manager(s)

- Mac: [brew.sh](https://brew.sh) then `brew install qrencode`
- Windows: [scoop.sh](https://scoop.sh) then `scoop install qrencode` ([chocolatey](https://chocolatey.org/) or [winget](https://learn.microsoft.com/en-us/windows/package-manager/) may also have the desired tools and toys)
- Linux: 
	* Debian/Ubuntu: `apt install qrencode`
	* Fedora: `dnf install qrencode`
- Determinate/functional hipsters: [nix package manager](https://nixos.org/)

<!--
Then we need an easy way to install toys. Depends on your operating system, but there are always some good options.
-->

---

# Containers

- docker
- podman
- nerdctl

All of these run a mini Linux OS (or many!) and typically a container provides one tool or service. You do not need these to be successful on the command-line, but it does open up the possibilities.

---

# Companion container

`docker run -it ghcr.io/bowmanjd/alpine-cposc`

- Linux: install podman or docker with your package manager
- Mac or Windows: [Rancher Desktop](https://rancherdesktop.io/) or [Podman](https://podman.io/docs/installation)

<!--

I did create a container that goes along with this presentation and includes most of the tools and games I mention here. Feel free to use it. If you are using podman, just use that in place of the word docker in this command.

-->

---
layout: center
---

**Fun**{.biggie}

<!-- Let's dive into fun things to do in the terminal -->

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
layout: center
---

**Personal**{.biggie}

<!-- The console is personal -->

---

Command line applications are:

- relatively easy to write
- often open source
- tend to favor configurability
- forever trying to make your life "better"

<!--

By personal, I mostly mean you can use terminal apps to make your environment what you want. And most terminal apps are made to be malleable, to conform to your preferences.

-->

---

# Shells

- bash
- zsh
- Powershell
- fish
- nushell
- xonsh
- elvish
- ash/dash

<!--

For instance, shells. These are the command interpreters. If you are starting out, I'd advise that you stick with Powershell on Windows, Bash on Linux, and Zsh on Mac. In other words, don't worry about it and use what is there. But you can certainly use any of those three on any operating system. Or you can be hip and use fish.

-->

---

## Theming your shell

- [ohmyzsh](https://ohmyz.sh/)
- [ohmybash](https://ohmybash.nntoan.com/)
- [ohmyposh](https://ohmyposh.dev)

---

## Custom prompts

- Every shell comes with its own means of customizing the command prompt
- I like to use [starship](https://starship.rs/) on bash, zsh, Powershell...

<!-- I deeply respect ohmyzsh and the like, but find my desires are met by using starship everywhere -->

---

## Color themes

- [catppuccin](https://catppuccin.com/)
- [dracula](https://draculatheme.com/)
- [nord](https://www.nordtheme.com/)
- [Iceberg](https://cocopon.github.io/iceberg.vim/)
- [One Half ½](https://github.com/sonph/onehalf)
- [Rosé Pine](https://rosepinetheme.com/)
- [Solarized](https://ethanschoonover.com/solarized/)
- [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme)
- [gruvbox](https://github.com/morhetz/gruvbox)

---

## Modernize/Customize/Personalize the tools themselves

- `pwd` (**p**rint **w**orking directory)
- `ls` ⇢ `eza` (**l**ist a directory)
- `cd` ⇢ `z` from zoxide (**c**hange **d**irectory)
- `cat` ⇢ `bat` (output and/or con**cat**enate files)
- `find` ⇢ `fd` (search for filenames)
- `grep` ⇢ `rg` (ripgrep; search for content within files)
- `exit` does what it says (also try `ctrl-d`)

<!--

Now let's talk personalization as well as basic commands. A brief review of the essential commands: (read first 4). These work on bash, zsh and Powershell.

These are old standbys, but there are modern alternatives you may want to experiment with, because of added functionality or just because they look prettier. eza, for instance, will put pretty icons in your directory listings. bat will color-code (that is, syntax highlight) and line number your output. zoxide is a little new for me, but has already replaced my cd command and allows me to navigate directories so much faster, because it remembers where I have been, and makes it easy to return to directories I use the most. fd and ripgrep are essential to me because they are cross-platform and uniform, and fast and feature-full.

-->

---

## Aliases or Functions

- `alias ls="eza"` (bash/zsh)
- `Set-Alias -Name ls -Value eza` (Powershell)
- `alias up="sudo apt update && sudo apt upgrade -y"` (bash/zsh)
- `up () { sudo apt update && sudo apt upgrade -y; }` (bash/zsh)
- `function up { scoop update -a @args }` (Powershell)

To make permanent, put in `$HOME/.profile` and the like (see $profile in Powershell).

<!--

This brings us to aliasing. eza, for instance, can serve well as a drop-in replacement for ls. And sometimes there are long commands that you type so often, you want to replace them with something short and easy to remember. "-y" is already an alias of sorts for "yes, do it, I mean it for real this time"

-->

---
layout: center
---

# Public Service Announcement 

- slashes lean to the right
- when in doubt, quote
- your nemesis: spaces in directory and file names

---

## Write your own tools

- a script is simply putting multiple commands in file and running it
- learn a new programming language by writing a command-line tool

---

## Robust libraries

- Python: [textualize](https://www.textualize.io/) and [rich](https://rich.readthedocs.io/en/stable/introduction.html)
- Go: [charm.sh](https://charm.sh/) including Huh?, Bubble Tea, Gum...
- Javascript: [ink](https://term.ink/) or [terminal-kit](https://github.com/cronvel/terminal-kit) or [enquirer](https://github.com/enquirer/enquirer)
- Rust: [ratatui](https://ratatui.rs/) or [iocraft](https://github.com/ccbrown/iocraft)
- .NET: [Spectre.Console](https://spectreconsole.net/) or [Terminal.Gui](https://github.com/gui-cs/Terminal.Gui)
- Either built-in or as a library, your language of choice will also have a variety of easy ways to parse command-line parameters and config files.
 
---

## Create tools even if you don't know how

- Because of the simplicity and textual interface of CLI apps, LLMs can get it right most of the time
- Use a language model known for good coding: Claude 3.5 or 3.7, Gemini 2.5 Pro, or OpenAI 4.1
- Use a programming language in which LLMs excel: Python, for instance. But if you are already familiar with a language, use that one



<!--
text-based apps are great for LLMs and tool-calling, but LLMs also make great apps.
-->

---

# An example single-shot prompt

> Write a Python command-line script with no external dependencies. The script should show the temperature forecast in Fahrenheit for 6:00am the next morning, and the percentage chance of rain. The only API you should use is wttr.in. Default location should be Lancaster, PA

Errors? Feed the full error text back to the LLM (or a different one) and ask it to correct the program until it works

---
layout: center
---

[Humorous]{.biggie}

<!--

As can be seen in the interactive fiction I noted earlier, when most of the energy in a terminal user interface goes into the words, there is time and space for creative comedy. When the primary interface involves words, there will be plenty of opportunity to laugh at yourself.

-->

---

# Oops. I typed `sl`

<!-- <SlidevVideo v-click autoplay autoreset='click'>
  <source src="/sl.webm" type="video/webm" />
</SlidevVideo> -->

![sl](/sl.gif)

---
layout: center
---

[Good-looking]{.biggie}

---
layout: image
image: /asciiquarium.gif
backgroundSize: contain
---

<!-- a very practical tool -->

---
layout: image
image: /sixel.gif
backgroundSize: contain
---

<!--
Does your terminal support sixel? Some options:

- WezTerm, Visual Studio Code
- iTerm2
- Windows Terminal Preview
- xterm, konsole, foot, xfce-terminal, contour
-->

---

## figlet

---

<SlidevVideo v-click.hide autoplay autoreset='click'>
  <source src="/pipes.webm" type="video/webm" />
</SlidevVideo>

<!--

A note about pipes, which I used briefly with figlet. Not these pipes

-->

---

## Pipes

````md magic-move
```sh
article='https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext&titles=Computer_terminal'
wget -O - "$article" | jq -r '.query.pages[].extract' | more
```

```ps1
$article='https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext&titles=Computer_terminal'
(Invoke-RestMethod -Uri $article).query.pages | Select-Object -ExpandProperty * | Select-Object -ExpandProperty extract
```

```ps1
$article='https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext&titles=Computer_terminal'
(irm $article).query.pages | select -Exp * | select -Exp extract
```

````

---
layout: image
image: /termgl.gif
backgroundSize: contain
---

<!-- This is TermGL, a c library for creating terminal animations -->

---


# Discussion

- A command I really like is _____
- Is there a command for this thing I want to do: __________?

---
