%% start of file `NoteBeamer.cls'.
%% 
%% Copyright 2023 LiteSolution (xiamyphys@gmail.com)
%% This work may be distributed and/or modified freely
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NoteBeamer}[2023/10/22 v5.0-alpha NoteBeamer document class]
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=NB, prefix=NB@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{NB}{#1}}
% ---- 全局选项
\DeclareStringOption[beamer]{ratio}
\DeclareVoidOption{beamer}{\ekv{ratio=beamer}}
\DeclareVoidOption{slidev}{\ekv{ratio=slidev}}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax

\LoadClass[tikz]{standalone}
\usetikzlibrary{calc}
\RequirePackage[colorlinks,linkcolor=black,urlcolor=black]{hyperref}
\newcommand{\mailto}[1]{\href{mailto:#1}{\nolinkurl{#1}}}
\RequirePackage{ctex}
\RequirePackage{fontawesome5}
\RequirePackage{pdfpages}
\newcommand{\notewidth}{6.32}
\newcommand{\noteheight}{8.18}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\mail}[1]{\gdef\@mail{#1}}
\newcommand{\chapter}[2]{
    \refstepcounter{chap}
    \gdef\@chapter{#1}
    \gdef\@couseware{#2}
    \setcounter{note}{0}
}
\newcommand{\flyleaf}[1]{\gdef\@flyleaf{#1}}
\newcommand{\sticker}[1]{\gdef\@sticker{#1}}

%% notepages
\graphicspath{{./beamer/}}% 路径索引
\definecolor{lightyello}{HTML}{F8F7E9}
\definecolor{紺色}{HTML}{223A70}
\newcounter{chap}
\newcounter{note}

\ifdefstring{\NB@ratio}{beamer}{
    \newcommand{\newnote}[3]{
        \refstepcounter{note}
        \begin{tikzpicture}
            \fill [lightyello!40] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
            \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24] at (\notewidth in,0.0105*\noteheight in) {\includegraphics[height=0.85072 in]{\@sticker}};\fi
            \foreach \a in {0,...,36}
            \foreach \b in {22,...,35}
            \fill [fill=gray,xshift=\b*0.025*\notewidth in,yshift=\a*\noteheight*0.026 in] (0.05*\notewidth in,0.032*\noteheight in) circle (0.006);% 点
            \foreach \a in {1,...,35}
            \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.026 in] (0.58*\notewidth in+0.2*0.026*\noteheight in,0.032*\noteheight in) --++ (0.37*\notewidth in-0.4*0.026*\noteheight in,0);% 横线
        
            \foreach \n in {#1,#2,#3}
            \node [yshift=((42-\n*12+(\thenote-1)*36)*0.026*\noteheight in)] at (0.315*\notewidth in,0.032*\noteheight in) {\ifcsname @chapter\endcsname\includegraphics[height=2.44582 in,page=\n]{\@couseware}\fi};
            
            \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0);% 底部粗线
            \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=36*0.026*\noteheight in] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily Chapter \thechap. \ifcsname @chapter\endcsname\@chapter\fi} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page \addtocounter{page}{-2}\thepage\addtocounter{page}{2}\quad};% 顶部粗线
            \draw [line cap=round,thick,opacity=0.4,gray] ($(0.58*\notewidth in,{(0.032+0.25*0.026)*\noteheight in})$) -- ($(0.58*\notewidth in,{(0.032+35.75*0.026)*\noteheight in})$);% 分栏线
        \end{tikzpicture}
        }
}{\relax}

\ifdefstring{\NB@ratio}{slidev}{
    \newcommand{\newnote}[4]{
        \refstepcounter{note}
        \begin{tikzpicture}
            \fill [lightyello!40] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
            \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24] at (\notewidth in,0.0105*\noteheight in) {\includegraphics[height=0.85072 in]{\@sticker}};\fi
            \foreach \a in {0,...,36}
            \foreach \b in {22,...,35}
            \fill [fill=gray,xshift=\b*0.025*\notewidth in,yshift=\a*\noteheight*0.026 in] (0.05*\notewidth in,0.032*\noteheight in) circle (0.006);% 点
            \foreach \a in {1,...,35}
            \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.026 in] (0.58*\notewidth in+0.2*0.026*\noteheight in,0.032*\noteheight in) --++ (0.37*\notewidth in-0.4*0.026*\noteheight in,0);% 横线
        
            \foreach \n in {#1,#2,#3,#4}
            \node [yshift=((40.5-\n*9+(\thenote-1)*36)*0.026*\noteheight in)] at (0.315*\notewidth in,0.032*\noteheight in) {\ifcsname @chapter\endcsname\includegraphics[height=1.80778 in,page=\n]{\@couseware}\fi};
            
            \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0);% 底部粗线
            \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=36*0.026*\noteheight in] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily Chapter \thechap. \ifcsname @chapter\endcsname\@chapter\fi} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page \addtocounter{page}{-2}\thepage\addtocounter{page}{2}\quad};% 顶部粗线
            \draw [line cap=round,thick,opacity=0.4,gray] ($(0.58*\notewidth in,{(0.032+0.25*0.026)*\noteheight in})$) -- ($(0.58*\notewidth in,{(0.032+35.75*0.026)*\noteheight in})$);% 分栏线
        \end{tikzpicture}
        }
}{\relax}

\newcommand{\clearnote}{
\begin{tikzpicture}
    \fill [lightyello!40] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
    \ifcsname @sticker\endcsname\node [anchor=south east,opacity=0.24] at (\notewidth in,0.0105*\noteheight in) {\includegraphics[height=0.85072 in]{\@sticker}};\fi
    \foreach \a in {0,...,36}
    \foreach \b in {1,...,35}
    \fill [fill=gray,xshift=\b*0.025*\notewidth in,yshift=\a*\noteheight*0.026 in] (0.05*\notewidth in,0.032*\noteheight in) circle (0.006);% 点
    \foreach \a in {1,...,35}
    \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.026 in] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0);% 横线
    \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0);% 底部粗线
    \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=36*0.026*\noteheight in] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\small\color{紺色}\bfseries\sffamily Chapter \ifcsname @chapter\endcsname\thechap. \@chapter\fi} node [anchor=south east] {\small\color{紺色}\bfseries\sffamily Page \addtocounter{page}{-2}\thepage\addtocounter{page}{2}\quad};% 顶部粗线
    \draw [line cap=round,thick,opacity=0.4,gray] ($(0.5*\notewidth in,{(0.032+0.25*0.026)*\noteheight in})$) -- ($(0.5*\notewidth in,{(0.032+35.75*0.026)*\noteheight in})$);% 分栏线
\end{tikzpicture}
}

\newcommand{\newhdunote}{
\begin{tikzpicture}
    \draw [lightyello!40] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
    \foreach \a in {0,...,35}
    \foreach \b in {1,...,29}
    \fill [fill=gray,xshift=\b*0.03*\notewidth in,yshift=\a*\noteheight*0.026 in] (0.05*\notewidth in,0.032*\noteheight in) circle (0.006);% 点
    \foreach \a in {1,...,34}
    \draw [line cap=round,opacity=0.5,gray!80,yshift=\a*\noteheight*0.026 in] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0);% 横线
    \draw [line cap=round,紺色!80,opacity=0.8,thick] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=north east,darkgray] {\small\color{紺色}\bfseries\sffamily Page\quad\quad};% 底部粗线
    \draw [line cap=round,紺色!80,opacity=0.8,thick,yshift=35*0.026*\noteheight in] (0.05*\notewidth in,0.032*\noteheight in) --++ (0.9*\notewidth in,0) node [anchor=south west,at start] {\includegraphics[height=0.42536 in]{HDU.pdf}} node [anchor=south east,yshift=0.5*0.0275*\noteheight in] {\small\bfseries\heiti\color{紺色} 浙江·杭州·下沙高教园\quad\quad};% 顶部粗线
    \draw [line cap=round,thick,opacity=0.4,gray] ($(0.5*\notewidth in,{(0.032+0.25*0.026)*\noteheight in})$) -- ($(0.5*\notewidth in,{(0.032+34.75*0.026)*\noteheight in})$);% 分栏线
\end{tikzpicture}
}

%% covers
\definecolor{1号色}{HTML}{A6B19F}% 绿色
\definecolor{2号色}{HTML}{9EAFAE}% 青色
\definecolor{3号色}{HTML}{BCD7E3}% 浅蓝
\definecolor{4号色}{HTML}{92A6AF}% 深蓝
\definecolor{5号色}{HTML}{BFADC9}% 紫色
\definecolor{6号色}{HTML}{C9ADAD}% 樱色
\definecolor{7号色}{HTML}{E3D2BC}% 淡黄
\definecolor{8号色}{HTML}{C9C1BA}% 茶色
\newcommand{\notebook}[2]{
    \setcounter{chap}{0}
    \begin{tikzpicture}
        \fill [#1] (0,0) rectangle (\notewidth in,\noteheight in);% 边界
        \fill [white,opacity=0.17] (0.2*\notewidth in,0.6*\noteheight in) rectangle (\notewidth in,0);
        \fill [white,opacity=0.17] (0.3*\notewidth in,0.7*\noteheight in) rectangle (\notewidth in,0);
        \node at (0.65*\notewidth in,0.65*\noteheight in) {\LARGE\bfseries\sffamily #2};
        \draw [thick] (0.65*\notewidth in,0.05*\noteheight in) --++ (0.25*\notewidth in,0) node [anchor=south west] {\large\faIcon{pen}} node [midway,anchor=south] {\bfseries\texttt{\mailto{\ifcsname @mail\endcsname\@mail\fi}}} node [midway,anchor=south,yshift=2em] {\bfseries\sffamily\large\ifcsname @author\endcsname\@author\fi};
    \end{tikzpicture}
    \ifcsname @flyleaf\endcsname
    \begin{tikzpicture}
        \node [inner sep=0pt] at (0.5*\notewidth in,0.5*\noteheight in) {\includegraphics[width=\notewidth in]{\@flyleaf}};
    \end{tikzpicture}
    \fi
}