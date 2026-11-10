%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% File:     urdpl.cls (LaTeX Document class "urdpl")
% Author:   Zbigniew Gomółka, Ewa Żesławska
% Version:  v3.1 <12.10.2026>
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{urdpl}[2026/10/12 v3.1 UR diploma class - refactor]

\message{*** [urdpl.cls] ---  (ZG, EZ)   v3.1 <12.10.2026>  ***}

%---------------------------------------------------------------------------
% OPTIONS + BASE CLASS
%---------------------------------------------------------------------------

\newif\ifpdflatex
\pdflatexfalse

\DeclareOption{pdflatex}{\pdflatextrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions\relax
\LoadClass[a4paper,oneside]{report}
% (jeśli chcesz dwustronnie: a4paper,twoside,openright)

%---------------------------------------------------------------------------
% PACKAGES
%---------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}
\RequirePackage{newtx}  
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage[font=small, labelfont=bf, labelsep=period]{caption}
\RequirePackage{subcaption}
\RequirePackage{siunitx}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage[all,defaultlines=2]{nowidow}

% Narzedzia i style wspolne dla calego szablonu
% Narzedzia i style wspolne dla calego szablonu
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}     % \toprule, \midrule, \bottomrule
\RequirePackage{longtable}    % tabele wielostronicowe
\RequirePackage{pdflscape}    % pozioma orientacja dla szerokich tabel
\RequirePackage{listings}

%---------------------------------------------------------------------------
% GEOMETRY / COLORS / SPACING
%---------------------------------------------------------------------------

\geometry{lmargin=35mm, rmargin=25mm, tmargin=25mm, bmargin=25mm, foot=10mm, head=10mm}
\definecolor{Green}{rgb}{0.1,0.5,0.1}
\linespread{1.3}


%---------------------------------------------------------------------------
% WSPOLNE STYLE TABEL I LISTINGOW
%---------------------------------------------------------------------------
\newcolumntype{C}{>{\centering\arraybackslash}X}

% Ustaw po babel, ktory moze nadpisywac nazwy podczas inicjalizacji jezyka.
\AtBeginDocument{%
  \renewcommand{\lstlistlistingname}{Spis listingów}%
  \renewcommand{\lstlistingname}{Listing}%
}
\providecommand{\listingname}{\lstlistingname}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}

\lstdefinestyle{mystyle}{
  basicstyle=\ttfamily\footnotesize,
  breaklines=true,
  numbers=left,
  numberstyle=\tiny\color{codegray},
  numbersep=6pt,
  showstringspaces=false,
  tabsize=2,
  keywordstyle=\color{blue},
  commentstyle=\color{codegreen},
  stringstyle=\color{red}
}
\lstset{style=mystyle}

