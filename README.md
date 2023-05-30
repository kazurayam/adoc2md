# adoc2md

## What is this project for?

I want to author documents of my own programming project in the [Asciidoc](https://asciidoc.org/) format, and publish them on GitHub Pages in the [GitHub Flavored Markdown](https://github.github.com/gfm/) format (a.k.a. GFM). Also, I want to add a table of contents to my documents written in GFM.

The above phrase looks simple. But actually it involves several technical issues to resolve. In this project, I will present a resolution for me. 

## What this project provides?

- ['docs/adoc2md.sh`](https://kazurayam.github.io/adoc2md/adoc2md.sh)

This is a small shell script (bash) tested on macOS that does the following:

1. the script transforms a file `<projectDir>/docs/index_.adoc` written in Asciidoc format into a file `docs/index.md` in GitHub Flavored Markdown format. To implement this, [Asciidoctor](https://asciidoctor.org/) and [Pandoc](https://pandoc.org/) are used.
2. the script modifies the output `index.md` file so that it can add a table of contents utilizing the [Jekyll Blog](http://www.seanbuscay.com/blog/jekyll-toc-markdown/)'s feature. 

## How to use it


```
$ cd adoc2md
$ ./gendocs.sh
```

or

```
$ cd adoc2md
$ gradle gendocs
```

## Sample documentation written in Asciidoc with TOC

See https://kazurayam.github.io/adoc2md/

