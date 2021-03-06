%%=============================================================================
%% xmu-thesis-grd.cls for Xiamen University Graduate Thesis
%% modified by Maozhong Fu
%% Version: 1.0
%% Last update: 2020/09/30
%% Based on BIT-thesis at https://github.com/BIT-thesis/LaTeX-template
%%==============================================================================

%% math packages -- conflict with xunicode
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
\RequirePackage{upgreek} % 直立希腊字母字体

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{xmu-thesis-grd}[2020/09/30 v1.0 xmu-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifxmu@master\xmu@masterfalse
\newif\ifxmu@doctor\xmu@doctorfalse
\newif\ifxmu@istwoside\xmu@istwosidefalse
\DeclareOption{twoside}{\xmu@istwosidetrue}
\DeclareOption{master}{\xmu@mastertrue}
\DeclareOption{doctor}{\xmu@doctortrue}

\ProcessOptions\relax
\ifxmu@istwoside
	\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
	\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

\let\songti\relax
\let\heiti\relax
\let\kaishu\relax
\newCJKfontfamily\songti{SimSun}[AutoFakeSlant,AutoFakeBold]
\newCJKfontfamily\kaishu{KaiTi}[AutoFakeSlant,AutoFakeBold]
\newCJKfontfamily\heiti{SimHei}[AutoFakeSlant,AutoFakeBold]

%% 论文原创性和论文著作权使用声明内容
\def\xmu@label@originalitytitle{厦门大学学位论文原创性声明}
\def\xmu@label@authorsign{声明人~~~~（签名）：}
\def\xmu@label@supervisorsign{指导教师（签名）：}
\def\xmu@label@authorsignnew{声明人（签名）：}
\def\xmu@label@signdate{~~~~~~~~年~~~~月~~~~日}
\def\xmu@label@originalitycontent{本人呈交的学位论文是本人在导师指导下,独立完成的研究成果。本人在论文写作中参考其他个人或集体已经发表的研究成果，均在文中以适当方式明确标明，并符合法律规范和《厦门大学研究生学术活动规范（试行）》。\par
	另外，该学位论文为（~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~）课题（组）的研究成果，获得（~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~）课题（组）经费或实验室的资助，在（~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~）实验室完成。（请在以上括号内填写课题或课题组负责人或实验室名称，未有此项声明内容的，可以不作特别声明。）\par
	本人声明该学位论文不存在剽窃、抄袭等学术不端行为，并愿意承担因学术不端行为所带来的一切后果和法律责任。
}
\def\xmu@label@copyrighttitle{厦门大学学位论文著作权使用声明}
\def\xmu@label@copyrightcontent{本人同意厦门大学根据《中华人民共和国学位条例暂行实施办法》等规定保留和使用此学位论文，并向主管部门或其指定机构送交学位论文（包括纸质版和电子版），允许学位论文进入厦门大学图书馆及其数据库被查阅、借阅。本人同意厦门大学将学位论文加入全国博士、硕士学位论文共建单位数据库进行检索，将学位论文的标题和摘要汇编出版，采用影印、缩印或者其它方式合理复制学位论文。\par
	本学位论文属于：\par
	（\hspace{5em}）1.经厦门大学保密委员会审查核定的涉密学位论文，于~~~~~~~~年~~~~月~~~~日解密，解密后适用上述授权。\par
	（\hspace{5em}）2.不涉密，适用上述授权。\par
	（请在以上相应括号内打“√”或填上相应内容。涉密学位论文应是已经厦门大学保密委员会审定过的学位论文，未经厦门大学保密委员会审定的学位论文均为公开学位论文。此声明栏不填写的，默认为公开学位论文，均适用上述授权。）
}

%% 定义一些标签 
\def\xmu@label@abstract{摘~~要}
\def\xmu@label@compactabstract{摘要}
\def\xmu@label@enabstract{Abstract}
\def\xmu@label@keywords{关键词：}
\def\xmu@label@enkeywords{Key Words:~}
\def\xmu@label@appendix{附录}
\def\xmu@label@enappendix{Appendix}
\def\xmu@label@publications{攻读博士学位期间的科研成果}
\def\xmu@label@enpublications{Publications}
\def\xmu@label@projects{攻读博士学位期间参与的项目清单}
\def\xmu@label@enprojects{Projects}
\def\xmu@label@reference{参考文献}
\def\xmu@label@enreference{Reference}
\def\xmu@label@acknowledgements{致~~谢}
\def\xmu@label@compactacknowledgements{致谢}
\def\xmu@label@enacknowledgements{Acknowledgement}
\def\xmu@label@notations{符号说明}
\def\xmu@label@ennotations{Notations}
\def\xmu@label@content{目~~录}
\def\xmu@label@encontent{Contents}
\def\xmu@label@listoffigures{图索引}
\def\xmu@label@enlistoffigures{List of Figures}
\def\xmu@label@listoftables{表索引}
\def\xmu@label@enlistoftables{List of Tables}

\def\xmu@value@templateversion{v1.0}

%% the setup of ctex package
\def\contentsname{\xmu@label@content}
\def\encontentsname{\xmu@label@encontent}
\def\listfigurename{\xmu@label@listoffigures}
\def\listtablename{\xmu@label@listoftables}

%% 当前模板的版本
\newcommand{\version}{\xmu@value@templateversion}

%% 页面设置。设置纸张类型、页面边距和页眉、页脚
\RequirePackage[%
	paper=a4paper,%
	top=3.5cm,% 上 3.5cm %
	bottom=2.5cm,% 下 2.5cm %
	left=2.7cm,% 左 2.7cm %
	right=2.7cm,% 右 2.7cm %
	headheight=1.0cm,% 页眉 2.5cm %
	footskip=0.7cm% 页脚 1.8cm %
]{geometry}

%% 设置段落间距
\parskip 0.5ex plus 0.25ex minus 0.25ex

%% 删掉偶数页
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
			\thispagestyle{empty}%
			\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% 设置行距，大概为22榜
\RequirePackage{setspace}
\setstretch{1.523}

%% 设置章节格式, 黑体三号加粗居中，行距22磅，与正文或节标题的间距设定为段后间距1行。章序号与章名间空一格。
\ctexset{chapter={
	  name = {第,章},
	  number = {\arabic{chapter}},
	  format = {\bfseries \heiti \centering \zihao{-3}},
	  pagestyle = {xmu@headings},
	  beforeskip = 16 bp,
	  afterskip = 32 bp,
	  fixskip = true,
	 }
}

%% 设置一级章节格式
% 黑体四号加粗顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。
\ctexset{section={
	  format={\raggedright \bfseries \heiti \zihao{4}},
	  beforeskip = 28bp plus 1ex minus .2ex,
	  afterskip = 24bp plus .2ex,
	  fixskip = true,
	 }
}

%% 设置二级标题格式
% 黑体小四加粗顶左，行距22磅，与上一节的间距为1行，与下面正文或节标题的段间间距为0.5行。序号与题目间空一格。 
\ctexset{subsection={
			format = {\bfseries \heiti \raggedright \zihao{-4}},
			beforeskip =28bp plus 1ex minus .2ex,
			afterskip = 24bp plus .2ex,
			fixskip = true,
		}
}

%% 设置三节标题格式
\ctexset{subsubsection={
			format={\heiti \raggedright \zihao{-4}},
			beforeskip=28bp plus 1ex minus .2ex,
			afterskip=24bp plus .2ex,
			fixskip=true,
		}
}

%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% fancyhdr 页眉页脚控制
\RequirePackage{fancyhdr}

\let\xmu@cleardoublepage\cleardoublepage
\newcommand{\xmu@clearemptydoublepage}{ % 对于 openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。
	\clearpage{\pagestyle{xmu@empty}\xmu@cleardoublepage}}
\let\cleardoublepage\xmu@clearemptydoublepage

\renewcommand{\frontmatter}{ % 修改 frontmatter 的页码为大写罗马格式，并调整页面风格
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{xmu@headings}
}

\renewcommand{\mainmatter}{ % 修改 mainmatter 的页码为阿拉伯格式，并调整页面风格
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{xmu@headings}
}

%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}}

