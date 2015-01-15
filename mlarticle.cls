%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 益田研クラスファイル mlarticle.cls    ver 0.0.1 
%%                                 Time-stamp: <2002-02-06 19:46:54 age>
%%
%% 修士論文用 
%% \documentclass{master-thesis}{mlarticle}
%% 卒業論文用 
%% \documentclass{ation-thesis}{mlarticle}
%% 研究発表レジュメ用
%% \documentclass{resume}{mlarticle}
%% 研究発表レジュメ用その2
%% \documentclass[jcsummary]{mlarticle}
%%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{mlarticle}[2002/01/22 age]
\newif\if@thesis
\newif\if@thesistwo
\newif\if@resume
\DeclareOption{doctor-thesis}{\@thesistrue}
\DeclareOption{master-thesis}{\@thesistrue\@resumefalse}
\DeclareOption{graduation-thesis}{\@thesistrue\@resumefalse}
\DeclareOption{graduation-thesis2}{\@thesistwotrue\@resumefalse}
\DeclareOption{resume}{\@thesisfalse\@thesistwofalse\@resumetrue}
\DeclareOption{jcsummary}{\@thesisfalse\@thesistwofalse\@resumefalse}

\ExecuteOptions{resume}
\ProcessOptions\relax
\if@thesis
  \LoadClass[12pt,a4j]{jsarticle}
\else\if@thesistwo
  \LoadClass[12pt,a4j]{jsarticle}
\else \if@resume
  \LoadClass[10pt,a4j,twocolumn,notitlepage]{jsarticle}

  % ベースラインの設定
  % 14.554375 <- 16pt
  \def\n@baseline{14.554375}
  \setlength{\fullwidth}{0.81\paperwidth}
  \if@twocolumn \@tempdima=2zw \else \@tempdima=1zw \fi
  \divide\fullwidth\@tempdima \multiply\fullwidth\@tempdima
  \setlength\textwidth{\fullwidth}

  % 本文の幅の設定
  \setlength{\fullwidth}{0.85\paperwidth}
  \if@twocolumn \@tempdima=2zw \else \@tempdima=1zw \fi
  \divide\fullwidth\@tempdima \multiply\fullwidth\@tempdima
  \setlength\textwidth{\fullwidth}

  % 本文の高さの設定
  \setlength{\textheight}{0.80\paperheight}
  \divide\textheight\baselineskip
  \multiply\textheight\baselineskip

  % トップマージンの設定
  \setlength{\topmargin}{\paperheight}
  \addtolength{\topmargin}{-\textheight}
  \addtolength{\topmargin}{-\headheight}
  \addtolength{\topmargin}{-\headsep}
  \addtolength{\topmargin}{-\footskip}
  \setlength{\topmargin}{0.25\topmargin}
  \iftombow
    \addtolength{\topmargin}{-1in}
  \else
    \addtolength{\topmargin}{-1truein}
  \fi

  % サイドマージンの設定
  \setlength{\oddsidemargin}{0.5\paperwidth}
  \addtolength{\oddsidemargin}{-0.5\textwidth}
  \iftombow
    \addtolength{\oddsidemargin}{-1in}
  \else
    \addtolength{\oddsidemargin}{-1truein}
  \fi
  \setlength{\evensidemargin}{\oddsidemargin}

  % maketitle コマンドの変更
  \if@titlepage
  \else
    \renewcommand{\maketitle}{\par
      \begingroup
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
        \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
        \long\def\@makefntext##1{\advance\leftskip 3zw
          \parindent 1zw\noindent
          \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
        \if@twocolumn
          \ifnum \col@number=\@ne
            \@maketitle
          \else
            \twocolumn[\@maketitle]%
          \fi
        \else
          \newpage
          \global\@topnum\z@  % Prevents figures from going at top of page.
          \@maketitle
        \fi
        \plainifnotempty
        \@thanks
      \endgroup
      \setcounter{footnote}{0}%
      \global\let\thanks\relax
      \global\let\maketitle\relax
      \global\let\@thanks\@empty
      \global\let\@author\@empty
      \global\let\@date\@empty
      \global\let\@title\@empty
      \global\let\title\relax
      \global\let\author\relax
      \global\let\date\relax
      \global\let\and\relax
      \global\let\name\relax
      \global\let\adate\relax
      \global\let\lab\relax
    }
    \def\@maketitle{%
      \newpage\null
      {\@name}\hfill{\@adate}
      \vskip 0.5em
      \begin{center}%
        \let\footnote\thanks
        {\LARGE \@title \par}%
        \vskip 1.5em
        {\large
          \lineskip .5em
          \begin{tabular}[t]{cc}%
            \@lab & \@author
          \end{tabular}\par}%
      \end{center}%
      \par\vskip 1.5em}
      \gdef\@name{}
      \gdef\@adate{}
      \gdef\@lab{}
      \long\def\name#1{\long\gdef\@name{#1}}
      \long\def\adate#1{\long\gdef\@adate{#1}}
      \long\def\lab#1{\long\gdef\@lab{#1}}
  \fi

  % ページスタイル
  \pagestyle{empty}

  % キャプション前後のスペースの設定
  \setlength{\abovecaptionskip}{0\p@}
  \setlength{\belowcaptionskip}{0\p@} 
