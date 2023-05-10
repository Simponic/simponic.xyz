<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<!-- 2023-05-12 Fri 08:57 -->
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>simponic</title>
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
<li><a href="#orgce40930">1. huh?</a>
<ul>
<li><a href="#org4770eea">1.1. regulars be saddened, for we are no longer elixir</a></li>
</ul>
</li>
<li><a href="#org42326a8">2. links, contact</a></li>
<li><a href="#org078259d">3. salaries</a></li>
<li><a href="#orgb621d2c">4. things i like&#x2026;</a></li>
<li><a href="#orgbc39d04">5. things i'm not so much a fan of&#x2026;</a></li>
</ul>
</div>
</div>

<div id="org0dc202b" class="figure">
<p><img src="./img/logo.svg" alt="logo.svg" class="org-svg" />
</p>
</div>

<?php
  $motds = [
     "hello, world!",
     "emacs > vim",
     "functional programming on top",
     "\"a baller, a shot caller, an arch linux installer\"",
     "one distro to rule them all, and in the darkness bind them",
     "proprietary software leads to anger, anger leads to hate, hate leads to suffering",
     "i'll tell you once, and i'll tell you again. there's always a prime between n and 2n.",
     "1. e4 e5 2. ke2",
     ">++++++[<+++++++++>-]<.+++.-----.--.--.",
     "it's certainly the year of the linux desktop",
     "dwm is a sweet window manager",
     "e^(iπ)+1 is cool!",
     "lambda calculus isn't calculus!",
     "also try minecraft!",
     "the days are just packed",
     "when will we have no-instruction-set-computing?",
     "i'm r u r' u' and i know it"
  ];
  echo "<h3 style='text-align:center'>motd: <em>" . $motds[array_rand($motds)] . "</em></h3>";
?>


<div id="outline-container-orgce40930" class="outline-2">
<h2 id="orgce40930"><span class="section-number-2">1.</span> huh?</h2>
<div class="outline-text-2" id="text-1">
<p>
yes, i stole <a href="http://bettermotherfuckingwebsite.com">that other guy's css</a>.
</p>

<p>
my name is elizabeth, or lizzy / liz if you're cool. i'm 19, president
of the <a href="https://linux.usu.edu">USU FSLC</a>, senior in computer science, blah blah blah&#x2026;
also a filthy liberal :)
</p>

<p>
sometimes, i make cool stuff that i'm proud of. like <a href="https://chessh.linux.usu.edu">cheSSH</a>!
</p>

<p>
you didn't hear it here, but "swag" is one in active development. only
cool people know what it is, so keep it under wraps 🤫.
</p>
</div>

<div id="outline-container-org4770eea" class="outline-3">
<h3 id="org4770eea"><span class="section-number-3">1.1.</span> regulars be saddened, for we are no longer elixir</h3>
<div class="outline-text-3" id="text-1-1">
<p>
i used to have a kinda cool site i built a few years back, to explore <a href="https://www.phoenixframework.org/">phoenix</a>.
but i never ended up using the features i spent so
long making - a time card clock, contact form w/ captcha, dynamic blog
system with comments and roles, etc. it was one of my first full-stack
apps i did for fun, at the time; so pulling the plug was a little bittersweet.
</p>

<p>
all you'll get here now, mostly, is black text and some of my takes.
whether they're good or bad is up to you, dear reader.
</p>
</div>
</div>
</div>

<div id="outline-container-org42326a8" class="outline-2">
<h2 id="org42326a8"><span class="section-number-2">2.</span> links, contact</h2>
<div class="outline-text-2" id="text-2">
<ul class="org-ul">
<li><a href="https://github.com/Simponic">my github</a></li>
<li><a href="https://github.com/usufslc">usufslc github</a></li>
<li><a href="https://www.linkedin.com/in/elizabeth-hunt-031932229/">linkedin</a></li>
<li><a href="mailto:elizabeth.hunt@simponic.xyz">elizabeth.hunt@simponic.xyz</a></li>
</ul>
</div>
</div>

