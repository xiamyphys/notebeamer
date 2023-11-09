%% ************************************************************************************************************
%% ******************************************************                                                     *
%% * This work may be distributed and/or modified under *           *           *****       *   *             *
%% * the conditions of the LaTeX Project Public License *           *      ** *   *    ***   * *              *
%% *     http://www.latex-project.org/lppl.txt          *           *     *  **   *   *****   *               *
%% * either version 1.3c of this license or any later   *           *     *  **   *   *****   *               *
%% * version.                                           *           *     *  **   *   *      * *              *
%% ******************************************************           *****  ** *   *    ***  *   *             *
%% start of file `notebeamer.cls'.                                                                            *
%% Copyright 2023 LiteLaTeX (xiamyphys@gmail.com)                                                             *
%% available at https://github.com/xiamyphys/NoteBeamer                                                       *
%% Thanks `wipet' (https://petr.olsak.net/) provides Beamers automatically inserts module                     *
%% !Mode:: "TeX:UTF-8"                                                                                        *
%% ************************************************************************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notebeamer}[09/11/2023 v2.1a NoteBeamer document class]

%% Global opinions
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=NB, prefix=NB@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{NB}{#1}}

\DeclareStringOption[normal]{color}
\DeclareVoidOption{lighter}{\ekv{color=lighter}}
\DeclareVoidOption{normal}{\ekv{color=normal}}
\DeclareVoidOption{darker}{\ekv{color=darker}}

\DeclareStringOption[times]{font}
\DeclareVoidOption{times}{\ekv{font=times}}
\DeclareVoidOption{libertinus}{\ekv{font=libertinus}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessKeyvalOptions*\relax
\PassOptionsToPackage{quiet}{fontspec}
\LoadClass[tikz]{standalone}

%% Packages
\RequirePackage{xparse}
\RequirePackage[colorlinks,linkcolor=black,urlcolor=black]{hyperref}
\RequirePackage{ctex}
\RequirePackage{fontawesome5}

%% Global definitions
\newcommand{\notewidth}{6.32}
\newcommand{\noteheight}{8.18}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\mail}[1]{\gdef\@mail{\href{mailto:#1}{\nolinkurl{#1}}}}
\NewDocumentCommand\chapter{s o m}{
    \IfBooleanTF{#1}{}{
        \refstepcounter{chap}
    }
    \gdef\@chapter{#2}
    \gdef\@courseware{#3}
    \setcounter{note}{0}
}
\newcommand{\flyleaf}[1]{\gdef\@flyleaf{#1}}
\newcommand{\sticker}[1]{\gdef\@sticker{#1}}
\NewDocumentCommand\logo{O{https://www.hdu.edu.cn} m O{Hangzhou·Zhejiang}}{\gdef\@edu{#1}\gdef\@logo{#2}\gdef\@address{#3}}

%% Fonts
\ifdefstring{\NB@font}{libertinus}{
\setmainfont{Libertinus Serif}
\setsansfont{Libertinus Sans}
\setmonofont{NotoSansMono}[
  Scale=MatchLowercase,
  Extension=.ttf,
  UprightFont=*-Light,
  BoldFont=*-Medium
]
}{\relax}

%% notepages
\RequirePackage{graphics}
\graphicspath{{./beamer/}{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}% Paths
\definecolor{lightyellow}{HTML}{F7F6E9}
\definecolor{紺色}{HTML}{223A70}
\newcounter{chap}
\newcounter{note}
\newcommand{\chaptername}{\faIcon{seedling} Chapter}

%%%% 1 note per page
\newcommand{\newnote}[2]{
    \refstepcounter{note}
    \addtocounter{note}{-1}
    \foreach \n in {#1,...,#2}{
    \begin{tikzpicture}
        \fill [lightyellow!50] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
        \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24,inner sep=0pt] at (0.985*\notewidth in,0.012*\noteheight in) {\includegraphics[height=1.07158 in]{\@sticker}};\fi

        %%%%%% imput file
        \node [yshift=(\thenote+1)*33*0.028*\noteheight in,inner sep=0pt] at (0.4*\notewidth in,0.038*\noteheight in-12.5*0.028*\noteheight in) {\ifcsname @chapter\endcsname\includegraphics[height=5.61148 in,page=\n]{\@courseware}\fi};

        %%%%%% draw lines & dots: right
        \foreach \a in {9,...,33}
        \foreach \b in {24,...,29}
        \fill [fill=gray,xshift=\b*0.03*\notewidth in,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) circle (0.006);% 点
        \foreach \a in {9,...,32}
        \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.028 in] (0.75*\notewidth in+0.25*0.028*\notewidth in,0.038*\noteheight in) --++ (0.2*\notewidth in-0.25*0.028*\notewidth in,0);% 横线

        %%%%%% draw lines & dots: bottom
        \foreach \a in {0,...,8,8}
        \foreach \b in {1,...,29}
        \fill [fill=gray,xshift=\b*0.03*\notewidth in,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) circle (0.006);% 点
        \foreach \a in {1,...,8,8}
        \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0);% 横线

        \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0);% 底部粗线

        \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=33*0.028*\noteheight in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily\chaptername~\ifcsname @chapter\endcsname\thechap. \@chapter\fi} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page \thepage\quad};% 顶部粗线

        \draw [line cap=round,thick,opacity=0.4,gray] (0.75*\notewidth in,0.038*\noteheight in+8.25*0.028*\noteheight in) -- (0.75*\notewidth in,0.038*\noteheight in+32.75*0.028*\noteheight in);% 分栏线
    \end{tikzpicture}
    }
}

%%%% 3 beamers per page
\newcommand{\threebeamers}[3]{
    \refstepcounter{note}
    \begin{tikzpicture}
        \fill [lightyellow!50] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
        \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24,inner sep=0pt] at (0.985*\notewidth in,0.012*\noteheight in) {\includegraphics[height=1.07158 in]{\@sticker}};\fi

        %%%%%% imput file
        \foreach \n in {#1,#2,#3}
        \node [yshift=((27.5-(\n-#1)*11+\thenote*33)*0.028*\noteheight in),inner sep=0pt] at (0.3125*\notewidth in,0.038*\noteheight in) {\ifcsname @chapter\endcsname\includegraphics[height=2.40492 in,page=\n]{\@courseware}\fi};

        %%%%%% draw lines & dots
        \foreach \a in {0,...,33}
        \foreach \b in {18,...,29}
        \fill [fill=gray,xshift=\b*0.03*\notewidth in,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) circle (0.006);% 点
        \foreach \a in {1,...,32}
        \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.028 in] (0.575*\notewidth in+0.25*0.028*\notewidth in,0.038*\noteheight in) --++ (0.375*\notewidth in-0.25*0.028*\notewidth in,0);% 横线

        \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0);% 底部粗线

        \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=33*0.028*\noteheight in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily\chaptername~\ifcsname @chapter\endcsname\thechap. \@chapter\fi} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page \thepage\quad};% 顶部粗线

        \draw [line cap=round,thick,opacity=0.4,gray] (0.575*\notewidth in,0.038*\noteheight in+0.25*0.028*\noteheight in) -- (0.575*\notewidth in,0.038*\noteheight in+32.75*0.028*\noteheight in);% 分栏线
    \end{tikzpicture}
}

%%%%%% Simplify loop 3
\newcount\tmpnum
\def\newnotesss#1#2{%
\addtocounter{note}{-1}
   \def\maxnum{#2}\tmpnum=#1
   \loop
      \unless\ifnum\tmpnum>#2 \threebeamers{\valnum0}{\valnum1}{\valnum2}
      \advance\tmpnum by3
   \repeat
}
\def\valnum#1{%
    \ifnum\maxnum>\numexpr\tmpnum+#1\relax 
      \the\numexpr\tmpnum+#1\relax \else \maxnum\fi
}

%%%% 4 slides per page
\newcommand{\fourbeamers}[4]{
    \refstepcounter{note}
    \begin{tikzpicture}
        \fill [lightyellow!50] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
        \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24,inner sep=0pt] at (0.985*\notewidth in,0.012*\noteheight in) {\includegraphics[height=1.07158 in]{\@sticker}};\fi
        %%%%%% imput file
        \foreach \n in {#1,#2,#3,#4}
        \node [yshift=((28.875-(\n-#1)*8.25+\thenote*33)*0.028*\noteheight in),inner sep=0pt] at (0.3125*\notewidth in,0.038*\noteheight in) {\ifcsname @chapter\endcsname\includegraphics[height=1.77506 in,page=\n]{\@courseware}\fi};

        \foreach \a in {0,...,33}
        \foreach \b in {18,...,29}
        \fill [fill=gray,xshift=\b*0.03*\notewidth in,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) circle (0.006);% 点
        \foreach \a in {1,...,32}
        \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.028 in] (0.575*\notewidth in+0.25*0.028*\notewidth in,0.038*\noteheight in) --++ (0.375*\notewidth in-0.25*0.028*\notewidth in,0);% 横线

        \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0);% 底部粗线

        \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=33*0.028*\noteheight in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily\chaptername~\ifcsname @chapter\endcsname\thechap. \@chapter\fi} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page \thepage\quad};% 顶部粗线

        \draw [line cap=round,thick,opacity=0.4,gray] (0.575*\notewidth in,0.038*\noteheight in+0.25*0.028*\noteheight in) -- (0.575*\notewidth in,0.038*\noteheight in+32.75*0.028*\noteheight in);% 分栏线
    \end{tikzpicture}
}

%%%%%% Simplify loop 4
\newcount\tmpnum
\def\newnotessss#1#2{%   
\addtocounter{note}{-1}
    \def\maxnum{#2}\tmpnum=#1
    \loop      
      \unless\ifnum\tmpnum>#2 \fourbeamers{\valnum0}{\valnum1}{\valnum2}{\valnum3}      
      \advance\tmpnum by4   
    \repeat
}
\def\valnum#1{%   
    \ifnum\maxnum>\numexpr\tmpnum+#1\relax       
      \the\numexpr\tmpnum+#1\relax \else \maxnum\fi 
}

%%%% emptynote (*without chapter title & page number)
\NewDocumentCommand\clearnote{s}{
\begin{tikzpicture}
    \fill [lightyellow!50] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
    \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24,inner sep=0pt] at (0.985*\notewidth in,0.012*\noteheight in) {\includegraphics[height=1.07158 in]{\@sticker}};\fi
    \foreach \a in {0,...,33}
    \foreach \b in {1,...,29}
    \fill [fill=gray,xshift=\b*0.03*\notewidth in,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) circle (0.006);% 点
    \foreach \a in {1,...,32}
    \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0);% 横线

    \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0);% 底部粗线

    \IfBooleanTF{#1}
    {
    \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=33*0.028*\noteheight in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily\chaptername} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page\addtocounter{page}{-1}\quad\quad};% 顶部粗线
    }
    {
    \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=33*0.028*\noteheight in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily\chaptername~\ifcsname @chapter\endcsname\thechap. \@chapter\fi} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page \thepage\quad};% 顶部粗线
    }

    \draw [line cap=round,thick,opacity=0.4,gray] (0.5*\notewidth in,0.038*\noteheight in+0.25*0.028*\noteheight in) -- (0.5*\notewidth in,0.038*\noteheight in+32.75*0.028*\noteheight in);% 分栏线
