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

%% 用紙サイズ (B5)
\setlength{\paperwidth}{181mm}
\setlength{\paperheight}{257mm}
\@settopoint{\paperwidth}
\@settopoint{\paperheight}

%% 用紙左上を原点とする
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}

%% 傍注を削除
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

%% 左マージン
\setlength{\oddsidemargin}{20mm}
\setlength{\evensidemargin}{10.5mm}
\@settopoint{\oddsidemargin}
\@settopoint{\evensidemargin}

%% 上マージン
\setlength{\headheight}{\z@}
\setlength{\headsep}{\z@}
\setlength{\topsep}{\z@}
\setlength{\topmargin}{16mm}
\@settopoint{\topmargin}

%% 脚注領域を削除
\setlength{\footnotesep}{\z@}
\setlength{\footskip}{\z@}

%% テキスト領域
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-\oddsidemargin}
\addtolength{\textwidth}{-\evensidemargin}
\@settopoint{\textwidth}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-2\topmargin}
\@settopoint{\textheight}

%% picture 描画コマンド
%% 座標の移動
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

%% 左上を原点とする座標系で相対参照 \put
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

%% 履歴書を作成するコマンド．\end{document} で実行される．
\newcommand{\@makehistory}{%
\setlength\unitlength{1mm}
\@tempcnta=\number\textwidth
\divide\@tempcnta by \number\unitlength
\edef\pic@width{\the\@tempcnta}
\@tempcnta=\number\textheight
\divide\@tempcnta by \number\unitlength
\edef\pic@height{\the\@tempcnta}

%% picture 環境
\noindent
\begin{picture}(\pic@width, \pic@height)

%% タイトル，写真位置
\MoveTo(0,0)
\Put(0,0){\Large\bf\kanjiskip=5mm\historyname}
\Put(100,2){\makebox(0,5)[rc]{\scriptsize\@date 現在}}
\Put(104,32){\dashbox{0.5}(30,40)[c]{\scriptsize %
  \shortstack[c]{写真を貼る位置\\縦 $36\sim 40$ mm\\横 $24\sim 30$ mm}}}
\@tempcnta=\number\paperheight
\divide\@tempcnta by 2
\advance\@tempcnta by -\number\topmargin
\divide\@tempcnta by \unitlength
\Put(-16,\the\@tempcnta){$\triangleleft$}

%% 氏名，現住所などのプロファイル
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
\Put(88,24){\makebox(12,16)[tl]{\tiny 印}}
\Put(88,7){\makebox(12,5)[c]{\scriptsize\sexname\hskip 1ex\@sex}}

\Put(0,34){\makebox(100,10)[l]{\scriptsize\hspace{1ex}\birthdayname}}
\Put(0,34){\makebox(100,10)[r]{\@birthday\hskip 2em
    (満\hbox to 2em{\hfil\@age}歳)\hspace{1em}}}
\Put(0,34){\line(1,0){100}}

\Put(0,39){\dashbox{.5}(151,5)[l]{\hspace{1mm}\scriptsize\kananame}}
\Put(10,38){\makebox(0,0)[lb]{\hskip 1zw\scriptsize\kana@address}}
\Put(1,40){\makebox(0,0)[tl]{\scriptsize\addressname}}
\Put(12,40){\makebox(0,0)[lt]{\small 〒 \@postalcode}}
\Put(0,48){\makebox(148,5)[cb]{\@address}}
\Put(0,50){\line(1,0){151}}
\Put(1,51){\makebox(0,0)[tl]{\scriptsize\contactname}}
\Put(0,58){\makebox(151,8)[bl]{\@phone\@email}}
\Put(0,59){\line(1,0){151}}
\Put(0,64){\dashbox{.5}(151,5)[l]{\hspace{1mm}\scriptsize\kananame}}
\Put(10,63){\makebox(0,0)[lb]{\hskip 1zw\scriptsize\kana@anotheraddress}}
\Put(1,65){\makebox(0,0)[tl]{\scriptsize\anotheraddressname}}
\Put(12,65){\makebox(0,0)[lt]{\small 〒 \@anotherpostalcode}}
\Put(0,73){\makebox(151,8)[cb]{\@anotheraddress}}
\Put(0,75){\line(1,0){151}}
\Put(1,76){\makebox(0,0)[tl]{\scriptsize\contactname}}
\Put(0,82){\makebox(151,8)[bl]{\@anotherphone}}

%% 学歴・職歴
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
\Put(0,5){\makebox(17,5)[c]{\scriptsize 年}}
\Put(17,5){\makebox(9,5)[c]{\scriptsize 月}}
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

%% 右ページ
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

%% 免許・資格
\MoveTo(0,0)
\thinlines
\Put(0,75){\dashbox{.5}(17,75){}}
\Put(26,0){\line(0,-1){75}}
\Put(0,5){\makebox(17,5)[c]{\scriptsize 年}}
\Put(17,5){\makebox(9,5)[c]{\scriptsize 月}}
\Put(26,5){\makebox(125,5)[c]{\scriptsize\licensename}}
\Put(0,5){\line(1,0){151}}
\@tempcnta=12
\@whilenum\@tempcnta<82\do{
  \Put(0,\@tempcnta){\line(1,0){151}}
  \advance\@tempcnta by 7
}
\@starttoc{lol}

%% 得意科目
\Put(75,75){\line(0,-1){58}}
\Put(1,104){\makebox(75,28)[lt]{\scriptsize\subjectname}}
\Put(1,104){\makebox(75,24){\@subject}}
%% 自己分析
\Put(76,104){\makebox(75,28)[lt]{\scriptsize\selfintroname}}
\Put(76,104){\makebox(75,24)[c]{\@selfintro}}
\Put(0,104){\line(1,0){151}}
%% 趣味
\Put(1,133){\makebox(75,28)[lt]{\scriptsize\hobbyname}}
\Put(1,133){\makebox(75,24){\@hobby}}
%% 特技
\Put(76,133){\makebox(75,28)[lt]{\scriptsize\profname}}
\Put(76,133){\makebox(75,24){\@prof}}
\Put(0,133){\line(1,0){151}}
%% 動機
\Put(1,163){\makebox(150,29)[lt]{\scriptsize\motivename}}
\Put(1,163){\makebox(150,24){\@motive}}
%% 本人希望
\Put(1,191){\makebox(150,27)[tl]{\scriptsize\wishname}}
\Put(1,191){\makebox(150,22){\@wish}}
%% 通勤字間
\Put(1,200){\makebox(47,8)[lt]{\scriptsize\commutename}}
\Put(1,200){\makebox(45,8)[r]{\@commute}}
\Put(48,191){\line(0,-1){9}}
%% 扶養家族
\Put(49,200){\makebox(34,8)[lt]{\scriptsize\dependentsname}}
\Put(49,200){\makebox(31,8)[r]{\@dependents}}
\Put(84,191){\line(0,-1){9}}
%% 配偶者
\Put(85,200){\makebox(34,8)[lt]{\scriptsize\matename}}
\Put(85,200){\makebox(31,8)[r]{\@mate}}
\Put(117,191){\line(0,-1){9}}
%% 配偶者の扶養義務
\Put(118,200){\makebox(33,8)[lt]{\scriptsize\matedependencename}}
\Put(118,200){\makebox(32,8)[r]{\@matedependence}}
%% 保護者
\Put(0,208){\dashbox{.5}(125,8){}}
\Put(1,208){\makebox(124,7)[lt]{\scriptsize\guardianname}}
\Put(1,207){\makebox(124,7)[lb]{\scriptsize\kananame}}
\Put(35,208){\line(0,-1){14}}
\Put(1,222){\makebox(34,13)[lt]{\scriptsize\namename}}
\Put(35,222){\makebox(91,13)[lt]{\small 〒 \@guardianpostalcode}}
\Put(1,222){\makebox(0,0)[lt]{\@guardian}}
\Put(125,200){\line(0,-1){22}}
\Put(126,222){\makebox(25,21)[lt]{\scriptsize\contactname}}
\Put(126,222){\makebox(25,16)[lt]{\@guardianphone}}
\end{picture}
}

