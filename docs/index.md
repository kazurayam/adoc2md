- Table of contents
{:toc}

# Lorem ipsum

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## Ut enim ad minim veriam

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

### Duis aute irure dolor

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

#### Excepteur sint occaecat cupidatat

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

# Quo usque tandem abutere

Quo usque tandem abutere, Catilina, patientia nostra?

# Header with (& - \_ : ; ) non Latin Characters

Quam diu etiam furor iste tuus nos eludet?

# docs/adoc2md.sh

    #!/bin/bash

    # Under the current working directory, convert all the files
    # with name ending with `_.adoc` into `.md`.
    # A file with name `*_.adoc` is an Asciidoc document file.
    # A file with name `*.md` is a Markdown document file.
    # E.g, `index_.adoc` will be converted into `index.md`
    #
    # However, ffiles with name which starts with with `_` will be ignored.
    # E.g, `_index_.adoc` will be ignored.
    #
    # How to run this: in the command line, just type
    #
    #     `> ./adoc2md.sh`
    #
    # By specifying `-t` option in the command line,
    #
    #     `> ./adoc2md.sh -t`
    #
    # you can prepend a text segment into the output .md file:
    #
    # ```
    # - Table of Contents
    # {:toc}
    #
    # ```
    # This text segment will affect the [Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll)
    # used by GitHub Pages to generate a table of contents.
    #

    requireTOC=false

    optstring="t"
    while getopts ${optstring} arg; do
      case ${arg} in
        t)
            requireTOC=true
            ;;
        ?)
            ;;
      esac
    done

    function processFile() {
      fname=$1
      #echo "fname=${fname}"
      #  using Asciidoctor, convert a *.adoc file into a docbook in XML
      md=${fname//adoc/md}
      xml=${fname//adoc/xml}
      echo "converting $fname into $md"
      asciidoctor -b docbook -a leveloffset=+1 -o - "$fname" > "$xml"
      # using Pandoc, generate a Markdown file without TOC
      cat "$xml" | pandoc --markdown-headings=atx --wrap=preserve -t markdown_strict -f docbook - > "$md"
      #echo deleting $xml
      rm -f "$xml"

      # We named `index_.adoc` rather than `index.adoc` because GitHub puts precedence to `index.adoc` over `index.md`. We want `index.md` to be presented first, not `*.adoc`. Therefore we named our adoc file with `*_.adoc` postfix.
      # This trick required further treatment.
      # `index_.adoc` will result `index_.adoc`. But we
      # want the final result to be `index.md`.
      # So, we will rename `*_.md` into `*.md`.
      # in other words, chomp an underline character (_) before `.md``
      # e.g,
      #   ./index_.adoc    -> ./index.md
      #   ./index-ja_.md -> ./index-ja.md
      newmd=${md%_.md}.md
      echo renaming $md to $newmd
      mv $md $newmd

      # Slightly modify the generated *.md file.
      # Prepend a text segment:
      # ```
      # - Table of contents
      # {:toc}
      # ```
      if [ $requireTOC = true ]; then
        echo "- Table of contents" > temp.md
        echo "{:toc}" >> temp.md
        echo "" >> temp.md
        cat $newmd >> temp.md
        cat temp.md > $newmd
        rm temp.md
        echo prepended the TOC segement in $newmd
      fi
      # just a blank line to separate the *.adoc files processed
      echo ""
    }



    # iterate over all *.adoc files
    find . -iname "*_.adoc" -type f -maxdepth 1 -not -name "_*.adoc" | while read fname; do
      processFile $fname
    done

# PlantUML diagram example

<figure>
<img src="https://kazurayam.github.io/adoc2md/diagrams/out/sequence/sequence.png" alt="sequence" />
</figure>

# 宮沢賢治の詩その1

心象スケッチ　春と修羅

    わたくしといふ現象は
    仮定された有機交流電燈の
    ひとつの青い照明です
    （あらゆる透明な幽霊の複合体）
    風景やみんなといつしよに
    せはしくせはしく明滅しながら
    いかにもたしかにともりつづける
    因果交流電燈の
    ひとつの青い照明です
    （ひかりはたもち　その電燈は失はれ）

    これらは二十二箇月の
    過去とかんずる方角から
    紙と鉱質インクをつらね
    （すべてわたくしと明滅し
    　みんなが同時に感ずるもの）
    ここまでたもちつゞけられた
    かげとひかりのひとくさりづつ
    そのとほりの心象スケッチです

# 宮沢賢治の詩その2

    雨ニモマケズ
    風ニモマケズ
    雪ニモ夏ノ暑サニモマケヌ
    丈夫ナカラダヲモチ
    欲ハナク
    決シテ瞋ラズ
    イツモシヅカニワラッテヰル
    一日ニ玄米四合ト
    味噌ト少シノ野菜ヲタベ
    アラユルコトヲ
    ジブンノカンジョウニ入レズニ
    ヨクミキキシワカリ
    ソシテワスレズ
    野原ノ松ノ林ノ蔭ノ
    小サナ萱ブキノ小屋にヰテ
    東に病気ノコドモアレバ
    行ッテ看病シテヤリ
    西ニ疲レタ母アレバ
    行ッテソノ稲ノ束ヲ負ヒ
    南ニシニサウナ人アレバ
    行ッテコハガラナクテモイゝトイヒ
    北にケンクヮヤソショウガアレバ
    ツマラナイカラヤメロとイヒ
    ヒドリノトキハナミダヲナガし
    サムサノナツハオロオロアルキ
    ミンナニデクノボー トヨバレ
    ホメラレモセズ
    クニモサレズ
    サウイフモノニ
    ワタシハナリタイ

    南無無辺行菩薩
    南無上行菩薩
    南無多宝如来
    南無妙法蓮華経
    南無釈迦牟尼仏
    南無浄行菩薩
    南無安立行菩薩