\end{tikzpicture}
}

\NewDocumentCommand\emptynote{s O{1}}
{\IfBooleanTF{#1}{
    \Repeat{#2}{\clearnote*}
    }{
    \Repeat{#2}{\clearnote}
    }
}

%%%% emptynote with school title (*without chapter title & page number)
\NewDocumentCommand\clearhdunote{s}{
\begin{tikzpicture}
    \fill [lightyellow!50] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
    \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24,inner sep=0pt] at (0.985*\notewidth in,0.012*\noteheight in) {\includegraphics[height=1.07158 in]{\@sticker}};\fi
    \foreach \a in {0,...,32}
    \foreach \b in {1,...,29}
    \fill [fill=gray,xshift=\b*0.03*\notewidth in,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) circle (0.006);% 点
    \foreach \a in {1,...,31}
    \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.028 in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0);% 横线

    \IfBooleanTF{#1}
    {
    \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=north east,darkgray] {\small\color{紺色}\bfseries\sffamily Page\addtocounter{page}{-1}\quad\quad};% 底部粗线
    }{
    \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=north east,darkgray] {\small\color{紺色}\bfseries\sffamily Page \thepage\quad};% 底部粗线
    }

    \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=32*0.028*\noteheight in] (0.05*\notewidth in,0.038*\noteheight in) --++ (0.9*\notewidth in,0)\ifcsname @logo\endcsname node [anchor=west,at start,yshift=0.033*\noteheight in,inner sep=0pt] {\href{\@edu}{\includegraphics[height=0.45808 in]{\@logo}}} node [anchor=east,yshift=0.033*\noteheight in] {\bfseries\heiti\color{紺色}\faIcon{map-pin} \@address\quad\quad}\fi;% 顶部粗线

    \draw [line cap=round,thick,opacity=0.4,gray] (0.5*\notewidth in,0.038*\noteheight in+0.25*0.028*\noteheight in) -- (0.5*\notewidth in,0.038*\noteheight in+31.75*0.028*\noteheight in);% 分栏线
