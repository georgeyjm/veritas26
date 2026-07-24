\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{quiz}

\LoadClass[12pt]{exam}



%==================================================
%  Required Packages
%==================================================

% Packages for general setup
\RequirePackage[UTF8]{ctex}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}

% Packages for page setup and document structure
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage[hidelinks,breaklinks,bookmarks]{hyperref}

% Packages for back-end uses
\RequirePackage{xparse}
\RequirePackage{etoolbox}

% Packages for general math typesetting
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
\RequirePackage{commath}
\RequirePackage{physics}

% Packages for general uses
\RequirePackage[table,dvipsnames]{xcolor}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{pgfplots}
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage{placeins}
\RequirePackage{ragged2e}
\RequirePackage[nameinlink]{cleveref}
\RequirePackage[bottom]{footmisc}



%==================================================
%  Document Setup and Customization
%==================================================

% Assets path configuration
\graphicspath{{assets}}
\pgfplotsset{table/search path={assets}}
\lstset{inputpath={assets}}

% Page layout
\geometry{a4paper,margin=1in} % Page size and margins
\renewcommand{\baselinestretch}{1} % Line spacing
\renewcommand{\arraystretch}{1.2}
\setlength{\parskip}{0em} % Paragraph spacing
% \pagestyle{plain}



%==================================================
%  Environments and Counters
%==================================================

\numberwithin{equation}{section}
\numberwithin{figure}{section}

% Change footnote symbols
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Numbering specific equations in align* and gather* environments
\newcommand\numberthis{\addtocounter{equation}{1}\tag{\theequation}}

% Spacing for environments
\setlist[itemize]{topsep=0pt}


%==================================================
%  Quiz Layout Configurations
%==================================================

% Localization
\pointname{分}

% Question sections and section instructions
\newcounter{questionsection}[section]
\newcommand{\questionsection}[1]{\refstepcounter{questionsection}\clearpage\raggedright\textbf{\large Section~\thequestionsection\quad#1}\vspace{1em}\par}
\renewcommand{\thequestionsection}{\Roman{questionsection}}
\newcommand{\instruction}[1]{{\raggedright\textit{#1}}}

% Styling questions and multiple choices
\renewcommand{\questionshook}{\setlength{\itemsep}{1em}} % space between questions
\renewcommand{\choiceshook}{\setlength{\leftmargin}{3em}\setlength{\itemsep}{0.4em}} % multi-choice indentation and line height
\renewcommand{\checkboxeshook}{\setlength{\leftmargin}{3em}\setlength{\itemsep}{0.4em}} % checkboxes indentation and line height
\setlength\dottedlinefillheight{2em} % lines line height

% Styling multiple choice solutions
\ifprintanswers
  \CorrectChoiceEmphasis{\bfseries} %\color{red}
  \newcommand{\option}{\choice\hspace{0.2em}}
  \newcommand{\answerbox}{\tikz[overlay,remember picture]{\draw ($(-1.9em,1em)$) rectangle ($(-0.45em,-0.35em)$);}}
  \newcommand{\optioncorrect}{\CorrectChoice\answerbox\normalfont\color{black}\hspace{0.2em}}
\else
  \newcommand{\option}{\choice}
  \newcommand{\optioncorrect}{\choice}
\fi

% Styling normal solutions
\renewcommand{\solutiontitle}{\noindent\textbf{Answer:}\enspace}



%==================================================
%  Macros and Shorthands
%==================================================

% General Text
\newcommand*{\term}[1]{\underline{\textit{#1}}}
\renewcommand*{\em}{\textbf}
\newcommand*{\tsp}{\textsuperscript}
\newcommand*{\tsb}{\textsubscript}
\newcommand{\supth}{\tsp{th}}
\newcommand{\comment}[1]{{\textcolor{secondary}{#1}}} % This may cause a problem

% General Math
\let\oldemptyset\emptyset
\let\emptyset\varnothing
\let\oldepsilon\epsilon
\let\epsilon\varepsilon
\let\varepsilon\oldepsilon
\renewcommand*{\abs}[1]{\left|#1\right|}
\newcommand*{\mean}{\overline}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\DeclareMathOperator{\prob}{\mathrm{P}}

% Sets
\newcommand{\NN}{\mathbb{N}}
\newcommand{\ZZ}{\mathbb{Z}}
\newcommand{\QQ}{\mathbb{Q}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\CC}{\mathbb{C}}

% The danger sign
\RequirePackage{stackengine,scalerel}
\newcommand\dangersign[1][2ex]{%
  \scaleto{\stackengine{0.3pt}{\scalebox{1.1}[.9]{%
  \color{red}$\blacktriangle$}}{\color{white}\tiny\bfseries !}{O}{c}{F}{F}{L}}{#1}%
}



%==================================================
%  Behavior Tweaking and Customization
%==================================================

% Fix strange first page number issue for exam environment
\footer{}{第 \thepage 页}{}

% Remove space around delimiter sizing commands
\let\oldleft\left
\let\oldright\right
\let\oldbig\big
\let\oldbigg\bigg
\let\oldBig\Big
\let\oldBigg\Bigg
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\oldleft}
\renewcommand{\right}{\aftergroup\egroup\oldright}
\renewcommand{\big}{\mathopen{}\mathclose\oldbig}
\renewcommand{\bigg}{\mathopen{}\mathclose\oldbigg}
\renewcommand{\Big}{\mathopen{}\mathclose\oldBig}
\renewcommand{\Bigg}{\mathopen{}\mathclose\oldBigg}

% Better \overline (only works for shorter maths)
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

% Centering in indented environments
%\newcommand{\nomathindent}{\displayindent0pt \displaywidth\textwidth}
%\makeatletter
%\patchcmd\start@gather{$$}{%
%  $$%
%  \displaywidth=\textwidth
%  \displayindent=-\leftskip
%}{}{\errmessage{Cannot patch \string\start@gather}}
%\patchcmd\start@align{$$}{%
%  $$%
%  \displaywidth=\textwidth
%  \displayindent=-\leftskip
%}{}{\errmessage{Cannot patch \string\start@align}}
%\patchcmd\start@multline{$$}{%
%  $$%
%  \displaywidth=\textwidth
%  \displayindent=-\leftskip
%}{}{\errmessage{Cannot patch \string\start@multline}}
%\patchcmd\mathdisplay{$$}{%
%  $$%
%  \displaywidth=\textwidth
%  \displayindent=-\leftskip
%}{}{\errmessage{Cannot patch \string\mathdisplay}}
%\makeatother
