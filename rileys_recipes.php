<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<!-- 2023-06-25 Sun 14:17 -->
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>simponic</title>
<meta name="author" content="Elizabeth Hunt" />
<meta name="generator" content="Org Mode" />
<style>
  #content { max-width: 60em; margin: auto; }
  .title  { text-align: center;
             margin-bottom: .2em; }
  .subtitle { text-align: center;
              font-size: medium;
              font-weight: bold;
              margin-top:0; }
  .todo   { font-family: monospace; color: red; }
  .done   { font-family: monospace; color: green; }
  .priority { font-family: monospace; color: orange; }
  .tag    { background-color: #eee; font-family: monospace;
            padding: 2px; font-size: 80%; font-weight: normal; }
  .timestamp { color: #bebebe; }
  .timestamp-kwd { color: #5f9ea0; }
  .org-right  { margin-left: auto; margin-right: 0px;  text-align: right; }
  .org-left   { margin-left: 0px;  margin-right: auto; text-align: left; }
  .org-center { margin-left: auto; margin-right: auto; text-align: center; }
  .underline { text-decoration: underline; }
  #postamble p, #preamble p { font-size: 90%; margin: .2em; }
  p.verse { margin-left: 3%; }
  pre {
    border: 1px solid #e6e6e6;
    border-radius: 3px;
    background-color: #f2f2f2;
    padding: 8pt;
    font-family: monospace;
    overflow: auto;
    margin: 1.2em;
  }
  pre.src {
    position: relative;
    overflow: auto;
  }
  pre.src:before {
    display: none;
    position: absolute;
    top: -8px;
    right: 12px;
    padding: 3px;
    color: #555;
    background-color: #f2f2f299;
  }
  pre.src:hover:before { display: inline; margin-top: 14px;}
  /* Languages per Org manual */
  pre.src-asymptote:before { content: 'Asymptote'; }
  pre.src-awk:before { content: 'Awk'; }
  pre.src-authinfo::before { content: 'Authinfo'; }
  pre.src-C:before { content: 'C'; }
  /* pre.src-C++ doesn't work in CSS */
  pre.src-clojure:before { content: 'Clojure'; }
  pre.src-css:before { content: 'CSS'; }
  pre.src-D:before { content: 'D'; }
  pre.src-ditaa:before { content: 'ditaa'; }
  pre.src-dot:before { content: 'Graphviz'; }
  pre.src-calc:before { content: 'Emacs Calc'; }
  pre.src-emacs-lisp:before { content: 'Emacs Lisp'; }
  pre.src-fortran:before { content: 'Fortran'; }
  pre.src-gnuplot:before { content: 'gnuplot'; }
  pre.src-haskell:before { content: 'Haskell'; }
  pre.src-hledger:before { content: 'hledger'; }
  pre.src-java:before { content: 'Java'; }
  pre.src-js:before { content: 'Javascript'; }
  pre.src-latex:before { content: 'LaTeX'; }
  pre.src-ledger:before { content: 'Ledger'; }
  pre.src-lisp:before { content: 'Lisp'; }
  pre.src-lilypond:before { content: 'Lilypond'; }
  pre.src-lua:before { content: 'Lua'; }
  pre.src-matlab:before { content: 'MATLAB'; }
  pre.src-mscgen:before { content: 'Mscgen'; }
  pre.src-ocaml:before { content: 'Objective Caml'; }
  pre.src-octave:before { content: 'Octave'; }
  pre.src-org:before { content: 'Org mode'; }
  pre.src-oz:before { content: 'OZ'; }
  pre.src-plantuml:before { content: 'Plantuml'; }
  pre.src-processing:before { content: 'Processing.js'; }
  pre.src-python:before { content: 'Python'; }
  pre.src-R:before { content: 'R'; }
  pre.src-ruby:before { content: 'Ruby'; }
  pre.src-sass:before { content: 'Sass'; }
  pre.src-scheme:before { content: 'Scheme'; }
  pre.src-screen:before { content: 'Gnu Screen'; }
  pre.src-sed:before { content: 'Sed'; }
  pre.src-sh:before { content: 'shell'; }
  pre.src-sql:before { content: 'SQL'; }
  pre.src-sqlite:before { content: 'SQLite'; }
  /* additional languages in org.el's org-babel-load-languages alist */
  pre.src-forth:before { content: 'Forth'; }
  pre.src-io:before { content: 'IO'; }
  pre.src-J:before { content: 'J'; }
  pre.src-makefile:before { content: 'Makefile'; }
  pre.src-maxima:before { content: 'Maxima'; }
  pre.src-perl:before { content: 'Perl'; }
  pre.src-picolisp:before { content: 'Pico Lisp'; }
  pre.src-scala:before { content: 'Scala'; }
  pre.src-shell:before { content: 'Shell Script'; }
  pre.src-ebnf2ps:before { content: 'ebfn2ps'; }
  /* additional language identifiers per "defun org-babel-execute"
       in ob-*.el */
  pre.src-cpp:before  { content: 'C++'; }
  pre.src-abc:before  { content: 'ABC'; }
  pre.src-coq:before  { content: 'Coq'; }
  pre.src-groovy:before  { content: 'Groovy'; }
  /* additional language identifiers from org-babel-shell-names in
     ob-shell.el: ob-shell is the only babel language using a lambda to put
     the execution function name together. */
  pre.src-bash:before  { content: 'bash'; }
  pre.src-csh:before  { content: 'csh'; }
  pre.src-ash:before  { content: 'ash'; }
  pre.src-dash:before  { content: 'dash'; }
  pre.src-ksh:before  { content: 'ksh'; }
  pre.src-mksh:before  { content: 'mksh'; }
  pre.src-posh:before  { content: 'posh'; }
  /* Additional Emacs modes also supported by the LaTeX listings package */
  pre.src-ada:before { content: 'Ada'; }
  pre.src-asm:before { content: 'Assembler'; }
  pre.src-caml:before { content: 'Caml'; }
  pre.src-delphi:before { content: 'Delphi'; }
  pre.src-html:before { content: 'HTML'; }
  pre.src-idl:before { content: 'IDL'; }
  pre.src-mercury:before { content: 'Mercury'; }
  pre.src-metapost:before { content: 'MetaPost'; }
  pre.src-modula-2:before { content: 'Modula-2'; }
  pre.src-pascal:before { content: 'Pascal'; }
  pre.src-ps:before { content: 'PostScript'; }
  pre.src-prolog:before { content: 'Prolog'; }
  pre.src-simula:before { content: 'Simula'; }
  pre.src-tcl:before { content: 'tcl'; }
  pre.src-tex:before { content: 'TeX'; }
  pre.src-plain-tex:before { content: 'Plain TeX'; }
  pre.src-verilog:before { content: 'Verilog'; }
  pre.src-vhdl:before { content: 'VHDL'; }
  pre.src-xml:before { content: 'XML'; }
  pre.src-nxml:before { content: 'XML'; }
  /* add a generic configuration mode; LaTeX export needs an additional
     (add-to-list 'org-latex-listings-langs '(conf " ")) in .emacs */
  pre.src-conf:before { content: 'Configuration File'; }

  table { border-collapse:collapse; }
  caption.t-above { caption-side: top; }
  caption.t-bottom { caption-side: bottom; }
  td, th { vertical-align:top;  }
  th.org-right  { text-align: center;  }
  th.org-left   { text-align: center;   }
  th.org-center { text-align: center; }
  td.org-right  { text-align: right;  }
  td.org-left   { text-align: left;   }
  td.org-center { text-align: center; }
  dt { font-weight: bold; }
  .footpara { display: inline; }
  .footdef  { margin-bottom: 1em; }
  .figure { padding: 1em; }
  .figure p { text-align: center; }
  .equation-container {
    display: table;
    text-align: center;
    width: 100%;
  }
  .equation {
    vertical-align: middle;
  }
  .equation-label {
    display: table-cell;
    text-align: right;
    vertical-align: middle;
  }
  .inlinetask {
    padding: 10px;
    border: 2px solid gray;
    margin: 10px;
    background: #ffffcc;
  }
  #org-div-home-and-up
   { text-align: right; font-size: 70%; white-space: nowrap; }
  textarea { overflow-x: auto; }
  .linenr { font-size: smaller }
  .code-highlighted { background-color: #ffff00; }
  .org-info-js_info-navigation { border-style: none; }
  #org-info-js_console-label
    { font-size: 10px; font-weight: bold; white-space: nowrap; }
  .org-info-js_search-highlight
    { background-color: #ffff00; color: #000000; font-weight: bold; }
  .org-svg { }
</style>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div id="content" class="content">
<h1 class="title">simponic</h1>
<div id="table-of-contents" role="doc-toc">
<h2>Table of Contents</h2>
<div id="text-table-of-contents" role="doc-toc">
<ul>
<li><a href="#org2398bcc">1. sheperd's pie</a>
<ul>
<li><a href="#org0a31359">1.1. ingredients</a></li>
<li><a href="#org141d5bb">1.2. procedure</a></li>
</ul>
</li>
</ul>
</div>
</div>
<p>
dear riley,
</p>

<p>
below are a (hopefully ever-growing) collection of recipes. i hope you like them :)
</p>

<div id="outline-container-org2398bcc" class="outline-2">
<h2 id="org2398bcc"><span class="section-number-2">1.</span> sheperd's pie</h2>
<div class="outline-text-2" id="text-1">
</div>
<div id="outline-container-org0a31359" class="outline-3">
<h3 id="org0a31359"><span class="section-number-3">1.1.</span> ingredients</h3>
<div class="outline-text-3" id="text-1-1">
<ul class="org-ul">
<li>2 and a half potatoes (if you liked the potatoes we did in Seattle, Golden Yukon. Otherwise, Russet potatoes are traditionally used here)</li>
<li>1 lb of ground beef </li>
<li>2 peeled cloves of garlic </li>
<li>1/4 cup sour cream</li>
<li>1/4 cup butter </li>
<li>1/4 cup milk  </li>
</ul>

<p>
in terms of veggies you may mix and match with whatever you have around; peas, kidney beans, diced onions are pretty good too
if you use onions, make sure to cook those in the pan for 6ish minutes before adding ground beef.
</p>

<ul class="org-ul">
<li>1 can green beans</li>
<li>1 can yellow corn </li>
<li>1 can sliced carrots </li>
<li>3/4 cup tomato sauce </li>
<li>3 heaping tablespoons of flour</li>
</ul>
</div>
</div>

<div id="outline-container-org141d5bb" class="outline-3">
<h3 id="org141d5bb"><span class="section-number-3">1.2.</span> procedure</h3>
<div class="outline-text-3" id="text-1-2">
<ol class="org-ol">
<li>fill a medium/large-sized pot full of water, bring to boil on the highest heat setting </li>
<li>cut potatoes into 1/2-inch-ish cubes, optionally skinning prior, if preferred </li>
<li>put potatoes into boiling (or near-boiling) water and bring the heat down to medium; keeping an eye on it to ensure nothing boils over. keep them boiling until 15 minutes have passed or until you can take a cube out of the water with a spoon and mash it with very little force.</li>
<li>in a large pan begin browning ground beef; and separating with a spatula on medium-high heat, until thoroughly browned - about 8ish minutes. also, preheat oven to 375 degrees.</li>
<li>dice 1 of the cloves garlic very finely. </li>
<li>turn off the heat on the pan, and move beef into a colander over a bowl to drain.</li>
<li>return the beef to the pan, and reheat to medium-low. season thoroughly to taste with oregano, cumin, and the diced clove of garlic.</li>
<li>drain each can of vegetables into the sink and add to pan, mixing them around and letting them get intimate with each other; season to taste with salt and pepper after a couple of minutes of heat. </li>
<li>add tomato sauce and flour (and a bit of sour cream if you’re adventurous) into the pan, mixing over medium heat until a slightly thicker sauce begins to form (like, 4ish minutes).</li>
<li>turn pan's heat to low. att this point, the potatoes should be ready. turn off the pot’s heat and drain potatoes. return potatoes to pot along with sour cream, butter, milk, and the other minced garlic clove. begin to mash. </li>
<li>place the contents of the pan into a sizeable baking dish. begin scooping potatoes and spread evenly over the top with a spoon. </li>
<li>place in the oven and let bake for 25 minutes, letting rest after.</li>
<li>turn the oven to its broil setting; when ready, place the dish back on the top rack and let sit for about 5 minutes to form a slightly crispy potatoey crust.</li>
<li>profit</li>
</ol>
</div>
</div>
</div>
</div>
<div id="postamble" class="status">
<p class="author">Author: Elizabeth Hunt</p>
<p class="date">Created: 2023-06-25 Sun 14:17</p>
<p class="validation"><a href="https://validator.w3.org/check?uri=referer">Validate</a></p>
</div>
</body>
</html>
