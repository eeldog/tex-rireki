%% rireki.cls
%% $Date: 2002/01/21 18:59:32 $
%%
%% Copyright (C) 2002 MIYAMOTO Yusuke
%% All rights reserved.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rireki}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jarticle}}
\ProcessOptions
\LoadClass[twoside,11pt]{jarticle}

%% �ѻ極���� (B5)
\setlength{\paperwidth}{181mm}
\setlength{\paperheight}{257mm}
\@settopoint{\paperwidth}
\@settopoint{\paperheight}

%% �ѻ溸������Ȥ���
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}

%% ˵������
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

%% ���ޡ�����
\setlength{\oddsidemargin}{20mm}
\setlength{\evensidemargin}{10.5mm}
\@settopoint{\oddsidemargin}
\@settopoint{\evensidemargin}

%% ��ޡ�����
\setlength{\headheight}{\z@}
\setlength{\headsep}{\z@}
\setlength{\topsep}{\z@}
\setlength{\topmargin}{16mm}
\@settopoint{\topmargin}

%% �����ΰ����
\setlength{\footnotesep}{\z@}
\setlength{\footskip}{\z@}

%% �ƥ������ΰ�
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-\oddsidemargin}
\addtolength{\textwidth}{-\evensidemargin}
\@settopoint{\textwidth}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-2\topmargin}
\@settopoint{\textheight}

