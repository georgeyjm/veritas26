\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zhslides}

\LoadClass{beamer}
%\LoadClass[notes]{beamer}
%\LoadClass[aspectratio=169]{beamer}



%==================================================
%  Required Packages
%==================================================

% Packages for general setup
\RequirePackage[UTF8]{ctex}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}

% Packages for page setup and document structure
%\RequirePackage{geometry}
%\RequirePackage[hidelinks,breaklinks,bookmarks]{hyperref}

% Packages for document font settings
%\RequirePackage[osf,sc]{mathpazo} % Palatino for main text and math
%\RequirePackage{newpxtext}
%\RequirePackage{newpxmath} % if loaded, comment amssymb, amsthm
%\RequirePackage[scaled=0.90]{helvet} % Helvetica for sans-serif
%\RequirePackage[scaled=0.85]{beramono} % Bera Mono for monospaced

% Packages for back-end uses
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{xifthen}

% Packages for general math typesetting
\RequirePackage{amsmath}
\RequirePackage{amssymb} % loaded by newpxmath
%\RequirePackage{amsthm} % loaded by newpxmath
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{commath}
%\RequirePackage{thmtools}

% Packages for general uses
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{setspace}
\RequirePackage{float}
%\RequirePackage{enumitem}
\RequirePackage[theorems,breakable,skins]{tcolorbox}
\RequirePackage[nameinlink]{cleveref}
\RequirePackage{contour}
\RequirePackage{ulem}
\RequirePackage{soul}



%==================================================
%  Document Setup and Customization
%==================================================

% Basic theme and layout
\usetheme{metropolis}
\usecolortheme{default}
%\renewcommand{\baselinestretch}{1.1} % Line spacing
%\renewcommand{\arraystretch}{0.6} % Matrix line spacing
%\setlength{\parskip}{0em}
%\allsectionsfont{\normalfont \bfseries}
%\AtBeginEnvironment{pmatrix}{\renewcommand{\arraystretch}{0.8}} % Matrix line spacing

% Fonts
%\usepackage{mathpazo} % Palatino for main text and math
%\RequirePackage{newpxtext}
%\RequirePackage{newpxmath} % if loaded, comment amssymb, amsthm
%\RequirePackage[scaled=0.90]{helvet} % Helvetica for sans-serif
%\RequirePackage[scaled=0.85]{beramono} % Bera Mono for monospaced
%\usefonttheme[onlymath]{serif}
%\setmainfont{Source Serif 4 Light}
%\setmainfont{Source Han Serif SC}
\setCJKmainfont{Source Han Serif SC}[
  BoldFont   = Source Han Serif SC Bold,
%  ItalicFont = FZSongKeBenXiuKaiS-R-GB,
  ItalicFont = FZJuZhenXinFangS-R-GB,%FZJuZhenXinFangK
]
\setCJKsansfont{Source Han Serif SC}[
  BoldFont   = Source Han Serif SC,
  ItalicFont = LXGW WenKai Mono,
]
%\setCJKmonofont{}
%\renewcommand\familydefault{\rmdefault}
\usefonttheme{serif}
\setbeamerfont{footnote}{size=\tiny}

\renewcommand{\today}{{\number\year}年{\number\month}月{\number\day}日}
\xeCJKsetup{CJKecglue={\hskip 0.20em plus 0.05em minus 0.05em}}  % Original setting is 0.25±0.05em

% Colors
\definecolor{secondary}{gray}{0.9}
\definecolor{axiomcolor}{gray}{0}

\definecolor{bookcloth}{HTML}{cc785c}
\definecolor{kraft}{HTML}{d4a27f}
\definecolor{manilla}{HTML}{ebdbbc}
\definecolor{headercolor}{HTML}{24373a}
\definecolor{chartreuse}{HTML}{bec050}
\definecolor{forestgreen}{HTML}{153010}
\definecolor{green}{HTML}{3b5a10}
\definecolor{ocean}{HTML}{2D3C59}

%\definecolor{defcolor}{HTML}{273c75} % 273c75
%\definecolor{theoremcolor}{HTML}{2c6e49} % 419d78
%\definecolor{propcolor}{HTML}{30b398}
%\definecolor{lemmacolor}{HTML}{674b85}
%\definecolor{corollarycolor}{HTML}{c79b24} % c5ae6c
%\definecolor{examplecolor}{HTML}{d94646}

\definecolor{defcolor}{HTML}{2e5090}
\definecolor{theoremcolor}{HTML}{4f7942}
\definecolor{propcolor}{HTML}{009b7d}
\definecolor{lemmacolor}{HTML}{915c83}
\definecolor{corollarycolor}{HTML}{a57c00}
\definecolor{examplecolor}{HTML}{cb410b}

% Table of contents
%\setcounter{tocdepth}{2}
%\setcounter{secnumdepth}{2}



%==================================================
%  Environments and Counters
%==================================================

% Basic numbering settings
%\numberwithin{equation}{section}
%\numberwithin{figure}{section}

