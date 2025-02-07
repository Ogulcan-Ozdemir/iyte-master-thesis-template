%The MIT License (MIT) Ronny Majani
%
%Copyright (c) 2018
%
%Permission is hereby granted, free of charge, to any person obtaining a copy
%of this software and associated documentation files (the "Software"), to deal
%in the Software without restriction, including without limitation the rights
%to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%copies of the Software, and to permit persons to whom the Software is
%furnished to do so, subject to the following conditions:
%
%The above copyright notice and this permission notice shall be included in all
%copies or substantial portions of the Software.
%
%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%SOFTWARE.

% iyte.cls

% If you need to use Turkish characters, these are the commands you'll need to insert them
%\u{g} – ğ
%\u{G} – Ğ
%\c{c} – ç
%\c{C} – Ç
%\c{s} – ş
%\c{S} – Ş
%\"{u} – ü
%\"{U} – Ü
%\"{o} – ö
%\"{O} – Ö
%{\i} – ı
%\.{I} – İ
%\^{a}
%\^{A}


% reference: https://tug.org/pracjourn/2005-4/hefferon/hefferon.pdf
\def\fileversion{0.1}
\def\filedate{2018/05/22}

% --- Class structure: identification part
% ---
\ProvidesClass{iyte}[2018/05/22 version 0.01 IYTE Master Thesis]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
\LoadClass[12pt]{report}
% Read all the documentclass options; pass them to report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
% Page layout
\RequirePackage[a4paper,left=3.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}



% Font Family
%----------------------------
% Turkish and Graphicx problems:
% https://tex.stackexchange.com/questions/32178/usepackageturkishbabel-and-includegraphics-inconcistency
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxmath,newtxtext}
\RequirePackage{graphicx}
%\RequirePackage{mathptmx}
% for font compile problems:
% https://tex.stackexchange.com/a/152749



% Hyperref
%----------------------------
%\RequirePackage[unicode]{hyperref}
%\hypersetup{
%	colorlinks   = true,    % Colours links instead of ugly boxes
%	urlcolor     = blue,    % Colour for external hyperlinks
%	linkcolor    = black,   % Colour of internal links; disabled for table of contents
%	citecolor    = black      % Colour of citations
%}



% Sections
%----------------------------
% https://tex.stackexchange.com/a/392015
\makeatletter
\renewcommand\subparagraph{%
	\@startsection {subparagraph}{5}{\z@ }{3.25ex \@plus 1ex
		\@minus .2ex}{-1em}{\normalfont \normalsize \bfseries }}%
\makeatother
\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\subsubsubsubsection}{\subparagraph}

% Sections
%----------------------------
% https://tex.stackexchange.com/questions/59726/change-size-of-section-subsection-subsubsection-paragraph-and-subparagraph-ti/59727
\newcommand{\thesisbigfont}{\fontsize{16pt}{24pt}\selectfont\bfseries}
\newcommand{\thesismediumfont}{\fontsize{14pt}{21pt}\selectfont}
\RequirePackage{titlesec}
// Adding dot after section numbering
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}.{}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}.{}}
\renewcommand{\thesubsubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.{}}


% Format Sections
\titleformat{\section}{\bfseries\thesismediumfont}{\thesection}{1em}{}
\titleformat{\subsection}{\bfseries\thesismediumfont}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bfseries\thesismediumfont}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}{\bfseries\thesismediumfont}{\theparagraph}{1em}{}
\titleformat{\subparagraph}{\bfseries\thesismediumfont}{\thesubparagraph}{1em}{}

% Format Chapters
\titleformat{\chapter}[display]
{\thesisbigfont\bfseries\centering}{\chaptertitlename\  \thechapter}{\baselineskip}{}
\renewcommand\chaptername{CHAPTER}

% Section Spacing
% \titlespacing*{\chapter}{0pt}{0pt}{2\baselineskip}
\titlespacing*{\chapter}{0pt}{-25pt}{2\baselineskip}
\titlespacing*{\section}{0pt}{1.5\baselineskip}{1.5\baselineskip}
\titlespacing*{\subsection}{0pt}{1.5\baselineskip}{1.5\baselineskip}
\titlespacing*{\subsubsection}{0pt}{1.5\baselineskip}{1.5\baselineskip}
\titlespacing*{\paragraph}{0pt}{2\baselineskip}{2\baselineskip}
\titlespacing*{\subparagraph}{0pt}{2\baselineskip}{2\baselineskip}



% Spacing
%----------------------------
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\onehalfspacing
\setlength{\parindent}{1.27cm}
\setlength{\parskip}{0pt}