\end{tikzpicture}
}

\NewDocumentCommand\emptyhdunote{s O{1}}
{\IfBooleanTF{#1}{
    \Repeat{#2}{\clearhdunote*}
    }{
    \Repeat{#2}{\clearhdunote}
    }
}

%% covers
\ifdefstring{\NB@color}{lighter}{\newcommand{\@saturation}{.16}}{\relax}
\ifdefstring{\NB@color}{normal}{\newcommand{\@saturation}{.12}}{\relax}
\ifdefstring{\NB@color}{darker}{\newcommand{\@saturation}{.08}}{\relax}

\definecolor{H1}{Hsb}{349,\@saturation,.9}% 海棠紅 (Hangzhou MTR L 1 )
\definecolor{H2}{Hsb}{23, \@saturation,.9}% 丹桂橙 (Hangzhou Metro 2 )
\definecolor{H3}{Hsb}{48, \@saturation,.9}% 柠檬黄 (Hangzhou Metro 3 )
\definecolor{H4}{Hsb}{103,\@saturation,.9}% 香樟绿 (Hangzhou Metro 4 )
\definecolor{H5}{Hsb}{188,\@saturation,.9}% 青藍色 (Hangzhou MTR L 5 )
\definecolor{H6}{Hsb}{207,\@saturation,.9}% 海洋蓝 (Hangzhou Metro 6 )
\definecolor{H7}{Hsb}{290,\@saturation,.9}% 浪漫紫 (Hangzhou Metro 7 )

\NewDocumentCommand\notebook{s O{H5} m O{}}{
    \setcounter{chap}{0}
    \setcounter{page}{0}
    \begin{tikzpicture}
        \fill [#2] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
        \fill [white,opacity=0.17] (0.2*\notewidth in,0.6*\noteheight in) rectangle (\notewidth in,0);
        \fill [white,opacity=0.17] (0.3*\notewidth in,0.7*\noteheight in) rectangle (\notewidth in,0);
        \node at (0.65*\notewidth in,0.65*\noteheight in) {\LARGE\bfseries\sffamily #3};
        \node [rotate=90,opacity=0.4] at (0.25*\notewidth in,0.3*\noteheight in) {\sffamily\Large\bfseries\MakeUppercase{#4}};
        \draw [thick,line cap=round] (0.65*\notewidth in,0.05*\noteheight in) --++ (0.25*\notewidth in,0) node [anchor=south west] {\large\faIcon{feather-alt}} \ifcsname @mail\endcsname node [midway,anchor=south] {\bfseries\texttt{\@mail}}\fi node [midway,anchor=south,yshift=2em] {\bfseries\sffamily\large\ifcsname @author\endcsname\@author\fi};
        \ifcsname @logo\endcsname\node [anchor=north west] at (0.025*\notewidth in,0.991*\noteheight in) {\href{\@edu}{\includegraphics[width=2.212 in]{\@logo}}};\fi
    \end{tikzpicture}
    \ifcsname @flyleaf\endcsname
    \addtocounter{page}{-1}
    \begin{tikzpicture}
        \node [inner sep=0pt] at (0.5*\notewidth in,0.5*\noteheight in) {\includegraphics[width=\notewidth in]{\@flyleaf}};
    \end{tikzpicture}
    \fi
    \IfBooleanTF{#1}{\emptynote*}{}
}

%% LaTeX 3 \Repeat supports
\ExplSyntaxOn
\cs_new_eq:NN \Repeat \prg_replicate:nn
\ExplSyntaxOff