<div id="outline-container-org078259d" class="outline-2">
<h2 id="org078259d"><span class="section-number-2">3.</span> salaries</h2>
<div class="outline-text-2" id="text-3">
<p>
i believe people would do good to openly share the money they make, to at
least "help" combat corporate greed.
</p>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">age</th>
<th scope="col" class="org-left">position</th>
<th scope="col" class="org-left">start</th>
<th scope="col" class="org-left">end</th>
<th scope="col" class="org-left">monies</th>
<th scope="col" class="org-left">would work again?</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">19 - 19</td>
<td class="org-left">sde intern @ amazon pinpoint</td>
<td class="org-left">may 2023</td>
<td class="org-left">jul 2023</td>
<td class="org-left">$9180/month + ~$7k housing stipend for 12 weeks</td>
<td class="org-left">can't really say yet.</td>
</tr>

<tr>
<td class="org-left">19 - 19</td>
<td class="org-left">student networking sde</td>
<td class="org-left">sep 2022</td>
<td class="org-left">may 2023 (coming back after summer '23)</td>
<td class="org-left">$18 / hour</td>
<td class="org-left">yes. money is not great and i am underpaid. but the job is incredibly self motivated, and chill. i get to work on cool stuff with cool people :), and it's the pay cap for student jobs</td>
</tr>

<tr>
<td class="org-left">18 - 18</td>
<td class="org-left">sde intern @ amazon pinpoint</td>
<td class="org-left">may 2022</td>
<td class="org-left">aug 2022</td>
<td class="org-left">$9180/month + ~$6k housing stipend for 12 weeks</td>
<td class="org-left">yes; i did</td>
</tr>

<tr>
<td class="org-left">17 - 18</td>
<td class="org-left">contractor developer @ maiden voyage</td>
<td class="org-left">apr 2021</td>
<td class="org-left">nov 2021</td>
<td class="org-left">$13 / hour</td>
<td class="org-left">no, i was SEVERELY underpaid (and bored), for the stuff i was doing, in hindsight.</td>
</tr>
</tbody>
</table>
</div>
</div>

<div id="outline-container-orgb621d2c" class="outline-2">
<h2 id="orgb621d2c"><span class="section-number-2">4.</span> things i like&#x2026;</h2>
<div class="outline-text-2" id="text-4">
<ul class="org-ul">
<li>elixir, lisp, c, (some aspects of) javascript. i don't really know how to feel about java, but i've used it the most out of anything.</li>
<li>math - algebra of abstract or linear variety, number theory, analysis, discrete. you name it. shove it in my brain already.</li>
<li>functional paradigms.</li>
<li>emacs.</li>
<li>linux.</li>
<li>chess.</li>
<li>minecraft.</li>
<li>democratic nations that practice social ideals to better the lives of their citizens rather than capital owners.</li>
</ul>
</div>
</div>

<div id="outline-container-orgbc39d04" class="outline-2">
<h2 id="orgbc39d04"><span class="section-number-2">5.</span> things i'm not so much a fan of&#x2026;</h2>
<div class="outline-text-2" id="text-5">
<ul class="org-ul">
<li>c++ - when it's being cringe. which is unfortunately a lot of the fucking time.</li>
<li>"microshaft wangblows" - the phattest of sumos.</li>
<li>over-abstracted oop.</li>
<li>snap.</li>
<li>religion. but, like, only if it's mixed in with nationalism/conservatism. i have no qualms with religion or
people practicing in general, i just have some beef with mormons; mainly due to growing up very lds, in a small,
lds community.</li>
<li>cryptocurrency. actually, just money in general lmao. not the biggest fan of markets i must say. though, i'm not smart
enough to find a good alternative, don't know if there even is one. that's why i really want UBI to launch off the ground 
ASAP.</li>
</ul>
</div>
</div>
</div>
<div id="postamble" class="status">
<p class="date">Created: 2023-05-12 Fri 08:57</p>
<p class="validation"><a href="https://validator.w3.org/check?uri=referer">Validate</a></p>
</div>
</body>
</html>