\theoremstyle{plain}
\newtheorem{algo}{算法~}[chapter]
\newtheorem{thm}{定理~}[chapter]
\newtheorem{lem}[thm]{引理~}
\newtheorem{prop}[thm]{命题~}
\newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
\newtheorem{defn}{定义~}[chapter]
\newtheorem{conj}{猜想~}[chapter]
\newtheorem{exmp}{例~}[chapter]
\newtheorem{rem}{注~}
\newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%% 英文字体使用 Times New Roman
\RequirePackage{xltxtra} % \XeTeX Logo
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

%% graphics packages
\RequirePackage{graphicx}

%% 并列子图
\RequirePackage{subfigure}
\RequirePackage{wrapfig}

%% 设置图表标题选项
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{：}
\DeclareCaptionFont{captionfont}{\bfseries \songti \zihao{-4}}
\captionsetup{
	font = {captionfont},
	labelsep = zhspace,
}
\captionsetup[table]{
	position = top,
	aboveskip = 6bp,
	belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
	position = bottom,
	aboveskip = 6bp,
	belowskip = 6bp,
}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

%% 引用文献序号的排序与压缩
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} % 上标引用

%% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%% 定公式、图、表编号格式
\renewcommand\theequation{\arabic{equation}}
\renewcommand\thefigure{\arabic{figure}}
\renewcommand\thetable{\arabic{table}}