\lstset{
  literate={ą}{{\k{a}}}1
           {ć}{{\'c}}1
           {ę}{{\k{e}}}1
           {ó}{{\'o}}1
           {ń}{{\'n}}1
           {ł}{{\l{}}}1
           {ś}{{\'s}}1
           {ź}{{\'z}}1
           {ż}{{\.z}}1
           {Ą}{{\k{A}}}1
           {Ć}{{\'C}}1
           {Ę}{{\k{E}}}1
           {Ó}{{\'O}}1
           {Ń}{{\'N}}1
           {Ł}{{\L{}}}1
           {Ś}{{\'S}}1
           {Ź}{{\'Z}}1
           {Ż}{{\.Z}}1,
  basicstyle=\footnotesize\ttfamily
}

%---------------------------------------------------------------------------
% INTERNAL MACROS (need @)
%---------------------------------------------------------------------------

\makeatletter

% --- default values to avoid "Undefined control sequence"
\providecommand\@shorttitlePL{}
\providecommand\@shorttitleEN{}
\providecommand\@shortauthor{}
\providecommand\@titlePL{}
\providecommand\@titleEN{}
\providecommand\@faculty{}
\providecommand\@thesistype{}
\providecommand\@supervisor{}
\providecommand\@acknowledgements{}
\providecommand\@department{}
\providecommand\@degreeprogramme{}
\providecommand\@noAlbum{}
\providecommand\@thesisDone{}

% --- setters (API for users)
\def\shorttitlePL#1     {\gdef\@shorttitlePL{#1}}
\def\shorttitleEN#1     {\gdef\@shorttitleEN{#1}}
\def\shortauthor#1      {\gdef\@shortauthor{#1}}
\def\titlePL#1          {\gdef\@titlePL{#1}}
\def\titleEN#1          {\gdef\@titleEN{#1}}
\def\faculty#1          {\gdef\@faculty{#1}}
\def\thesistype#1       {\gdef\@thesistype{#1}}
\def\supervisor#1       {\gdef\@supervisor{#1}}
\def\acknowledgements#1 {\gdef\@acknowledgements{#1}}
\def\department#1       {\gdef\@department{#1}}
\def\degreeprogramme#1  {\gdef\@degreeprogramme{#1}}
\def\noAlbum#1          {\gdef\@noAlbum{#1}}
\def\thesisDone#1       {\gdef\@thesisDone{#1}}

%---------------------------------------------------------------------------
% HEADERS / FOOTERS (fancyhdr)
%---------------------------------------------------------------------------

\pagestyle{fancy}
\fancyhf{} % czyści nagłówki i stopki

% nagłówek: tytuł sekcji po lewej, numer strony po prawej
\fancyhead[L]{\slshape\small \rightmark}
% \fancyhead[RO,LE]{\bfseries \thepage}

% stopka: autor + krótki tytuł po lewej
\def\thesisheaders{%
  \fancyfoot[L]{\small \@shortauthor\quad\textit{\@shorttitlePL}}%
  \fancyfoot[R]{\bfseries \thepage}%
}
\thesisheaders

\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}

% Puste naglowki i stopki na stronach o stylu plain (m.in. poczatki rozdzialow)
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\frenchspacing
\sloppy
\flushbottom

% Numeracja oraz ochrona przed podzialem wyrazow przez strony
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}
\brokenpenalty=10000\relax

%---------------------------------------------------------------------------
% TITLE PAGES
%---------------------------------------------------------------------------

\newcommand{\titlepages}{%
  %-------------------------
  % Strona tytułowa
  %-------------------------
  \clearpage
  \begin{titlepage}

% --- LOGO: góra, środek ---
\noindent\makebox[\textwidth][c]{%
  \includegraphics[scale=.30]{figures/LogoURWydzial}%
}

\begin{center}

  % --- Typ pracy ---
  {\sffamily\huge\bfseries\textsc{PRACA PROJEKTOWA}\par}

  % --- Tytuł pracy ---
  \vspace*{20mm}
  {\sffamily\LARGE\itshape \@titlePL\par}

  %
  \vfill
  %
  % --- Autor ---
  \sffamily{\Large \@author\par}
  \vspace*{3mm}
  % --- Numer albumu ---
  {\sffamily\large Nr albumu: \@noAlbum\par}
  \vspace*{3mm}
  % --- Kierunek ---
  \sffamily{\large Kierunek studiów: \@degreeprogramme\par }

  % --- Promotor ---
  \vspace*{7mm}
  {\sffamily \large \@thesisDone \@supervisor\par}

  \vfill

  % --- Miejsce i data ---
  {\sffamily Rzeszów, \@date\par}
\end{center}

\end{titlepage}

  %-------------------------
  % Podziękowania
  %-------------------------
  \clearpage
  \begin{titlepage}
  \thispagestyle{empty}
  \vspace*{15cm}\vfill
  \begin{flushright}
    \begin{minipage}{10cm}
      {\itshape \@acknowledgements}
    \end{minipage}
  \end{flushright}
  \end{titlepage}

  % %-------------------------
  % % Pusta strona (opcjonalnie)
  % %-------------------------
  % \clearpage
  % \thispagestyle{empty}
  % \null
  % \clearpage

  % Jeśli chcesz wymusić start numeracji:
  \setcounter{page}{5}%
}

%---------------------------------------------------------------------------
% TITLES FORMAT
%---------------------------------------------------------------------------

\titleformat{\chapter}[block]
{\bfseries\LARGE}{\filright \LARGE\thechapter. }{0ex}{}
\titlespacing{\chapter}{0pt}{0mm}{8mm}

\titleformat{\section}[block]
{\bfseries\Large}{\filright \Large\thesection. }{0ex}{}
\titlespacing{\section}{7mm}{3mm plus 0mm minus 1mm}{3mm plus 0mm minus 1mm}

\titleformat{\subsection}[block]
{\bfseries\large}{\filright \large\thesubsection. }{0ex}{}
\titlespacing{\subsection}{7mm}{3mm}{2.5mm}

\titleformat{\subsubsection}[block]
{\bfseries\normalsize}{\filright \normalsize\thesubsubsection. }{0ex}{}
\titlespacing{\subsubsection}{7mm}{3mm plus 0mm minus 1mm}{3mm plus 0mm minus 1mm}

%---------------------------------------------------------------------------
% TOC SETTINGS
%---------------------------------------------------------------------------

\renewcommand{\cfttoctitlefont}{\bfseries\Large}
\renewcommand{\cftbeforetoctitleskip}{0mm}
\renewcommand{\cftaftertoctitleskip}{10mm}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\setlength{\cftparskip}{2pt}
\setlength{\cftbeforechapskip}{0mm}
\setlength{\cftsecnumwidth}{10mm}
\renewcommand{\cftchappagefont}{\normalsize}

%---------------------------------------------------------------------------
% SIUNITX SETTINGS
%---------------------------------------------------------------------------

\sisetup{
  output-decimal-marker = {,},
  group-separator = {~},
}

%---------------------------------------------------------------------------
% URL FONT
%---------------------------------------------------------------------------

\renewcommand\UrlFont{\rmfamily\itshape}

%---------------------------------------------------------------------------
% CAPTIONS
%---------------------------------------------------------------------------

\captionsetup[subfigure]{labelfont=md}
\captionsetup[figure]{name=Rysunek}
\captionsetup[table]{name=Tabela}
\captionsetup{
  subrefformat=parens,
  margin=2cm,
  singlelinecheck=on,
}

%---------------------------------------------------------------------------
% ZRODLA RYSUNKOW I TABEL
%---------------------------------------------------------------------------
% Uzycie wewnatrz figure i table, PO \caption i \label w rysunkach,
% oraz POD \tabular / \tabularx w tabelach:
%     \zrodlo{Opracowanie własne.}
%     \zrodlo{Na podstawie \cite{klucz_bibliograficzny}.}
% Nie umieszczamy zrodla w \caption: wtedy nie trafia ono do spisu rysunkow/tabel.
% \caption* nie nadaje numeru, nie zmienia licznika i nie dodaje pozycji do spisu.
\newcommand{\zrodlo}[1]{%
  \begingroup
  \captionsetup{font=footnotesize, justification=centering,
    singlelinecheck=false, skip=3pt}%
  \caption*{\textit{Źródło:} #1}%
  \endgroup
}

%---------------------------------------------------------------------------
% ZRODLO DLA TABEL WIELOSTRONICOWYCH (longtable)
%---------------------------------------------------------------------------
% Wywolaj wewnatrz definicji ostatniej stopki, przed \endlastfoot:
%   \bottomrule
%   \zrodloLT{6}{Opracowanie wlasne na podstawie \cite{...}.}
%   \endlastfoot
% Pierwszy argument to liczba kolumn; drugi to opis zrodla.
% Wpis trafia tylko na ostatnia strone tabeli (longtable), bez numerowania.
\newcommand{\zrodloLT}[2]{%
  \multicolumn{#1}{@{}p{\dimexpr\linewidth-2\tabcolsep\relax}@{}}{%
    \raggedright\footnotesize\textit{Źródło:} #2%
  }\\%
}


%---------------------------------------------------------------------------
% eqwhere ENV
%---------------------------------------------------------------------------

\SetLabelAlign{parright}{\parbox[t]{\labelwidth}{\raggedleft#1}}
\setlist[description]{style=multiline, topsep=10pt, align=parright}

\newlength{\descriptiondashgap}
\setlength{\descriptiondashgap}{0.5em}

\renewcommand*\descriptionlabel[1]{%
  \hspace \labelsep \normalfont \bfseries #1 \mdseries
  \hspace{\descriptiondashgap}--\hspace{\descriptiondashgap}%
}

\newlength{\eqwheremargin}
\setlength{\eqwheremargin}{2cm}

\newenvironment{eqwhere}[1][]
{%
  \setlength{\eqwheremargin}{#1}%
  \begin{description}[leftmargin=\eqwheremargin, itemsep=0cm, labelsep=0cm]
}
{%
  \end{description}
}

\makeatother