% Base tcolorbox styles
\tcbset{
  basicstyle/.style={
    enhanced,
    frame hidden,
    sharp corners,
    boxrule=0pt,
    before skip=0.5em,
    after skip=1em,
    toptitle=4pt,
    left=6pt, right=4pt, top=4pt, bottom=4pt,
    borderline west={2pt}{-1pt}{#1},
    fonttitle=\bfseries,
    coltitle=#1,
    coltext=black,
    colback=#1!8!white,
    colbacktitle=#1!8!white,
    description font=\mdseries,
    description delimiters={（}{）},
    separator sign={\hspace{-0.5em}},
  }
}

% Individual environments
\newtcbtheorem[number within=section]{law}{定律}{
  basicstyle=black,
}{law}
\newtcbtheorem[number within=section]{proposition}{命题}{
  basicstyle=green,
}{prop}
\newtcbtheorem[number within=section]{mytheorem}{命题}{
  basicstyle=ocean,
}{thm}
\newtcbtheorem[number within=section]{myexample}{命题}{
  basicstyle=bookcloth,
}{ex}
\newtcbtheorem[number within=section]{brainstorm}{思考}{
  basicstyle=gray,
  opacityback=0,
  opacitybacktitle=0,
  toptitle=0pt,
  top=2pt, bottom=0pt,
}{bs}

% Weird workaround for redefining existing environments
\renewenvironment{theorem}[1]{\begin{mytheorem}{#1}}{\end{mytheorem}}
\renewenvironment{example}[1]{\begin{myexample}{#1}}{\end{myexample}}

% CleverRef Names
\crefname{theorem}{定理}{Theorem}
\crefname{lemma}{引理}{Lemma}
\crefname{corollary}{Corollary}{Corollary}
\crefname{proposition}{命题}{Proposition}
\crefname{law}{定律}{Axiom}
\crefname{axiom}{公理}{Axiom}
\crefname{definition}{定义}{Definition}
\crefname{example}{例子}{Example}

% Named cref
\newcommand{\namedcref}[1]{\cref{#1} (\nameref{#1})}
\newcommand{\namedCref}[1]{\Cref{#1} (\nameref{#1})}
%\newcommand{\namedcref}[1]{\nameref{#1} (\ref{#1})}
%\newcommand{\namedCref}[1]{\nameref{#1} (\ref{#1})}



%==================================================
%  Lists
%==================================================

%\setlist{font=\upshape}%,topsep=0.5em}
%
%\newlist{romanenum}{enumerate}{1}
%\setlist[romanenum]{label=(\roman*),leftmargin=2.5em}%,labelsep=0.75em}

%\renewcommand{\descriptionlabel}[1]{%
%  \hspace{\labelsep}\normalfont\underline{#1}% 
%}


%==================================================
%  Macros and Shorthands
%==================================================

% General Text
\NewDocumentCommand{\term}{ m g }{%
  \textbf{#1}%
  \IfNoValueTF{#2}{}{ (\textsl{#2})}%
}
\renewcommand*{\em}{\textbf}
\newcommand*{\tsp}{\textsuperscript}
\newcommand*{\tsb}{\textsubscript}
\newcommand{\supth}{\tsp{th}}
% \renewcommand{\comment}[1]{{\textcolor{secondary}{#1}}} % This may cause a problem

% General Math
\let\oldemptyset\emptyset
\let\emptyset\varnothing
\let\oldepsilon\epsilon
\let\epsilon\varepsilon
\let\varepsilon\oldepsilon
%\let\oldabs\abs
\let\oldleq\leq
\let\leq\leqslant
\let\oldgeq\geq
\let\geq\geqslant
\let\smalltilde\tilde
\let\tilde\widetilde
\newcommand{\contradiction}{\!\scalebox{1.25}{\textreferencemark}}
%\renewcommand{\abs}[1]{\,\oldabs{#1}}
\newcommand{\defeq}{\coloneqq} % \coloneq or \vcentcolon
\newcommand{\eqdef}{\eqqcolon} % \coloneq or \vcentcolon
\newcommand{\funcarg}{\makebox[1ex]{$\mathbf{\cdot}$}}
%\newcommand{\funcarg}{\mathord{\color{black!33}\bullet}}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\DeclareMathOperator{\image}{Im}

% Short-hand environments
\newcommand{\bi}{\begin{itemize}}
\newcommand{\ei}{\end{itemize}}
\newcommand{\bit}{\begin{itemize}[<+->]}
\newcommand{\eit}{\end{itemize}}

% Sets
\newcommand{\NN}{\mathbb{N}}
\newcommand{\ZZ}{\mathbb{Z}}
\newcommand{\QQ}{\mathbb{Q}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\CC}{\mathbb{C}}



%==================================================
%  Behavior Tweaking and Customization
%==================================================

% Better \underline
\renewcommand{\ULdepth}{2pt}
\contourlength{1pt}
\let\oldunderline\underline
\renewcommand{\underline}[1]{%
  \uline{\phantom{#1}}%
  \llap{\contour{white}{#1}}%
}

% Better \overline (only works for short maths)
\let\oldoverline\overline
\renewcommand*{\overline}[1]{
  \sbox0{$\mathrm{#1}\m@th$}%
  \sbox2{$#1\m@th$}%
  \rlap{%
    \hbox to\wd2{%
      \hfill
      $\oldoverline{\vrule width 0pt height\ht0 \kern\wd0 }$%
    }%
  }%
  \copy2 %
}

% Remove space around \left, \right, and others
\let\oldleft\left
\let\oldright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\oldleft}
\renewcommand{\right}{\aftergroup\egroup\oldright}
\let\oldbig\big
\let\oldbigg\bigg
\let\oldBig\Big
\let\oldBigg\Bigg
\renewcommand{\big}{\mathopen{}\mathclose\oldbig}
\renewcommand{\bigg}{\mathopen{}\mathclose\oldbigg}
\renewcommand{\Big}{\mathopen{}\mathclose\oldBig}
\renewcommand{\Bigg}{\mathopen{}\mathclose\oldBigg}