% Pagination
%----------------------------
% https://tex.stackexchange.com/a/153176
\RequirePackage{fancyhdr}
% Turn on the style
\pagestyle{fancy}
% Clear the header and footer
\fancyhead{}
\fancyfoot{}
% Set the right side of the footer to be the page number
\fancyfoot[R]{\thepage}
\fancyfootoffset[R]{0.5cm}
% Redefine plain style, which is used for titlepage and chapter beginnings
% From https://tex.stackexchange.com/a/30230/828
\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}%
	\fancyhf{}%
	\fancyfoot[R]{\thepage}%
}
\renewcommand{\headrulewidth}{0pt} % remove header horizontal bar


% Footnotes
%------------------
% set footnote margin 1cm from the left
\RequirePackage{footmisc}
\renewcommand{\footnotemargin}{1cm}
% set footnote line separator to 5cm width
% https://tex.stackexchange.com/a/21917
\renewcommand{\footnoterule}{%
	\kern -3pt
	\hrule width 5cm height 1pt
	\kern 2pt
}


% Spacing of Floats
%------------------
% http://www-h.eng.cam.ac.uk/help/tpl/textprocessing/squeeze.html
% set the spacing above and below figures in the text as 2x1.5 spacing
\renewcommand{\intextsep}{2\baselineskip}


