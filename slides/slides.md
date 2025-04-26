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

![Tools and Toys](/tools_toys.svg){style="margin: 0 auto"}

## The hospitality and playfulness of the console

[terminal.bowmanjd.com](https://terminal.bowmanjd.com)

<!--
It is an honor to be here. I am Jonathan Bowman. I am a hobbyist developer. I have been a teacher, preacher, web developer, IT director, software project manager, and now I write SQL, Javascript, and C# all day at Cargas. Cargas is the most humane and thoughtful place I have ever worked with technology, and I am proud to be there. I use Vim, I like Linux, I am pretty good with Python and bash and Powershell, and even a little Rust. I have a pretty cool family, though they have varying levels of comfort on the command-line.

I do feel pretty comfortable on the command-line. And I hope that this time together today might encourage you to be a bit more comfortable on the command line, and find ways it can support, or entertain, you.
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

You might call it the terminal, the command-line, the shell... While there are subtle differences, we will use them mostly interchangeably today. I have to admit that the stereotype of the console-based tools are that they are confusing and inhospitable

-->

---
layout: image-right
image: /console-bracket.jpg
backgroundSize: contain
---

## Alleviate the Load

<!--

- While the console might be intimidating, we do appreciate being **consoled** don't we?
- console and console (v) come from the same root in French, in fact console (n) originally meant something that alleviates the load (wiktionary)
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
layout: image-left
image: /heart.svg
backgroundSize: contain
---

The command line can be:

- Fun
- Personal
- Humorous
- Good-looking
- Helpful

<!-- And now we are all wondering if the command line may in fact be a pleasant date. Indeed, my hope for you is that if you give it a chance you will find it downright companionable, a friend you'd like to meet -->

---
layout: image-left
image: /terminal.svg
backgroundSize: contain
---

# Pick your terminal

- [WezTerm](https://wezterm.org/) or [VSCode](https://code.visualstudio.com/)
- Mac: [iTerm2](https://iterm2.com/), Terminal
- Windows Terminal
- Linux: [Konsole](https://konsole.kde.org/), [Gnome Terminal](https://help.gnome.org/users/gnome-terminal/stable/), [foot](https://codeberg.org/dnkl/foot)
- ChromeOS: [enable Linux](https://chromeos.dev/en/productivity/terminal)
- [Kitty](https://sw.kovidgoyal.net/kitty/), [Alacritty](https://alacritty.org/), [Ghostty](https://ghostty.org/)
- Android: [Termux](https://termux.dev)
- iOS: [a-shell](https://apps.apple.com/us/app/a-shell/id1473805438), [iSH](https://apps.apple.com/us/app/ish-shell/id1436902243) or SSH client like [Termius](https://www.apple.com/us/search/termius)

<!--

A brief detour just to help us get started. First you need a terminal. Use the one you are with. Or, on Windows... Mac... Linux... Wezterm is pretty cool if you want to download one.

-->

---
layout: image
image: /package_manager.svg
backgroundSize: contain
---

<!-- you will want something to install packages -->

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
layout: image-right
image: /container.svg
backgroundSize: 70%
---

# Containers

docker, podman, nerdctl, etc... All of these run a mini Linux OS (or many!) and typically a single container provides one tool or service. You do not need to use containers to be personally successful on the command-line, but it does open up possibilities.

---

# Companion container

`docker run -it ghcr.io/bowmanjd/alpine-cposc`

Mac or Windows: [Rancher Desktop](https://rancherdesktop.io/) or [Podman](https://podman.io/docs/installation)

![Podman Desktop and Rancher Desktop](/podman_rancher_desktop.svg)

<!--

I did create a container that goes along with this presentation and includes most of the tools and games I mention here. Feel free to use it. If you are using podman, just use that in place of the word docker in this command. 

On Linux: install podman or docker with your package manager. On Windows or Mac...

-->

---
layout: image-right
image: /gameboy.svg
backgroundSize: contain
---

**Fun**{.biggie}

<!--
Yet another word association -- the command-line console can also be a bit of a game console.

Let's dive into fun things to do in the terminal
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
layout: fact
---

# Telehack

- `ssh -p 2222 guest@telehack.com`

---

<SlidevVideo v-click autoplay autoreset='click'>
  <source src="/adventure.webm" type="video/webm" />
</SlidevVideo>

<!-- I hope you will permit me to geek out a bit over one of my interests. One type of game I love playing in the terminal is what used to be called text adventure games, and are now more often called interactive fiction. Here is the first one, Adventure, created around 1975. You can play it today, still, and it is worth a few hours of fun, at least. -->

---

![zork](/zork.png)

<!-- Zork is another classic, from a couple years later. Zork 1, 2, and 3 are all publicly available now. -->

---

![gourmet](/gourmet.png)

<!-- But don't be deceived, this is a contemporary genre as well, with new authors and competitions and festivals. One of my favorite interactive fiction pieces is fairly short -- you can likely finish it an hour or two, and it is called Gourmet. It is also an excellent example of interactive fiction that is not the old dungeons or fantasy style. It takes place in a restaurant. And the primary conflict revolves around a very troublesome lobster. -->

---
layout: image-right
image: /zork.jpeg
backgroundSize: contain
---

# Interactive Fiction

- [Beginner Resources](http://brasslantern.org/beginners/)
- [The Interactive Fiction Community Forum](https://intfiction.org/)
- [The Interactive Fiction Wiki](https://ifwiki.org/)
- [Interactive Fiction Database](https://ifdb.org/)
- [Planet Interactive Fiction](https://planet-if.com/)
- [The Interactive Fiction Archive](https://www.ifarchive.org/)

<!-- To play many pieces of interactive fiction, you will need a "Z-machine interpreter" like Frotz. I included many links here should you want to get to know the genre. -->

---
layout: image-left
image: /palette.svg
backgroundSize: contain
---

**Personal**{.biggie}

<!-- In addition to being fun, the console is also personal -->

---
layout: image-right
image: /open_source.svg
backgroundSize: contain
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
layout: image-left
image: /bash.svg
backgroundSize: contain
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

For instance, shells. A shell is simply a command interpreter. If you are starting out, I'd advise that you stick with Powershell on Windows, Bash on Linux, and Zsh on Mac. In other words, don't worry about it and use what is there. But you can certainly use any of those three on any operating system. Or you can be hip and use fish. Or something more interesting.

-->

---
layout: image-right
image: /ohmyzsh.svg
backgroundSize: contain
---

## Theming your shell

- [ohmyzsh](https://ohmyz.sh/)
- [ohmybash](https://ohmybash.nntoan.com/)
- [ohmyposh](https://ohmyposh.dev)

<!-- I just wanted to give some applause to ohmyzsh, which some years ago popularized theming your terminal and your prompt in particular. It was followed by similar endeavors for bash and Powershell. One of these may well suit your fancy as you personal your terminal -->

---
layout: image
image: /starship.svg
backgroundSize: contain
---

## Custom prompts

- Every shell already comes with its own means of customizing the command prompt
- I like to use [starship](https://starship.rs/)


<!-- I deeply respect ohmyzsh and the like, but find my desires are met by using starship everywhere -->

---
layout: image-right
image: /catppuccin.svg
backgroundSize: contain
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

<!-- speaking of themes, there are many to choose from. You can theme your terminal, theme various terminal apps. Maybe even switch your theme every few months or years. -->

---

## Modernize/Customize/Personalize the tools themselves

- `pwd` (**p**rint **w**orking directory)
- `ls` ⇢ `eza` (**l**ist a directory)
- `cd` ⇢ `z` from zoxide (**c**hange **d**irectory)
- `cat` ⇢ `bat` (output and/or con**cat**enate files)
- `exit` does what it says (also try `ctrl-d`)
- `find` ⇢ `fd` (search for filenames)
- `grep` ⇢ `rg` (ripgrep; search for content within files)

<!--

Let's introduce a few basic commands and discuss how even they can be personalized. (read first 4). These work on bash, zsh and Powershell.

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
layout: image-right
image: /chezmoi.svg
backgroundSize: contain
---

## "Dotfiles"

Configuration files that pre-configure your command-line (and gui) apps are sometimes called dotfiles.

[bowmanjd.com/dotfiles/](https://www.bowmanjd.com/dotfiles/).

Or consider [chezmoi](https://www.chezmoi.io/)

<!-- 
Many command-line tools can be configured not only with command-line parameters, but with configuration files. These configuration files have historically been prefixed with a "." so they are sometimes called dotfiles. And you can store all of them in version control (such as a version control system like `git`).
I fell down the rabbit hole a couple years ago and wrote a blog series at [bowmanjd.com/dotfiles/](https://www.bowmanjd.com/dotfiles/).
No need to overthink it; find a simple way that works for you.
-->

---
layout: center
---

# Public Service Announcement 

- slashes lean to the right: /
- "when in doubt", 'quote'
- FileNames and directory_names are better without spaces
- Type as little as possible. Tab completion is your friend.

---
layout: image-right
image: /handtools.svg
backgroundSize: contain
---

## Write your own tools

- a script is simply putting multiple commands in file and running it
- learn a new programming language by writing a command-line tool

<!-- The ultimate in personalization is writing your own stuff -->

---

## Robust libraries

- Python: [textualize](https://www.textualize.io/) and [rich](https://rich.readthedocs.io/en/stable/introduction.html)
- Go: [charm.sh](https://charm.sh/) including Huh?, Bubble Tea, Gum...
- Javascript: [ink](https://term.ink/) or [terminal-kit](https://github.com/cronvel/terminal-kit) or [enquirer](https://github.com/enquirer/enquirer)
- Rust: [ratatui](https://ratatui.rs/) or [iocraft](https://github.com/ccbrown/iocraft)
- .NET: [Spectre.Console](https://spectreconsole.net/) or [Terminal.Gui](https://github.com/gui-cs/Terminal.Gui)
- Either built-in or as a library, your language of choice will also have a variety of easy ways to parse command-line parameters and config files.

<!-- Learning a programming language or framework with a terminal app as your goal can be very satisfying, due to its straightforward simplicity.  Here are some suggested frameworks. -->
 
---
layout: image-left
image: /lightbulb.svg
backgroundSize: contain
---

## Create tools even if you don't know how

- CLI apps are textual, so LLMs often get it right
- Current good coders: Claude 3.7 Sonnet, Gemini 2.5 Pro, OpenAI 4.1
- LLMs favor Python. Or a language you know

<!--
text-based apps are great for LLMs and tool-calling, but LLMs also make great apps.
-->

---

# An example single-shot prompt

> Write a Python command-line script with no external dependencies. The script should show the temperature forecast in Fahrenheit for 6:00am the next morning, and the percentage chance of rain. The only API you should use is wttr.in. Default location should be Lancaster, PA

Errors? Feed the full error text back to the LLM (or a different one) and ask it to correct the program until it works

---
layout: image-left
image: /humor.svg
backgroundSize: contain
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

<!-- one person grew so frustrated with their own mistyping of the common command "ls" that they wrote a program called "sl" which of course stands for steam locomotive. If you install it, you will be rewarded every time you get ls backwards. -->

---
layout: image-left
image: /comb.svg
backgroundSize: contain
---

[Good-looking]{.biggie}

<!-- contrary to the sterotypes, terminals can be beautiful -->

---
layout: image
image: /asciiquarium.gif
backgroundSize: contain
---

<!-- asciiquarium is a very practical tool. For half of my family, this was their favorite slide in the deck. You will notice that ascii art is a common theme in the terminal -->

---
layout: image
image: /sixel.gif
backgroundSize: contain
---

<!--
But modern terminals can also support graphics. Does your terminal support sixel? Some options: WezTerm, Visual Studio Code, iTerm2, Windows Terminal Preview, xterm, konsole, foot, xfce-terminal, contour.

-->

---
layout: image
image: /figlet.png
backgroundSize: contain
---

<!--

figlet generates ascii text banners

-->

---

<SlidevVideo v-click autoplay autoreset='click'>
  <source src="/figlet.webm" type="video/webm" />
</SlidevVideo>

<!-- figlet has a variety of fonts, and you can install more. You can pair it with other tools to add a splash of color -->

---

<SlidevVideo v-click autoplay autoreset='click'>
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

<!-- This is TermGL, a c library for creating terminal animations. There are other similar libraries if that is your interest. -->

---
layout: image
image: /top_btm.png
---

<!-- On the right half is top, on the left is bottom. I find that there are good old tools that are useful workhorses, but there are often newer alternatives in which someone has put effort into improving interface and design. And adding colors and borders. -->

---
layout: image-left
image: /help.svg
backgroundSize: contain
---

[Helpful]{.biggie}

<!-- At the end of the day, I use the command-line because it provides efficient and enjoyable help for the things I am trying to do. And I can easily find help to figure out how to use the command-line tools I am learning. -->

---
layout: image-right
image: /manual.svg
backgroundSize: contain
---

## Getting help

- `ffmpeg -h`
- `qrencode --help`
- `Set-Content -?`
- `git help commit`
- `Get-Help iwr`
- `man magick`

<!--

A variety of ways to get help with a command, built into the command or the shell or the operating system.

-->

---

# cheat.sh

Obtain "cheatsheets" on the command-line using an CLI http client like `wget`, `curl`, or `Invoke-WebRequest`:

`wget -qO - https://cheat.sh/magick`

---

## tldr.sh

A command-line tool for getting straightforward examples on how to use a command:

`tldr ffmpeg`

Also has a nice web interface at [tldr.inbrowser.app](https://tldr.inbrowser.app/)

---
layout: image
image: /tmux.png
backgroundSize: contain
---

---

## Multiplexers

Like window managers for your terminal, no matter what terminal you are using. Multiple panes, windows, and can be themed.

- tmux
- zellij

<!-- tmux you saw on the previous page, and is what I have been using for years. zellij is the new hotness, and I am currently planning the plan to switch -->

---

## HTTP

- wget
- curl
- Invoke-WebRequest (Powershell)
- httpie (it's like Postman on the command line)
- Invoke-RestMethod (might be the best reason to use Powershell)

<!-- I just wanted to throw some tools at you that I enjoy, in case you might find them helfpul -->

---

## qrencode

`qrencode -o - -t ANSI256UTF8 https://cposc.org/`

![cposc QR code](/cposc_qr.svg){style="height:20%"}

<!-- qrencode is useful for presentations like this, or when I want an easy way to get text or URL from my computer screen to my phone, or to a friend's phone. -->

---
layout: image-right
image: /imagemagick_ffmpeg.svg
backgroundSize: contain
---

## Manipulating images and videos

- `ffmpeg`
- `magick` (ImageMagick)

<!-- So much of our world involves transcoding video from one format to another, or converting images from one format to another. The workhorses behind most of those endeavors are the command-line video editor ffmpeg and the image manipulation tool ImageMagick. Randall Monroe of XKCD believes ImageMagick is one of those foundation projects that holds up the universe. He wrote "Someday ImageMagick will finally break for good and we'll have a long period of scrambling as we try to reassemble civilization from the rubble." But it is working fine. Want to create animated gifs, or shorten or crop a video? These are your friends. They are also rather complex beasts. Use cheatsheets or LLMs to help you.
-->

---
layout: image-right
image: /editors.svg
backgroundSize: contain
---

## Editing files

- [micro](https://micro-editor.github.io/index.html) is intuitive
- [Neovim](https://neovim.io/) is old and hip
- [Helix](https://helix-editor.com/) is "post-modern"

<!--
Editing files in the terminal might be something you _have_ to do, or it might be something you _want_ to do. Whichever fits you, there is an editor for that. Micro works like you expect. The others do not, but they are amazing.
-->

---
layout: image-left
image: /markdown.svg
backgroundSize: contain
---

## Markdown

- Converts to html with tools like [comrak](https://github.com/kivikakk/comrak)
- Open the html with your browser, save as pdf
- [Learn it in 60 seconds](https://commonmark.org/help/)

<!-- I rarely use a word processor. This entire presentation was composed in Neovim using Markdown, and I find the tooling far more capable than Powerpoint.  (read points) -->

---
layout: image-left
image: /ollama.svg
backgroundSize: contain
---

## Host your own LLM with [ollama](https://ollama.com/)

- `ollama run gemma3:4b`
- or other model from [ollama.com/models](https://ollama.com/models)
- or GGUF models from [huggingface](https://huggingface.co/models?library=gguf)

<!-- Yes, the command-line is great for chatting with and using Language Models and associated tools. -->

---
layout: image-right
image: /aider_goose.svg
backgroundSize: contain
---

## Access LLMs in the terminal

- [aider](https://aider.chat/)
- [goose](https://block.github.io/goose/)

---

<SlidevVideo v-click autoplay autoreset='click'>
  <source src="/aider.webm" type="video/webm" />
</SlidevVideo>

<!-- I will admit I am quite taken with aider. It works with any editor, any IDE. You can actually put comments in something you are editing, and say things like "explain this function" or "explain this paragraph" or even "write documentation for this function" or "fix the error in this line" and it will, and then erase your comment, while making it simple to revert the change if you don't like it. -->

---
layout: image
image: thanks.png
backgroundSize: contain
---

---
layout: image-right
image: /speech.svg
backgroundSize: contain
---

# Discussion

- A command I really like is ＿＿＿＿
- Is there a command for this thing I want to do...?

