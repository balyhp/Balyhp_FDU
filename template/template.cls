\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template}[2023/11/18 binayi testReport]
\LoadClass[12pt,a4paper]{article}

% basic set
\RequirePackage[T1]{fontenc}
\RequirePackage[left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
\RequirePackage{url}
\RequirePackage[heading=true, scheme=plain, punct=plain]{ctex}

% figure
\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{float}

% table
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{bigstrut}
\RequirePackage{bigdelim}

% code
\RequirePackage{listings} 
\RequirePackage{framed}   

% others
\RequirePackage{calc}     % scale
\RequirePackage{indentfirst}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{titletoc}
\RequirePackage{xcolor}
\RequirePackage{cprotect}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{caption}
\RequirePackage[titles]{tocloft}

% indent
\renewcommand*{\baselinestretch}{1.625}
\setlength\parindent{2em}

% edit tabular env
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
  {\bgroup%
   \renewcommand{\arraystretch}{1.5}%
   \mcm@oldtabular}%
  {\mcm@endoldtabular\egroup}

% self-style
\fancypagestyle{bianyi}{
  \fancyhead{}
  \renewcommand\headrulewidth{0pt}
  \fancyfoot{}
  \fancyfoot[R]{\songti\zihao{5}\thepage}
}

% bold and Chinese character
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\bfsongti}{\CJKfamily{song}}
\setCJKfamilyfont{hei}[AutoFakeBold]{SimHei}
\newcommand*{\bfheiti}{\CJKfamily{hei}}

% Engish word
\setmainfont{Times New Roman}

% ctex title
\ctexset{
  section={
    format +=\bfsongti \zihao{4} \raggedright ,
    name={,、\ \quad},
    number=\chinese{section},
    aftername =\hspace{0pt},
  },
  subsection={
    format +=\normalfont \zihao{-4} \raggedright ,
    name={, \quad},
    number=\arabic{section}.\arabic{subsection},
    aftername =\hspace{0pt },
  },
  subsubsection={
    format +=\normalfont \zihao{-4} \raggedright ,
    name={, \quad},
    number=\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
    aftername =\hspace{0pt },
  }
}

% redefine paragraph title
\let\oldsection\section
\renewcommand{\section}[1]{%
  \oldsection{#1}%
  \vspace{-0.5em}%
}
\let\oldsubsection\subsection
\renewcommand{\subsection}[1]{%
  \vspace{-0.5em}%
  \oldsubsection{#1}%
  \vspace{-0.5em}%
}
\let\oldsubsubsection\subsubsection
\renewcommand{\subsubsection}[1]{%
  \vspace{-0.5em}%
  \oldsubsubsection{#1}%
  \vspace{-0.5em}%
}

% redefine author
\renewcommand{\maketitle}{%
  \begin{center}
    {\normalfont \CJKfamily{song}\bfseries \zihao{-2} {\@title}} \\[0.1em]
    {\zihao{-4}\kaishu\@author}
    {\zihao{-4}\kaishu\@date} \\[0.1em]
  \end{center}
  \vspace{0.1em}
}

% table
\renewenvironment{tabular}{%
  \bgroup
  \renewcommand{\arraystretch}{2}%
  \mcm@oldtabular
}{%
  \mcm@endoldtabular\egroup
}

% figure/table caption
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfive}{\zihao{5}}
\DeclareCaptionFont{bfsong}{\bfsongti}
\captionsetup[figure]{%
  format=hang,
  labelsep=quad,
  font={song,minusfive},
  position=bottom
}
\captionsetup[table]{%
  format=hang,
  labelsep=quad,
  font={bfsong,minusfive},
  position=top
}

% content 
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftsecdotsep}{1.5}
\setlength{\cftbeforesecskip}{7pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftsecfont}{\bfseries\zihao{-4}\songti}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecaftersnumb}{\hskip.4em}

% list space
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=2pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=2pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=2pt}

% code lightening
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
}