% Definitions
%------------------
% Thesis Title
\newcommand{\showthesistitle}{
	Please define your title with\\$\backslash$thesistitle\{My Title\}
}
\newcommand{\thesistitle}[1]{\renewcommand{\showthesistitle}{\uppercase{#1}}}
% Turkish Thesis Title
\newcommand{\showturkishthesistitle}{
	Please define your title with\\$\backslash$turkishthesistitle\{My Title\}
}
\newcommand{\turkishthesistitle}[1]{\renewcommand{\showturkishthesistitle}{#1}}
% Thesis Author
\newcommand{\showthesisauthor}{
	Please define your title with\\$\backslash$thesisauthor\{Name SURNAME\}
}
\newcommand{\thesisauthor}[1]{\renewcommand{\showthesisauthor}{#1}}
% Thesis Degree
\newcommand{\showthesisdegree}{
	Please define your title with\\$\backslash$thesisdegree\{MASTER OF SCIENCE\}
}
\newcommand{\thesisdegree}[1]{\renewcommand{\showthesisdegree}{#1}}
% Thesis Major
\newcommand{\showthesismajor}{
	Please define your title with\\$\backslash$thesismajor\{Mathematics\}
}
\newcommand{\thesismajor}[1]{\renewcommand{\showthesismajor}{#1}}
% Thesis Date
\newcommand{\showthesisdate}{
	Please define your title with\\$\backslash$thesisdate\{June\}\{2018\}
}
\newcommand{\thesisdate}[2]{\renewcommand{\showthesisdate}{#1 #2}}


% Title Page
%------------------
% https://tex.stackexchange.com/a/286821
\RequirePackage[absolute]{textpos}


% Signature Page
%------------------
\RequirePackage{tikz}
% command to change the vertical spacing of signature boxes
\newcommand{\signaturepagespacing}{0.8cm}
\newcommand{\setsignaturepagespacing}[1]{
	\renewcommand{\signaturepagespacing}{#1}
}
% command to generate signature box's horizontal line
\newcommand{\namesigdatehrule}[1]{\par\tikz \hspace{-2pt} \draw [black, ultra thick] (0,0) -- (#1,0);\par}
% Commands to generate signature box
\newcommand{\thesissignaturebox}[4]{
	\begin{minipage}{#3}%
		\vspace{\signaturepagespacing}\namesigdatehrule{#4}\smallskip
			\textbf{#1}

			#2
	\end{minipage}
	\vspace{.5ex}
}
% Signature Format
\newcommand{\thesiscommitteemember}[3]{\thesissignaturebox{#1}{Department of #2, #3}{15cm}{5.1cm}}
\newcommand{\thesisremainingsignatures}[3]{\thesissignaturebox{#1}{#2 #3}{6.25cm}{5.1cm}}


% definitions for committee members
\newcommand{\thesiscommitteememberA}[3]{
	\newcommand{\showthesiscommitteememberA}{\thesiscommitteemember{#1}{#2}{#3}}
}
\newcommand{\thesiscommitteememberB}[3]{
	\newcommand{\showthesiscommitteememberB}{\thesiscommitteemember{#1}{#2}{#3}}
}
\newcommand{\thesiscommitteememberC}[3]{
	\newcommand{\showthesiscommitteememberC}{\thesiscommitteemember{#1}{#2}{#3}}
}
\newcommand{\thesiscommitteememberD}[3]{
	\newcommand{\showthesiscommitteememberD}{\thesiscommitteemember{#1}{#2}{#3}}
}
\newcommand{\thesiscommitteememberE}[3]{
	\newcommand{\showthesiscommitteememberE}{\thesiscommitteemember{#1}{#2}{#3}}
}
% definitions for remaining signatures
% Supervisor
\newcommand{\thesissupervisor}[3]{
	\newcommand{\showthesissupervisor}{\thesisremainingsignatures{#1}{Supervisor, Department of}{#2\\ #3}}
}
% Co-Supervisor
\newcommand{\thesiscosupervisor}[3]{
	\newcommand{\showthesiscosupervisor}{\thesisremainingsignatures{#1}{Co-Supervisor, Department of}{#2\\#3}}
}
% Head of Department
\newcommand{\thesisheadofdepartment}[2]{
	\newcommand{\showthesisheadofdepartment}{\thesisremainingsignatures{#1}{Head of the Department of\\}{#2}}
}
% Dean of Graduate School
\newcommand{\thesisdeanofgraduateschool}[1]{
	\newcommand{\showthesisdeanofgraduateschool}{\thesisremainingsignatures{#1}{Dean of the}{Graduate School of\\Engineering and Sciences}}
}
\newcommand{\signaturedate}[3]{\newcommand{\showsignaturedate}{#1 / #2 / #3}}



% Abstract:
%-----------
\makeatletter
\renewenvironment{abstract}{%
	\centering

	{\bfseries\thesisbigfont ABSTRACT}\\
 	\vspace{1.5\baselineskip}

	{\thesismediumfont\showthesistitle}\\
 	\vspace{1\baselineskip}}

	}{\newpage}
\makeatother


\makeatletter
\newenvironment{ozet}{%
	\centering
	{\bfseries\thesisbigfont \"{O}ZET}\\
	\vspace{1.5\baselineskip}

	{\thesismediumfont\showturkishthesistitle}\\
	\vspace{\baselineskip}}

	}{\newpage}
\makeatother



% Dedication, Acknowledgments, and Preface:
%-----------
\makeatletter
\newenvironment{dedication}{
	\begin{center}
}{\end{center}\newpage}

\newenvironment{acknowledgments}{\thispagestyle{empty}  % hides page number
	\centering
	{\bfseries\thesisbigfont ACKNOWLEDGMENTS}\\
	\vspace{2\baselineskip}
	\quotation
}{\newpage}

\newenvironment{preface}{\thispagestyle{empty}  % hides page number
	\centering
	{\bfseries\thesisbigfont PREFACE}\\
	\vspace{2\baselineskip}
	\quotation
}{\newpage}
\makeatother




% Table of Content and List of Figures and Tables:
%-----------
% Make paragraphs and subpagraphs show up in ToC (they act like a subsubsubsection)
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}
% https://texblog.org/2011/09/09/10-ways-to-customize-tocloflot/
% https://tex.stackexchange.com/a/53901
\usepackage[nottoc]{tocbibind} % make LoF and LoT show up in ToC
\RequirePackage[titles]{tocloft}
% Titles
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\listtablename}{LIST OF TABLES}
\renewcommand{\listfigurename}{LIST OF FIGURES}
% Font Size, and Centering
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\thesisbigfont\bfseries}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\thesisbigfont\bfseries}
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\thesisbigfont\bfseries}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}

% Add "CHAPTER" word in ToC
\renewcommand\cftchappresnum{\chaptername~}
% Bold font removed from ToC chapters (https://tex.stackexchange.com/a/115485)
\renewcommand\cftchapfont{\mdseries}
% Bold font removed from ToC chapter page numbers (https://tex.stackexchange.com/a/235119)
\renewcommand{\cftchappagefont}{\mdseries}
%\addtolength{\cftchapnumwidth}{60pt}
\newlength{\mytoclength}
\settowidth{\mytoclength}{\cftchappresnum\cftchapaftersnum}
\addtolength\cftchapnumwidth{\mytoclength}

% Dots added after ToC chapter numbers
\renewcommand\cftchapaftersnum{.}

% Space added between ToC chapters (https://tex.stackexchange.com/a/56550)
\renewcommand\cftchapafterpnum{\vskip5pt}

% Dots added to parts, chapters and sections
% https://tex.stackexchange.com/questions/53898/how-to-get-lines-with-dots-in-the-table-of-contents-for-sections
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % for chapters
% \renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % for parts
% \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % for sections (It is default in report and book class)

% Reduce space between dots (https://tex.stackexchange.com/a/390001)
\renewcommand{\cftdotsep}{1}

% Set indentation of ToC entries
\setlength{\cftsecindent}{5.5em}
\setlength{\cftsubsecindent}{6.25em}
\setlength{\cftsubsubsecindent}{7em}
\setlength{\cftparaindent}{7.75em}
\setlength{\cftsubparaindent}{8.5em}

% Configure List of Tables and List of Figures: add 'Table'/'Figure' and 'Page'
% https://tex.stackexchange.com/a/346301
% List of Tables Format
\makeatletter
\newlength{\latexpnumwidth}
\setlength{\latexpnumwidth}{\@pnumwidth}
\renewcommand{\cfttabpresnum}{\tablename~}

% set spacing between Table number and table label in LoT
%\addtolength{\cfttabnumwidth}{25pt}
\newlength{\mylotlength}
\settowidth{\mylotlength}{\cfttabpresnum\cfttabaftersnum}
\addtolength\cfttabnumwidth{\mylotlength}

\let\origcftdot\cftdot
\addtocontents{lot}{\protect\cftsetpnumwidth{25pt}}
% list of Figures Format
\addtocontents{lot}{\protect\renewcommand{\protect\cftdot}{}} % Remove the dots
\addtocontents{lot}{\protect\contentsline{table}{\numberline{\underline{\textbf{\tablename}~}}}{\underline{\textbf{Page}}}{}{}} % Write the header line
\addtocontents{lot}{\protect\renewcommand{\protect\cftdot}{\origcftdot}}% Can be written 'expanded' and enable the dots again
\addtocontents{lot}{\vskip\baselineskip\par}% Some vertical spacing

% Remove default indent (https://tex.stackexchange.com/a/240276)
\setlength{\cftfigindent}{0cm}
\setlength{\cfttabindent}{0cm}

% List of Figures
\renewcommand{\cftfigpresnum}{\figurename~}

% set spacing between Figure number and figure label in LoF
%\addtolength{\cftfignumwidth}{30pt}
\newlength{\myloflength}
\settowidth{\myloflength}{\cftfigpresnum\cftfigaftersnum}
\addtolength\cftfignumwidth{\myloflength}

\let\origcftdot\cftdot
\addtocontents{lof}{\protect\cftsetpnumwidth{25pt}}
\addtocontents{lof}{\protect\renewcommand{\protect\cftdot}{}} % Remove the dots
\phantomsection\addtocontents{lof}{\protect\contentsline{figure}{\numberline{\underline{\textbf{\figurename}~}}}{\underline{\textbf{Page}}}{}{}} % Write the header line
\addtocontents{lof}{\protect\renewcommand{\protect\cftdot}{\origcftdot}}% Can be written 'expanded' and enable the dots again
\addtocontents{lof}{\vskip\baselineskip\par}% Some vertical spacing
% Remove extra line spacing between different chapter figures (https://tex.stackexchange.com/a/793)
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
%
\renewcommand\cftfigaftersnum{.}
\renewcommand\cfttabaftersnum{.}
\makeatother

% fix for hyperref:
% With hyperref, \contentsline needs five arguments, not three. So adding {}{} after {#3} will do.
% https://tex.stackexchange.com/questions/168013/redefining-contentsline-with-hyperref-loaded
% I fixed it, so now you can freely add hyperref

% Add 'Figure' in front of figure number in LoF
%\renewcommand*\cftfigpresnum{Figure~}
%\settowidth{\cftfignumwidth}{\cftfigpresnum}
%\renewcommand{\cftfigaftersnumb}{\quad--~}
% Add 'Table' in front of table number in LoT
%\renewcommand*\cfttabpresnum{Table~}
%\settowidth{\cfttabnumwidth}{\cftfigpresnum}
%\renewcommand{\cfttabaftersnumb}{\quad--~}


% Bibliography
%-----------
% Rename title of Bibliography
\ifdefined\bibname
	\renewcommand\bibname{REFERENCES}
\fi
\ifdefined\refname
	\renewcommand{\refname}{REFERENCES}
\fi

% Adjust space between bibliography entries
\newlength{\bibitemsep}\setlength\bibitemsep{0.5\baselineskip}%
\newlength{\bibparskip}\setlength{\bibparskip}{0pt}
\let\oldthebibliography\thebibliography
\renewcommand\thebibliography[1]{%
  \oldthebibliography{#1}%
  \setlength{\parskip}{\bibitemsep}%
  \setlength{\itemsep}{\bibparskip}%

}

% Appendices
%-----------
\RequirePackage[toc,title]{appendix}
\AtBeginDocument{\renewcommand\appendixname{APPENDIX}}
\AtBeginDocument{\renewcommand{\appendixtocname}{APPENDICES}}
\newenvironment{thesisappendices}{
\addtocontents{toc}{\protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}}
\addtocontents{toc}{\protect\vskip20pt}
\addtocontents{toc}{\protect\setlength{\cftbeforechapskip}{1pt}}
\begin{appendices}
}{
\end{appendices}
}


% Equations:
%-----------
% https://tex.stackexchange.com/a/32919
% set spacing above and below equations
\AtBeginDocument{%
	\setlength{\belowdisplayskip}{1\baselineskip}%
	\setlength{\belowdisplayshortskip}{1\baselineskip}%
	\setlength{\abovedisplayskip}{1\baselineskip}%
	\setlength{\abovedisplayshortskip}{0pt}%
}