%% picture ���襳�ޥ��
%% ��ɸ�ΰ�ư
\newcommand{\@x}{0}
\newcommand{\@y}{0}
\newcounter{pic@x}
\newcounter{pic@y}
\def\MoveTo(#1,#2){\gdef\@x{#1}\gdef\@y{#2}}
\def\RMoveTo(#1,#2){%
  \@tempcnta=\number\@x
  \advance\@tempcnta by #1
  \xdef\@x{\the\@tempcnta}
  \@tempcnta=\number\@y
  \advance\@tempcnta by #2
  \xdef\@y{\the\@tempcnta}
}

%% ��������Ȥ����ɸ�Ϥ����л��� \put
\def\Put(#1,#2){%
  \setcounter{pic@x}{\@x}
  \setcounter{pic@y}{\pic@height}
  \addtocounter{pic@x}{#1}
  \addtocounter{pic@y}{-\@y}
  \addtocounter{pic@y}{-#2}
  \put(\thepic@x, \thepic@y)%
}
\def\MultiPut(#1,#2){%
  \setcounter{pic@x}{\@x}
  \setcounter{pic@y}{\pic@height}
  \addtocounter{pic@x}{#1}
  \addtocounter{pic@y}{-\@y}
  \addtocounter{pic@y}{-#2}
  \multiput(\thepic@x, \thepic@y)%
}

%% ������������륳�ޥ�ɡ�\end{document} �Ǽ¹Ԥ���롥
\newcommand{\@makehistory}{%
\setlength\unitlength{1mm}
\@tempcnta=\number\textwidth
\divide\@tempcnta by \number\unitlength
\edef\pic@width{\the\@tempcnta}
\@tempcnta=\number\textheight
\divide\@tempcnta by \number\unitlength
\edef\pic@height{\the\@tempcnta}

%% picture �Ķ�
\noindent
\begin{picture}(\pic@width, \pic@height)

%% �����ȥ롤�̿�����
\MoveTo(0,0)
\Put(0,0){\Large\bf\kanjiskip=5mm\historyname}
\Put(100,2){\makebox(0,5)[rc]{\scriptsize\@date ����}}
\Put(104,32){\dashbox{0.5}(30,40)[c]{\scriptsize %
  \shortstack[c]{�̿���Ž�����\\�� $36\sim 40$ mm\\�� $24\sim 30$ mm}}}
\@tempcnta=\number\paperheight
\divide\@tempcnta by 2
\advance\@tempcnta by -\number\topmargin
\divide\@tempcnta by \unitlength
\Put(-16,\the\@tempcnta){$\triangleleft$}

%% ��̾��������ʤɤΥץ��ե�����
\MoveTo(0,0)
\thicklines
\Put(0,2){\line(1,0){100}}
\Put(0,2){\line(0,-1){82}}
\Put(0,84){\line(1,0){151}}
\Put(100,2){\line(0,-1){32}}
\Put(100,34){\line(1,0){51}}
\Put(151,34){\line(0,-1){50}}

\thinlines
\Put(0,7){\dashbox{.5}(100,5)[l]{\scriptsize\hspace{1mm}\kananame}}
\Put(0,24){\line(1,0){100}}
\Put(1,8){\makebox(0,0)[tl]{\scriptsize\namename}}
\Put(1,24){\makebox(42,16)[r]{\LARGE\kanjiskip=3mm\@surname\hspace{12pt}}}
\Put(1,7){\makebox(42,5)[r]{\scriptsize\kana@surname\hspace{12pt}}}
\Put(42,24){\makebox(42,16)[l]{\LARGE\kanjiskip=3mm\hspace{12pt}\@forename}}
\Put(42,7){\makebox(42,5)[l]{\scriptsize\hspace{12pt}\kana@forename}}
\Put(87,2){\line(0,-1){22}}
\Put(88,24){\makebox(12,16)[tl]{\tiny ��}}
\Put(88,7){\makebox(12,5)[c]{\scriptsize\sexname\hskip 1ex\@sex}}

\Put(0,34){\makebox(100,10)[l]{\scriptsize\hspace{1ex}\birthdayname}}
\Put(0,34){\makebox(100,10)[r]{\@birthday\hskip 2em
    (��\hbox to 2em{\hfil\@age}��)\hspace{1em}}}
\Put(0,34){\line(1,0){100}}

\Put(0,39){\dashbox{.5}(151,5)[l]{\hspace{1mm}\scriptsize\kananame}}
\Put(10,38){\makebox(0,0)[lb]{\hskip 1zw\scriptsize\kana@address}}
\Put(1,40){\makebox(0,0)[tl]{\scriptsize\addressname}}
\Put(12,40){\makebox(0,0)[lt]{\small �� \@postalcode}}
\Put(0,48){\makebox(148,5)[cb]{\@address}}
\Put(0,50){\line(1,0){151}}
\Put(1,51){\makebox(0,0)[tl]{\scriptsize\contactname}}
\Put(0,58){\makebox(151,8)[bl]{\@phone\@email}}
\Put(0,59){\line(1,0){151}}
\Put(0,64){\dashbox{.5}(151,5)[l]{\hspace{1mm}\scriptsize\kananame}}
\Put(10,63){\makebox(0,0)[lb]{\hskip 1zw\scriptsize\kana@anotheraddress}}
\Put(1,65){\makebox(0,0)[tl]{\scriptsize\anotheraddressname}}
\Put(12,65){\makebox(0,0)[lt]{\small �� \@anotherpostalcode}}
\Put(0,73){\makebox(151,8)[cb]{\@anotheraddress}}
\Put(0,75){\line(1,0){151}}
\Put(1,76){\makebox(0,0)[tl]{\scriptsize\contactname}}
\Put(0,82){\makebox(151,8)[bl]{\@anotherphone}}

%% ���򡦿���
\MoveTo(0,85)
\thicklines
\Put(0,0){\line(1,0){151}}
\Put(151,0){\line(0,-1){132}}
\Put(0,0){\line(0,-1){132}}
\Put(0,132){\line(1,0){151}}

\thinlines
\Put(0,132){\dashbox{.5}(17,132){}}
\Put(26,0){\line(0,-1){132}}
\Put(0,5){\line(1,0){151}}
\Put(0,5){\makebox(17,5)[c]{\scriptsize ǯ}}
\Put(17,5){\makebox(9,5)[c]{\scriptsize ��}}
\Put(26,5){\makebox(125,5)[c]{\scriptsize\backgroundname}}
\@tempcnta=12
\@whilenum\@tempcnta<128\do{
  \Put(0,\the\@tempcnta){\line(1,0){151}}
  \advance\@tempcnta by 7
}
\@starttoc{lob}
\@starttoc{loc}

\end{picture}
\clearpage

%% ���ڡ���
\begin{picture}(\pic@width, \pic@height)

\MoveTo(0,0)
\thicklines
\Put(0,0){\line(1,0){151}}
\Put(0,0){\line(0,-1){222}}
\Put(151,0){\line(0,-1){222}}
\Put(0,222){\line(1,0){151}}

\Put(0,75){\line(1,0){151}}
\Put(0,163){\line(1,0){151}}
\Put(0,191){\line(1,0){151}}
\Put(0,200){\line(1,0){151}}

%% �ȵ������
\MoveTo(0,0)
\thinlines
\Put(0,75){\dashbox{.5}(17,75){}}
\Put(26,0){\line(0,-1){75}}
\Put(0,5){\makebox(17,5)[c]{\scriptsize ǯ}}
\Put(17,5){\makebox(9,5)[c]{\scriptsize ��}}
\Put(26,5){\makebox(125,5)[c]{\scriptsize\licensename}}
\Put(0,5){\line(1,0){151}}
\@tempcnta=12
\@whilenum\@tempcnta<82\do{
  \Put(0,\@tempcnta){\line(1,0){151}}
  \advance\@tempcnta by 7
}
\@starttoc{lol}

%% ���ղ���
\Put(75,75){\line(0,-1){58}}
\Put(1,104){\makebox(75,28)[lt]{\scriptsize\subjectname}}
\Put(1,104){\makebox(75,24){\@subject}}
%% ����ʬ��
\Put(76,104){\makebox(75,28)[lt]{\scriptsize\selfintroname}}
\Put(76,104){\makebox(75,24)[c]{\@selfintro}}
\Put(0,104){\line(1,0){151}}
%% ��̣
\Put(1,133){\makebox(75,28)[lt]{\scriptsize\hobbyname}}
\Put(1,133){\makebox(75,24){\@hobby}}
%% �õ�
\Put(76,133){\makebox(75,28)[lt]{\scriptsize\profname}}
\Put(76,133){\makebox(75,24){\@prof}}
\Put(0,133){\line(1,0){151}}
%% ư��
\Put(1,163){\makebox(150,29)[lt]{\scriptsize\motivename}}
\Put(1,163){\makebox(150,24){\@motive}}
%% �ܿʹ�˾
\Put(1,191){\makebox(150,27)[tl]{\scriptsize\wishname}}
\Put(1,191){\makebox(150,22){\@wish}}
%% �̶л���
\Put(1,200){\makebox(47,8)[lt]{\scriptsize\commutename}}
\Put(1,200){\makebox(45,8)[r]{\@commute}}
\Put(48,191){\line(0,-1){9}}
%% ���ܲ�²
\Put(49,200){\makebox(34,8)[lt]{\scriptsize\dependentsname}}
\Put(49,200){\makebox(31,8)[r]{\@dependents}}
\Put(84,191){\line(0,-1){9}}
%% �۶���
\Put(85,200){\makebox(34,8)[lt]{\scriptsize\matename}}
\Put(85,200){\makebox(31,8)[r]{\@mate}}
\Put(117,191){\line(0,-1){9}}
%% �۶��Ԥ����ܵ�̳
\Put(118,200){\makebox(33,8)[lt]{\scriptsize\matedependencename}}
\Put(118,200){\makebox(32,8)[r]{\@matedependence}}
%% �ݸ��
\Put(0,208){\dashbox{.5}(125,8){}}
\Put(1,208){\makebox(124,7)[lt]{\scriptsize\guardianname}}
\Put(1,207){\makebox(124,7)[lb]{\scriptsize\kananame}}
\Put(35,208){\line(0,-1){14}}
\Put(1,222){\makebox(34,13)[lt]{\scriptsize\namename}}
\Put(35,222){\makebox(91,13)[lt]{\small �� \@guardianpostalcode}}
\Put(1,222){\makebox(0,0)[lt]{\@guardian}}
\Put(125,200){\line(0,-1){22}}
\Put(126,222){\makebox(25,21)[lt]{\scriptsize\contactname}}
\Put(126,222){\makebox(25,16)[lt]{\@guardianphone}}
\end{picture}
}

%% ����� ������
\renewcommand{\@date}{\today}
\renewcommand{\date}[1]{\def\@date{#1}}

%% ��
\newcommand\@surname\@empty
\newcommand\kana@surname\@empty
\newcommand{\surname}{\@testopt\surn@me{}}
\def\surn@me[#1]#2{%
  \def\@surname{#2}
  \def\kana@surname{#1}
}

%% ̾
\newcommand\@forename\@empty
\newcommand\kana@forename\@empty
\newcommand{\forename}{\@testopt{\foren@me}{}}
\def\foren@me[#1]#2{%
  \def\@forename{#2}
  \def\kana@forename{#1}
}

%% ������
\newcommand\@address\@empty
\newcommand\kana@address\@empty
\newcommand{\address}{\@testopt{\@ddress}{}}
\def\@ddress[#1]#2{%
  \def\@address{#2}
  \def\kana@address{#1}
}

%% ͹���ֹ�
\newcommand\@postalcode\@empty
\newcommand{\postalcode}[1]{\def\@postalcode{#1}}

%% �����ֹ�
\newcommand\@phone\@empty
\newcommand{\phone}[1]{\def\@phone{\hskip 24pt\textsc{Tel}: #1}}

%% �Żҥ᡼��
\newcommand\@email\@empty
\newcommand{\email}[1]{\def\@email{\hskip 24pt\textsc{Email}: \texttt{#1}}}

%% Ϣ���轻��
\newcommand\@anotheraddress\@empty
\newcommand\kana@anotheraddress\@empty
\newcommand{\anotheraddress}{\@testopt{\@nother@ddress}{}}
\def\@nother@ddress[#1]#2{%
  \def\@anotheraddress{#2}
  \def\kana@anotheraddress{#1}
}

%% Ϣ����͹���ֹ�
\newcommand\@anotherpostalcode\@empty
\newcommand{\anotherpostalcode}[1]{\def\@anotherpostalcode{#1}}

%% Ϣ���������ֹ�
\newcommand\@anotherphone\@empty
\newcommand{\anotherphone}[1]{\def\@anotherphone{\hskip 24pt\textsc{Tel}: #1}}

%% ��ǯ����
\newcommand{\@birthday}{}
\newcommand{\birthday}[3]{\def\@birthday{#1ǯ#2��#3����}}

%% ǯ��
\newcommand{\@age}{??}
\newcommand{\age}[1]{\def\@age{#1}}

%% ����
\newcommand{\@sex}{??}
\newcommand{\sex}[1]{\def\@sex{#1}}

%% ���ղ���
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\long\def\@subject{\parbox{72mm}{#1}}}

%% ����ʬ��
\newcommand{\@selfintro}{}
\newcommand{\selfintro}[1]{\long\def\@selfintro{\parbox{72mm}{#1}}}

%% ��̣
\newcommand{\@hobby}{}
\newcommand{\hobby}[1]{\long\def\@hobby{\parbox{72mm}{#1}}}

%% �õ�
\newcommand{\@prof}{}
\newcommand{\prof}[1]{\long\def\@prof{\parbox{72mm}{#1}}}

%% ��˾ư��
\newcommand{\@motive}{}
\newcommand{\motive}[1]{\long\def\@motive{\parbox{145mm}{#1}}}

%% �ܿʹ�˾
\newcommand{\@wish}{}
\newcommand{\wish}[1]{\long\def\@wish{\parbox{72mm}{#1}}}

%% �̶л���
\newcommand{\@commute}{}
\newcommand{\commute}[1]{\def\@commute{#1}}

%% ���ܲ�²
\newcommand{\@dependents}{}
\newcommand{\dependents}[1]{\def\@dependents{#1}}

%% �۶���
\newcommand{\@mate}{}
\newcommand{\mate}[1]{\def\@mate{#1}}

%% �۶��Ԥ����ܵ�̳
\newcommand{\@matedependence}{}
\newcommand{\matedependence}[1]{\def\@matedependence{#1}}

%% �ݸ��
\newcommand{\@guardian}{}
\newcommand{\guardian}[1]{\def\@guardian{#1}}

%% �ݸ��͹���ֹ�
\newcommand{\@guardianpostalcode}{}
\newcommand{\guardianpostalcode}[1]{\def\@guardianpostalcode{#1}}

%% �ݸ�Խ���
\newcommand{\@guardianaddress}{}
\newcommand{\guardianaddress}[1]{\def\@guardianaddress{#1}}

%% �ݸ�������ֹ�
\newcommand{\@guardianphone}{}
\newcommand{\guardianphone}[1]{\def\@guardianphone{#1}}

%% �ꥹ�Ƚ����ѥ��ޥ��
%% #1: y ��ɸ
%% #2: ǯ
%% #3: ��
%% #4: ����
\newcommand{\PutListEntry}[4]{
  \Put(0,#1){\makebox(17,7)[c]{#2}}
  \Put(17,#1){\makebox(9,7)[c]{#3}}
  \Put(28,#1){\makebox(121,7)[l]{#4}}
}

%% ����ꥹ���ɲ�
\newcounter{@b}\setcounter{@b}{5}
\newcommand{\background}[3]{%
  \addtocounter{@b}{7}
  \addtocontents{lob}{\protect\PutListEntry{\the@b}{#1}{#2}{#3}}
}

%% ����ꥹ���ɲ�
\newcounter{@c}\setcounter{@c}{0}
\newif\if@career
\@careertrue
\newcommand{\career}[3]{%
  \@careerfalse
  \addtocounter{@c}{7}
  \addtocontents{loc}{\protect\PutListEntry{\the@c}{#1}{#2}{#3}}
}

%% ��ʡ��ȵ��ꥹ���ɲ�
\newcounter{@l}\setcounter{@l}{5}
\newcommand{\license}[3]{%
  \addtocounter{@l}{7}
  \addtocontents{lol}{\protect\PutListEntry{\the@l}{#1}{#2}{#3}}
}

%% �����ꥢ�������
\let\��=\surname\relax
\let\̾=\forename\relax
\let\����=\sex\relax
\let\ǯ��=\age\relax
\let\ǯ��=\age\relax
\let\��ǯ����=\birthday\relax
\let\������=\birthday\relax
\let\͹���ֹ�\postalcode\relax
\let\������=\address\relax
\let\�����ֹ�=\phone\relax
\def\�᡼��{\email}
\def\�Żҥ᡼��{\email}
\let\Ϣ����͹���ֹ�\anotherpostalcode\relax
\let\Ϣ���轻��=\anotheraddress\relax
\let\Ϣ���������ֹ�=\anotherphone\relax
\let\����=\background\relax
\let\����=\career\relax
\let\���=\license\relax
\let\�ȵ�=\license\relax
\let\licence=\license\relax
\let\���ղ���=\subject\relax
\let\����ʬ��=\selfintro\relax
\let\��̣=\hobby\relax
\let\�õ�=\prof\relax
\let\ư��=\motive\relax
\let\��˾ư��=\motive\relax
\let\��˾=\wish\relax
\let\�ܿʹ�˾=\wish\relax
\let\�̶л���=\commute\relax
\let\���ܲ�²=\dependents\relax
\let\�۶���=\mate\relax
\let\�۶������ܵ�̳=\matedependence\relax
\let\�ݸ��=\guardian\relax
\let\�ݸ��͹���ֹ�\guardianpostalcode\relax
\let\�ݸ�Խ���=\guardianaddress\relax
\let\�ݸ�������ֹ�=\guardianphone\relax

%% ����̾
\newcommand{\historyname}{�����}
\newcommand{\namename}{��~~̾}
\newcommand{\kananame}{�դ꤬��}
\newcommand{\addressname}{��~��~��}
\newcommand{\anotheraddressname}{Ϣ~��~��}
\newcommand{\contactname}{���äʤ�}
\newcommand{\birthdayname}{��ǯ����}
\newcommand{\sexname}{����}
\newcommand{\backgroundname}{���򡦿���}
\newcommand{\licensename}{�ȵ������}
\newcommand{\subjectname}{���դʲ��ܡ�ʬ��}
\newcommand{\selfintroname}{����ʬ�� (���ʡ���ħ��PR �ʤ�)}
\newcommand{\hobbyname}{��̣�����ݡ��ġ���������ʤ�}
\newcommand{\profname}{�õ��ʤ�}
\newcommand{\motivename}{��˾��ư��}
\newcommand{\wishname}{�ܿʹ�˾������ (�ä˵����������̳���֡���̳�ϡ�
  ����¾�ˤĤ��Ƥδ�˾�ʤɤ�����е���)}
\newcommand{\guardianname}{�ݸ�� (�ܿͤ�̤��ǯ�ξ��Τߵ���)}
\newcommand{\commutename}{�̶л���}
\newcommand{\dependentsname}{���ܲ�²��}
\newcommand{\matename}{�۶���}
\newcommand{\matedependencename}{�۶��Ԥ����ܵ�̳}

%% �եå� ���ޥ�ɤ���Ͽ
\AtBeginDocument{\pagestyle{empty}}
\AtBeginDocument{\background{}{}{\textbf{\hfil ����}}}
\AtBeginDocument{\career{}{}{\textbf{\hfil ����}}\@careertrue}

\AtEndDocument{\addtocontents{lob}{\protect\RMoveTo(0,\the@b)}}
\AtEndDocument{\if@career\career{}{}{\hfil �ʤ�}\fi}
\AtEndDocument{\career{}{}{\hfill �ʾ�\hspace{2em}}}
\AtEndDocument{\addtocontents{loc}{\protect\RMoveTo(0,-\the@b)}}
\AtEndDocument{\@makehistory}

\endinput