%% 履歴書 作成日
\renewcommand{\@date}{\today}
\renewcommand{\date}[1]{\def\@date{#1}}

%% 姓
\newcommand\@surname\@empty
\newcommand\kana@surname\@empty
\newcommand{\surname}{\@testopt\surn@me{}}
\def\surn@me[#1]#2{%
  \def\@surname{#2}
  \def\kana@surname{#1}
}

%% 名
\newcommand\@forename\@empty
\newcommand\kana@forename\@empty
\newcommand{\forename}{\@testopt{\foren@me}{}}
\def\foren@me[#1]#2{%
  \def\@forename{#2}
  \def\kana@forename{#1}
}

%% 現住所
\newcommand\@address\@empty
\newcommand\kana@address\@empty
\newcommand{\address}{\@testopt{\@ddress}{}}
\def\@ddress[#1]#2{%
  \def\@address{#2}
  \def\kana@address{#1}
}

%% 郵便番号
\newcommand\@postalcode\@empty
\newcommand{\postalcode}[1]{\def\@postalcode{#1}}

%% 電話番号
\newcommand\@phone\@empty
\newcommand{\phone}[1]{\def\@phone{\hskip 24pt\textsc{Tel}: #1}}

%% 電子メール
\newcommand\@email\@empty
\newcommand{\email}[1]{\def\@email{\hskip 24pt\textsc{Email}: \texttt{#1}}}

%% 連絡先住所
\newcommand\@anotheraddress\@empty
\newcommand\kana@anotheraddress\@empty
\newcommand{\anotheraddress}{\@testopt{\@nother@ddress}{}}
\def\@nother@ddress[#1]#2{%
  \def\@anotheraddress{#2}
  \def\kana@anotheraddress{#1}
}

%% 連絡先郵便番号
\newcommand\@anotherpostalcode\@empty
\newcommand{\anotherpostalcode}[1]{\def\@anotherpostalcode{#1}}

%% 連絡先電話番号
\newcommand\@anotherphone\@empty
\newcommand{\anotherphone}[1]{\def\@anotherphone{\hskip 24pt\textsc{Tel}: #1}}

%% 生年月日
\newcommand{\@birthday}{}
\newcommand{\birthday}[3]{\def\@birthday{#1年#2月#3日生}}

%% 年齢
\newcommand{\@age}{??}
\newcommand{\age}[1]{\def\@age{#1}}

%% 性別
\newcommand{\@sex}{??}
\newcommand{\sex}[1]{\def\@sex{#1}}

%% 得意科目
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\long\def\@subject{\parbox{72mm}{#1}}}

%% 自己分析
\newcommand{\@selfintro}{}
\newcommand{\selfintro}[1]{\long\def\@selfintro{\parbox{72mm}{#1}}}

%% 趣味
\newcommand{\@hobby}{}
\newcommand{\hobby}[1]{\long\def\@hobby{\parbox{72mm}{#1}}}

%% 特技
\newcommand{\@prof}{}
\newcommand{\prof}[1]{\long\def\@prof{\parbox{72mm}{#1}}}

%% 志望動機
\newcommand{\@motive}{}
\newcommand{\motive}[1]{\long\def\@motive{\parbox{145mm}{#1}}}

%% 本人希望
\newcommand{\@wish}{}
\newcommand{\wish}[1]{\long\def\@wish{\parbox{72mm}{#1}}}

%% 通勤時間
\newcommand{\@commute}{}
\newcommand{\commute}[1]{\def\@commute{#1}}

%% 扶養家族
\newcommand{\@dependents}{}
\newcommand{\dependents}[1]{\def\@dependents{#1}}

%% 配偶者
\newcommand{\@mate}{}
\newcommand{\mate}[1]{\def\@mate{#1}}

%% 配偶者の扶養義務
\newcommand{\@matedependence}{}
\newcommand{\matedependence}[1]{\def\@matedependence{#1}}

%% 保護者
\newcommand{\@guardian}{}
\newcommand{\guardian}[1]{\def\@guardian{#1}}

%% 保護者郵便番号
\newcommand{\@guardianpostalcode}{}
\newcommand{\guardianpostalcode}[1]{\def\@guardianpostalcode{#1}}

%% 保護者住所
\newcommand{\@guardianaddress}{}
\newcommand{\guardianaddress}[1]{\def\@guardianaddress{#1}}

%% 保護者電話番号
\newcommand{\@guardianphone}{}
\newcommand{\guardianphone}[1]{\def\@guardianphone{#1}}

%% リスト出力用コマンド
%% #1: y 座標
%% #2: 年
%% #3: 月
%% #4: 内容
\newcommand{\PutListEntry}[4]{
  \Put(0,#1){\makebox(17,7)[c]{#2}}
  \Put(17,#1){\makebox(9,7)[c]{#3}}
  \Put(28,#1){\makebox(121,7)[l]{#4}}
}

%% 学歴リスト追加
\newcounter{@b}\setcounter{@b}{5}
\newcommand{\background}[3]{%
  \addtocounter{@b}{7}
  \addtocontents{lob}{\protect\PutListEntry{\the@b}{#1}{#2}{#3}}
}

%% 職歴リスト追加
\newcounter{@c}\setcounter{@c}{0}
\newif\if@career
\@careertrue
\newcommand{\career}[3]{%
  \@careerfalse
  \addtocounter{@c}{7}
  \addtocontents{loc}{\protect\PutListEntry{\the@c}{#1}{#2}{#3}}
}

%% 資格・免許リスト追加
\newcounter{@l}\setcounter{@l}{5}
\newcommand{\license}[3]{%
  \addtocounter{@l}{7}
  \addtocontents{lol}{\protect\PutListEntry{\the@l}{#1}{#2}{#3}}
}

%% エイリアスの定義
\let\姓=\surname\relax
\let\名=\forename\relax
\let\性別=\sex\relax
\let\年令=\age\relax
\let\年齢=\age\relax
\let\生年月日=\birthday\relax
\let\誕生日=\birthday\relax
\let\郵便番号\postalcode\relax
\let\現住所=\address\relax
\let\電話番号=\phone\relax
\def\メール{\email}
\def\電子メール{\email}
\let\連絡先郵便番号\anotherpostalcode\relax
\let\連絡先住所=\anotheraddress\relax
\let\連絡先電話番号=\anotherphone\relax
\let\学歴=\background\relax
\let\職歴=\career\relax
\let\資格=\license\relax
\let\免許=\license\relax
\let\licence=\license\relax
\let\得意科目=\subject\relax
\let\自己分析=\selfintro\relax
\let\趣味=\hobby\relax
\let\特技=\prof\relax
\let\動機=\motive\relax
\let\志望動機=\motive\relax
\let\希望=\wish\relax
\let\本人希望=\wish\relax
\let\通勤時間=\commute\relax
\let\扶養家族=\dependents\relax
\let\配偶者=\mate\relax
\let\配偶者扶養義務=\matedependence\relax
\let\保護者=\guardian\relax
\let\保護者郵便番号\guardianpostalcode\relax
\let\保護者住所=\guardianaddress\relax
\let\保護者電話番号=\guardianphone\relax

%% 項目名
\newcommand{\historyname}{履歴書}
\newcommand{\namename}{氏~~名}
\newcommand{\kananame}{ふりがな}
\newcommand{\addressname}{現~住~所}
\newcommand{\anotheraddressname}{連~絡~先}
\newcommand{\contactname}{電話など}
\newcommand{\birthdayname}{生年月日}
\newcommand{\sexname}{性別}
\newcommand{\backgroundname}{学歴・職歴}
\newcommand{\licensename}{免許・資格}
\newcommand{\subjectname}{得意な科目・分野}
\newcommand{\selfintroname}{自己分析 (性格・特徴・PR など)}
\newcommand{\hobbyname}{趣味・スポーツ・サークルなど}
\newcommand{\profname}{特技など}
\newcommand{\motivename}{志望の動機}
\newcommand{\wishname}{本人希望記入欄 (特に給料・職種・勤務時間・勤務地・
  その他についての希望などがあれば記入)}
\newcommand{\guardianname}{保護者 (本人が未成年の場合のみ記入)}
\newcommand{\commutename}{通勤時間}
\newcommand{\dependentsname}{扶養家族数}
\newcommand{\matename}{配偶者}
\newcommand{\matedependencename}{配偶者の扶養義務}

%% フック コマンドの登録
\AtBeginDocument{\pagestyle{empty}}
\AtBeginDocument{\background{}{}{\textbf{\hfil 学歴}}}
\AtBeginDocument{\career{}{}{\textbf{\hfil 職歴}}\@careertrue}

\AtEndDocument{\addtocontents{lob}{\protect\RMoveTo(0,\the@b)}}
\AtEndDocument{\if@career\career{}{}{\hfil なし}\fi}
\AtEndDocument{\career{}{}{\hfill 以上\hspace{2em}}}
\AtEndDocument{\addtocontents{loc}{\protect\RMoveTo(0,-\the@b)}}
\AtEndDocument{\@makehistory}

\endinput