%% 颜色宏包
\RequirePackage{xcolor}

%% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%% 设置源代码显示格式
\RequirePackage{listings}
\lstset{tabsize=4, %
	frame=shadowbox, %把代码用带有阴影的框圈起来
	commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
	rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
	keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
	showstringspaces=false,%不显示代码字符串中间的空格标记
	stringstyle=\ttfamily, % 代码字符串的特殊格式
	keepspaces=true, %
	breakindent=22pt, %
	numbers=left,%左侧显示行号
	stepnumber=1,%
	numberstyle=\tiny, %行号字体用小号
	basicstyle=\footnotesize, %
	showspaces=false, %
	flexiblecolumns=true, %
	breaklines=true, %对过长的代码自动换行
	breakautoindent=true,%
	breakindent=4em, %
	aboveskip=1em, %代码块边框
	%% added by http://bbs.ctex.org/viewthread.php?tid=53451
	fontadjust,
	captionpos=t,
	framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
	xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
	texcl=true,
	% 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
	extendedchars=false,columns=flexible,mathescape=true
	numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头

%% hyperref package
\definecolor{navyblue}{RGB}{0,0,128}
\RequirePackage{hyperref}
\hypersetup{
	bookmarksnumbered,%
	linktoc=all,
	colorlinks=true,
	citecolor=navyblue,
	filecolor=cyan,
	linkcolor=navyblue,
	linkbordercolor=navyblue,
	urlcolor=navyblue,
	plainpages=false,%
	pdfstartview=FitH
}

%% enumerate 列表环境间距调节
\RequirePackage{enumitem}

%% 参考文献风格
\bibliographystyle{reference/GBT7714-2005NLang}

%% 封面标签
\def\xmu@label@schoolserialnumber{学校编码：}
\def\xmu@label@studentnumber{学~~~~~~~~号：}
\def\xmu@label@advisor{指导教师姓名：}
\def\xmu@label@major{专~~业~~~~名~~称：}
\def\xmu@label@submitdate{论文提交日期：}
\def\xmu@label@defenddate{论文答辩日期：}
\def\xmu@label@grantdate{学位授予日期：}

%% 封面内容
\def\xmu@value@schoolserialnumber{10384}
\def\xmu@value@studentnumber{200215001}
\ifxmu@master
	\def\xmu@value@thesistype{硕~~~~士~~~~学~~~~位~~~~论~~~~文}
\else 
	\def\xmu@value@thesistype{博~~~~士~~~~学~~~~位~~~~论~~~~文}
\fi
\def\xmu@value@title{资产重组：一个资不抵债国有企业的最佳选择}
\def\xmu@value@entitle{Capital Reorganization: The Best Choice for A State-Owned Enterprise with Financial Crisis}
\def\xmu@value@author{作者姓名}
\def\xmu@value@advisor{XXXX教授}
\def\xmu@value@major{信息与信号处理}
\def\xmu@value@submitdate{~~~~年~~~~月}
\def\xmu@value@defenddate{~~~~年~~~~月}
\def\xmu@value@grantdate{~~~~年~~~~月}
\def\xmu@value@printdate{~~~~年~~~~月}

%% 设置封面内容的命令
\newcommand\schoolserialnumber[1]{\def\xmu@value@schoolserialnumber{#1}}
\newcommand\studentnumber[1]{\def\xmu@value@studentnumber{#1}}
\renewcommand\title[2][\xmu@value@title]{
	\def\xmu@value@title{#2}
	\def\xmu@value@titlemark{\MakeUppercase{#1}}}
\newcommand\entitle[2][\xmu@value@entitle]{
	\def\xmu@value@entitle{#2}
	\def\xmu@value@entitlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\xmu@value@author{#1}}
\newcommand\advisor[1]{\def\xmu@value@advisor{#1}}
\newcommand\major[1]{\def\xmu@value@major{#1}}
\newcommand\submitdate[1]{\def\xmu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\xmu@value@defenddate{#1}}
\newcommand\grantdate[1]{\def\xmu@value@grantdate{#1}}
\newcommand\printdate[1]{\def\xmu@value@printdate{#1}}

%% 绘制封面
\newcommand\makecover{
\newpage
\cleardoublepage
\thispagestyle{empty}

{\bfseries \songti \zihao{-4} \noindent \xmu@label@schoolserialnumber \xmu@value@schoolserialnumber}  \\
{\bfseries \songti \zihao{-4} \xmu@label@studentnumber \xmu@value@studentnumber}

\vskip 20pt

\begin{figure}[htb!]
	\centering
	\includegraphics[width=4.82cm]{figures/xmu-logo.pdf}
\end{figure}

\begin{center}
	{\bfseries \songti \zihao{2} \xmu@value@thesistype}
	\vskip 35pt
		{\bfseries \heiti \zihao{-2} \xmu@value@title}
	\vskip 15pt
		{\bfseries \zihao{3} \xmu@value@entitle}
	\vskip 55pt
		{\bfseries \kaishu \zihao{-2} \xmu@value@author}
	\vskip 30pt

		{\kaishu \zihao{-3}
			\begin{tabular}{r p{1mm} l}
				\xmu@label@advisor    &  & \xmu@value@advisor
				\\
				\xmu@label@major      &  & \xmu@value@major
				\\
				\xmu@label@submitdate &  & \xmu@value@submitdate
				\\
				\xmu@label@defenddate &  & \xmu@value@defenddate
				\\
				\xmu@label@grantdate  &  & \xmu@value@grantdate
			\end{tabular}}

	\vskip 100pt
		{\bfseries \songti \zihao{-4} \xmu@value@printdate}
\end{center}

\vskip \stretch{0.5}
\clearpage
\if@twoside
	\thispagestyle{empty}
	\cleardoublepage
\fi
}

%% 绘制原创性声明
\newcommand\makeoriginalitystatement{
	\cleardoublepage
	\pdfbookmark[0]{原创性声明}{originality_statement}
	\thispagestyle{empty}
	\begin{center}
		{\bfseries \heiti \zihao{-2} \xmu@label@originalitytitle}
	\end{center}
	\vskip 10pt
		{\songti\zihao{4} \par \xmu@label@originalitycontent}
	\vskip 20pt
	\hspace{8cm}{\zihao{4}\xmu@label@authorsign\par}
	\hspace{8cm}{\zihao{4}\xmu@label@supervisorsign\par}
	\vskip 20pt
	\hspace{8.4cm} {\zihao{4}\xmu@label@signdate}

	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}

%% 论文著作权使用声明
\newcommand\makecopyrightstatement{
	\cleardoublepage
	\pdfbookmark[0]{著作权使用声明}{copyright_statement}
	\thispagestyle{empty}
	\begin{center}
		{\bfseries \heiti \zihao{-2} \xmu@label@copyrighttitle}
	\end{center}
	\vskip 10pt
		{\songti\zihao{4} \par \xmu@label@copyrightcontent}
	\vskip 20pt
	\hspace{8cm}{\zihao{4}\xmu@label@authorsignnew\par}
	\vskip 20pt
	\hspace{8.4cm} {\zihao{4}\xmu@label@signdate}

	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}

%% 页眉页脚
\pagestyle{fancy}
\fancyhf{}

%% 只有页脚无页眉
\fancypagestyle{plain}{ 
\fancyfoot[C]{\songti \zihao{5} {\thepage}} % 页脚格式
\fancyhead{}                                % 去掉页眉
\renewcommand{\headrulewidth}{0pt}          % 去掉页眉下面的横线
}

%% 无页眉页脚
\fancypagestyle{xmu@empty}{
	\fancyhf{}}

%% 正文页眉页脚
\fancypagestyle{xmu@headings}{
	\fancyhf{}
	\fancyfoot[C]{\songti\zihao{5} \thepage}

	\fancyhead[CO]{\zihao{5} \songti \leftmark}
	\fancyhead[CE]{\zihao{5} \songti {\xmu@value@title}}
}

%% 中文摘要
\newenvironment{abstract}{
	\cleardoublepage
	\chapter*{\xmu@label@abstract}
% 	\markboth{\xmu@label@compactabstract}{\xmu@label@compactabstract} % 页眉
	\addcontentsline{toc}{chapter}{\xmu@label@compactabstract}
	\addcontentsline{etoc}{chapter}{Chinese Abstract} %将中文摘要加入到英文目录中
	\thispagestyle{plain}
	\songti\zihao{-4}
}

%% 下一页从偶数页开始
\newcommand\beginatevenpage{
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}

%% 中文关键词
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bfseries\songti\zihao{-4}\xmu@label@keywords} #1}

%% 英文摘要
\newenvironment{enabstract}{
	\cleardoublepage
	\chapter{\xmu@label@enabstract}
	\addcontentsline{etoc}{chapter}{English Abstract} %将英文摘要加入到英文目录中
	\thispagestyle{plain}
	\zihao{-4}
}

%% 英文关键词
\newcommand\enkeywords[1]{\vspace{2ex}\noindent{\bfseries\zihao{-4}\xmu@label@enkeywords} #1}

%% 中文目录
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{etoc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\bfseries \heiti \zihao{4}}
{\thecontentslabel\hspace{\ccwd}}{\bfseries}
{\hspace{.5em}\titlerule*{.} \contentspage}
\titlecontents{section}[2\ccwd]{\bfseries \heiti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.} \contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.} \contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
{\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.} \contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
{\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.} \contentspage}

\renewcommand\tableofcontents{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\contentsname}
	\thispagestyle{plain}
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
	\pdfbookmark[0]{目录}{contents}
	\makeatletter
	\renewcommand{\@pnumwidth}{2em}% 1.55em
	\makeatother
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
}
\setcounter{secnumdepth}{4}  % 目录显示的章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)

%% 英文目录
\newcommand\enchapter[1]{\addcontentsline{etoc}{chapter}{\protect\numberline{\thechapter}#1}}
\newcommand\ensection[1]{\addcontentsline{etoc}{section}{\protect\numberline{\thesection}#1}}
\newcommand\ensubsection[1]{\addcontentsline{etoc}{subsection}{\protect\numberline{\thesubsection}#1}}
\newcommand\ensubsubsection[1]{\addcontentsline{etoc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}

\newcommand\entableofcontents{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\encontentsname}
	\thispagestyle{plain}
	\@mkboth{\MakeUppercase\encontentsname}{\MakeUppercase\encontentsname}%
	\pdfbookmark[0]{英文目录}{english_contents}
	\makeatletter
	\renewcommand{\@pnumwidth}{2em}% 1.55em
	\makeatother
	\@starttoc{etoc}%
	\if@restonecol\twocolumn\fi
}

%% 参考文献环境
\renewenvironment{thebibliography}[1]{
	\zihao{5}
	\chapter*{\bibname}
	\addcontentsline{etoc}{chapter}{\xmu@label@enreference}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
	\addcontentsline{toc}{chapter}{\xmu@label@reference}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{1mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{0.05pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}

%% 论文发表情况
\newenvironment{publications}[1]{
	\chapter{\xmu@label@publications}
	\addcontentsline{etoc}{chapter}{\xmu@label@enpublications}
	\@mkboth{\MakeUppercase\xmu@label@publications}
	{\MakeUppercase\xmu@label@publications}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{1mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{0.05pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `publications' environment}}%
	\endlist}

%% 项目参与情况
\newenvironment{projects}[1]{
	\chapter{\xmu@label@projects}%
	\addcontentsline{etoc}{chapter}{\xmu@label@enprojects}
	\@mkboth{\MakeUppercase\xmu@label@projects}
	{\MakeUppercase\xmu@label@projects}%
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
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `projects' environment}}%
	\endlist}

%% 致谢 
\newenvironment{acknowledgements}{
	\cleardoublepage
	\chapter*{\xmu@label@acknowledgements}
	\markboth{\xmu@label@compactacknowledgements}{\xmu@label@compactacknowledgements} % 页眉
	\addcontentsline{toc}{chapter}{\xmu@label@compactacknowledgements}
	\addcontentsline{etoc}{chapter}{\xmu@label@enacknowledgements}
	\songti
}

%% 符号
\newenvironment{notations}[1][2.5cm]{
	\cleardoublepage
	\chapter{\xmu@label@notations} % no tocline
	\addcontentsline{etoc}{chapter}{\xmu@label@ennotations}
	\thispagestyle{plain}
	\noindent\begin{list}{}%
		{\vskip-30bp\zihao{-4}
		\renewcommand\makelabel[1]{##1\hfil}
		\setlength{\labelwidth}{#1} % 标签盒子宽度
		\setlength{\labelsep}{0.5cm} % 标签与列表文本距离
		\setlength{\itemindent}{0cm} % 标签缩进量
		      \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
		      \setlength{\rightmargin}{0cm}
		      \setlength{\parsep}{0cm} % 段落间距
		      \setlength{\itemsep}{0cm} % 标签间距
		      \setlength{\listparindent}{0cm} % 段落缩进量
		      \setlength{\topsep}{0pt} % 标签与上文的间距
		      }}{\end{list}}

% 图索引
\newcommand\makelistoffigures{
	\cleardoublepage
	\makeatletter
	\renewcommand{\@pnumwidth}{1.55em}% 1.55em
	\makeatother
	\listoffigures
	\addcontentsline{toc}{chapter}{\listfigurename}
	\addcontentsline{etoc}{chapter}{\xmu@label@enlistoffigures}
	\thispagestyle{plain}
}

% 表索引
\newcommand\makelistoftables{
	\cleardoublepage
	\makeatletter
	\renewcommand{\@pnumwidth}{1.55em}% 1.55em
	\makeatother
	\listoftables
	\addcontentsline{toc}{chapter}{\listtablename}
	\addcontentsline{etoc}{chapter}{\xmu@label@enlistoftables}
	\thispagestyle{plain}
}

%% 单位宏包
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}

%% 附录编号样式
\newcommand\setappendixnumberformat{
	\renewcommand\theequation{\Alph{chapter}--\arabic{equation}}  % 附录中编号形式是"A-1"的样子
	\renewcommand\thefigure{\Alph{chapter}--\arabic{figure}}
	\renewcommand\thetable{\Alph{chapter}--\arabic{table}}
}

\endinput