\else
  %
  
  % jcsummary のインポート(Jan 29 2002 杉木)
  %
  \LoadClass[11pt,a4paper,twocolumn,notitlepage]{jsarticle}

  % baseline の変更
  % 14.554375 <- 16pt
  \def\n@baseline{14.554375}

  % 本文の幅
  % B4 で左右 1.5cm 以上空くつもり(?) (0.835 倍以下なら OK)
  \setlength{\fullwidth}{0.81\paperwidth}
  \if@twocolumn \@tempdima=2zw \else \@tempdima=1zw \fi
  \divide\fullwidth\@tempdima \multiply\fullwidth\@tempdima
  \setlength\textwidth{\fullwidth}

  % 本文の高さ
  % 本文が紙の高さの 0.86 倍になるようにします。
  \setlength{\textheight}{0.80\paperheight}
  %\addtolength{\textheight}{-\headheight}
  %\addtolength{\textheight}{-\headsep}
  %\addtolength{\textheight}{-\footskip}
  %\addtolength{\textheight}{-\topskip}
  \divide\textheight\baselineskip
  \multiply\textheight\baselineskip

  % \topmargin を変更します。
  % 上側 1inch 空けなければいけないのを無視して
  % テキストが中央にくるようにしました。
  % jsclasses とまったく同じなのになぜ結果が違うのか不明

  \setlength{\topmargin}{\paperheight}
  \addtolength{\topmargin}{-\textheight}
  \addtolength{\topmargin}{-\headheight}
  \addtolength{\topmargin}{-\headsep}
  \addtolength{\topmargin}{-\footskip}
  \setlength{\topmargin}{0.5\topmargin}
  \iftombow
    \addtolength{\topmargin}{-1in}
  \else
    \addtolength{\topmargin}{-1truein}
  \fi

  % \sidemargin の値を変更します。
  % 左側 1inch 空けるのを無視して
  % テキストが無理矢理中央にくるように変更しました。
  %
  \setlength{\oddsidemargin}{\paperwidth}
  \addtolength{\oddsidemargin}{-\textwidth}
  \setlength{\oddsidemargin}{0.5\oddsidemargin}
  \iftombow
    \addtolength{\oddsidemargin}{-1in}
  \else
    \addtolength{\oddsidemargin}{-1truein}
  \fi
  \setlength{\evensidemargin}{\oddsidemargin}

  % sheading ページスタイルを追加します。
  %
  \def\ps@sheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{{\leftmark}\hfill\rightmark}%
    \def\@oddhead{{\leftmark}\hfill\rightmark}%
    \let\@mkboth\@gobbletwo

    \let\subsectionmark\@gobble
  }

  % maketitle コマンドの変更
  %
  % 独立した表題ページをつくらない場合を変更します。
  % 日付を省いてスペースを狭くしました。
  %
  \def\@maketitle{%
    \newpage\null
    \vspace*{-2zw}% 強引な center 環境の打ち消し。
    \begin{center}%
      \let\footnote\thanks
      {\LARGE \@title \par}%
      \vskip 1zw
      {\large
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
    \end{center}%
    \par\vskip 1zw}

  % ページのスタイルは empty。
  \pagestyle{empty}

  % キャプションの前後のスペースを 0pt にします。
  \setlength{\abovecaptionskip}{0\p@}
  \setlength{\belowcaptionskip}{0\p@}

  % フロートの前後のスペースのパラメータです。
  %\setlength{\floatsep}{12\p@ \@plus 2\p@ \@minus 12\p@}
  %\setlength{\textfloatsep}{20\p@ \@plus 2\p@ \@minus 20\p@}
  %\setlength{\intextsep}{6\p@ \@plus 2\p@ \@minus 4\p@}

  %\setlength\dblfloatsep{12\p@ \@plus 2\p@ \@minus 12\p@}
  %\setlength\dbltextfloatsep{6\p@ \@plus 2\p@ \@minus 20\p@}

  %\renewenvironment{figure}%
  %               {\@float{figure}}%
  %               {\end@float}
  %\renewenvironment{figure*}%
  %               {\@dblfloat{figure}}%
  %               {\end@dblfloat}

  % 参考文献のフォントを小さくします。
  \renewenvironment{thebibliography}[1]{%
    \global\let\@secapp\relax
    \section*{\refname\@mkboth{\refname}{\refname}}%
    \small% <- 実はコレだけの変更です。
    \list{\@biblabel{\@arabic\c@enumiv}}%
         {\settowidth\labelwidth{\@biblabel{#1}}%
          \leftmargin\labelwidth
          \advance\leftmargin\labelsep
          \@openbib@code
          \usecounter{enumiv}%
          \let\p@enumiv\@empty
          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty\clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}
\fi
\fi
\fi
%
\renewcommand{\prepartname}{第}
\renewcommand{\postpartname}{部}
\renewcommand{\contentsname}{目次}
\renewcommand{\listfigurename}{図目次}
\renewcommand{\listtablename}{表目次}
\renewcommand{\refname}{参考文献}
\renewcommand{\indexname}{索引}
\renewcommand{\figurename}{図}
\renewcommand{\tablename}{表}
\renewcommand{\appendixname}{}
\renewcommand{\abstractname}{要旨}
\setcounter{tocdepth}{3} % by Kawai
%%
%% End of file
