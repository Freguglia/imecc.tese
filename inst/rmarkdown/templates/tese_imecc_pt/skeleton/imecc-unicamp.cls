%% Customizacoes do abnTeX2 (http://www.abntex.net.br) para
%% o Instituto de Matematica, Estatistica e Computacao Cientifica
%% da Universidade Estadual de Campinas (IMECC-UNICAMP)
%%
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version. The latest version of this
%% license is in http://www.latex-project.org/lppl.txt and version 1.3
%% or later is part of all distributions of LaTeX version 2005/12/01
%% or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Fabio Rodrigues Silva,
%% silvafr@ime.unicamp.br and gfabinhomat@gmail.com
%%
%% Further information about abnTeX2 are available on http://www.abntex.net.br

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imecc-unicamp}[2017/01/01 v1.0 Modelo do Instituto de%
Matematica, Estatistica e Computacao Cientifica da Universidade %
Estadual de Campinas baseado em abnTeX2]

% Repassa todos os parametros para a classe abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass{abntex2}

% ----------------------------------------------------
% INICIO DAS ALTERAÇÕES PARA O IMECC -- UNICAMP
% ----------------------------------------------------
% ---
% Pacotes requeridos
% ---
\RequirePackage[utf8]{inputenc}
\RequirePackage{tikz}
% ---

% ---
% Dados Gerais
% ---
\renewcommand{\orientadorname}{Orientador}
\renewcommand{\coorientadorname}{Coorientador}
\newcommand{\primeirafolhaname}{Primeira folha}
\newcommand{\fichacatalograficaname}{Ficha catalográfica}
% ---
\addto\captionsenglish{
    \renewcommand{\orientadorname}{Supervisor}
    \renewcommand{\coorientadorname}{Co-supervisor}
    \renewcommand{\primeirafolhaname}{First page}
    \renewcommand{\fichacatalograficaname}{Catalographic data}
}
% ---

% ---
% Instruções de bookmark para Primeira Folha
% ---
\newenvironment{primeirafolha}[1][]{%
    \PRIVATEbookmarkthis{\primeirafolhaname}
}{\PRIVATEclearpageifneeded}
% ---

% ---
% Instruções de bookmark para Ficha Catalográfica
% ---
\renewenvironment{fichacatalografica}[1][]{%
    \thispagestyle{empty}
    \PRIVATEbookmarkthis{\fichacatalograficaname}
    \begin{SingleSpacing}
      \ABNTEXfontereduzida
}{\end{SingleSpacing}}
% ---

% ----------------------------------
% COMANDOS DE DADOS
% ----------------------------------
% Comandos de dados - título em outra língua
\providecommand{\imprimirtitulootherlang}{}
\newcommand{\titulootherlang}[1]{%
    \renewcommand{\imprimirtitulootherlang}{#1}}
%
% Comandos de dados - titulação em outra língua
\providecommand{\imprimirtitulation}{}
\newcommand{\titulation}[1]{%
    \renewcommand{\imprimirtitulation}{#1}}
%
% Comandos de dados - curso em outra língua
\providecommand{\imprimircursootherlang}{}
\newcommand{\cursootherlang}[1]{%
    \renewcommand{\imprimircursootherlang}{#1}}
%
% Comandos de dados - trabalho em outra língua
\providecommand{\imprimirtypework}{}
\newcommand{\typework}[1]{%
    \renewcommand{\imprimirtypework}{#1}}
%
\providecommand{\imprimiruniversidadecotutela}{}
\newcommand{\universidadecotutela}[1]{%
    \renewcommand{\imprimiruniversidadecotutela}{#1}}
%
\providecommand{\imprimirpaiscotutela}{}
\newcommand{\paiscotutela}[1]{%
    \renewcommand{\imprimirpaiscotutela}{#1}}
% Comandos de dados - titulação
\providecommand{\imprimirtitulacao}{}
\newcommand{\titulacao}[1]{%
    \renewcommand{\imprimirtitulacao}{#1}}
%
% Comandos de dados - curso
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}
%
% Comandos de dados - autor (use \and para multiplos autores)
\providecommand{\sexo}{}
\renewcommand{\autor}[2][\theauthor]{
  \author{#2}%
  \renewcommand{\sexo}{#1}}
%
\newboolean{ABNTEXotherlanguage}
\newboolean{ABNTEXcotutela}
\setboolean{ABNTEXotherlanguage}{false}
\setboolean{ABNTEXcotutela}{false}
%
\definecolor{unicampred}{cmyk}{0,1,1,0}
% ----------------------------------

% ---
% Definicoes compartilhadas entre Apendices e Anexos
% ---
\renewcommand{\PRIVATEapendiceconfig}[2]{%
 \setboolean{abntex@apendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
   \renewcommand{\appendixtocname}{\texorpdfstring{\uppercase{#2}}{#2}}
  }{%
  \renewcommand{\appendixtocname}{#2}} 
 \renewcommand{\appendixpagename}{#2}
 \switchchapname{#1}% Corrected from \switchapname -> \switchchapname
 \renewcommand*{\cftappendixname}{#1 \space}
}
% ---

% ---
% Ajusta entrada Referencias
% ---
\renewcommand{\bibsection}{%
   \chapter*{\bibname}
   \bibmark
   \ifnobibintoc\else
   \phantomsection
   \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\bibname}}{\bibname}}
   \fi
   \prebibhook
}
% ---

% ---
% Configuracoes para uso de algoritmos com 'algorithm2e'
% ---
\AtBeginDocument{%
    \@ifpackageloaded{algorithm2e}{%
	\SetAlgoCaptionSeparator{\space\textendash}%
	\setlength{\AlCapSkip}{0.5em}
	\renewcommand{\@algocf@capt@plain}{above}%
	\renewcommand{\algocf@caption@plain}{\box\algocf@capbox\vskip\AlCapSkip}%
	\renewcommand{\algorithmautorefname}{\algorithmcfname}%
	\renewcommand\l@algocf{\@dottedtocline{1}{0em}{7em}}%
	\long\def\algocf@latexcaption#1[#2]#3{% original definition of caption
	    \par%
	    \addcontentsline{\csname ext@#1\endcsname}{#1}%
	    {\protect\numberline{\algorithmcfname\space\csname the#1\endcsname\hfill\textendash\hfill}{\ignorespaces #2}}%
	    \begingroup%
		\@parboxrestore%
		\if@minipage%
		    \@setminipage%
		\fi%
		\normalsize%
		\@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par%
	    \endgroup%
	}%
	\renewcommand{\algocf@makecaption}[2]{%
	    \addtolength{\hsize}{\algomargin}%
	    \sbox\@tempboxa{\algocf@captiontext{#1}{#2}}%
	    \ifdim\wd\@tempboxa >\hsize%     % if caption is longer than a line
		\parbox[t]{0.21\hsize}{\algocf@captiontext{#1}{}}%     %\fnum@algocf
		\parbox[t]{0.8\hsize}{#2}%
	    \else%
		\global\@minipagefalse%
		\hbox to\hsize{\hfil\box\@tempboxa\hfil}% else caption is centered
	    \fi%
	    \addtolength{\hsize}{-\algomargin}%
	}%
    }{}%
}%
% ---

% ---
% Configuracoes para uso de codigos-fonte com 'listings'
% ---
\AtBeginDocument{%
  \@ifpackageloaded{listings}{%
    \renewcommand{\lstlistingname}{Código-fonte}%
    \renewcommand{\lstlistlistingname}{Lista de Códigos-fonte}%
    \addto\captionsenglish{%
      \renewcommand{\lstlistingname}{Source code}%
      \renewcommand{\lstlistlistingname}{List of Source Codes}%
    }%
    \lstset{numberbychapter=false,captionpos=t,xleftmargin=0pt}%
    \def\fnum@lstlisting{%
      \bfseries\lstlistingname
      \ifx\lst@@caption\@empty\else~\thelstlisting\fi
    }%
    \def\lst@MakeCaption#1{%
      \lst@ifdisplaystyle
        \ifx #1t%
          \ifx\lst@@caption\@empty\expandafter\lst@HRefStepCounter
          \else\expandafter\refstepcounter
          \fi {lstlisting}%
          \ifx\lst@label\@empty\else \label{\lst@label}\fi
          \let\lst@arg\lst@intname \lst@ReplaceIn\lst@arg\lst@filenamerpl
          \global\let\lst@name\lst@arg \global\let\lstname\lst@name
          \lst@ifnolol
          \else
            \ifx\lst@@caption\@empty
              \ifx\lst@caption\@empty
                \ifx\lst@intname\@empty
                \else
                  \def\lst@temp{ }%
                  \ifx\lst@intname\lst@temp
                  \else\addcontentsline{lol}{lstlisting}\lst@name
                  \fi
                \fi
              \fi
            \else
              \addcontentsline{lol}{lstlisting}{%
                \protect\numberline{{\fontfamily{lmr}\selectfont\lstlistingname\space\thelstlisting\hfill\textendash\hfill}}%
                {\fontfamily{lmr}\selectfont\lst@@caption}%
              }%
            \fi
          \fi
        \fi
        \ifx\lst@caption\@empty
        \else
          \lst@IfSubstring #1\lst@captionpos{
            \begingroup
              \let\@@vskip\vskip
              \def\vskip{\afterassignment\lst@vskip \@tempskipa}%
              \def\lst@vskip{\nobreak\@@vskip\@tempskipa\nobreak}%
              \par\@parboxrestore\normalsize\normalfont % \noindent (AS)
              \ifx #1t\allowbreak \fi
              \ifx\lst@title\@empty
                \lst@makecaption\fnum@lstlisting{\ignorespaces \lst@caption}
              \else
                \lst@maketitle\lst@title % (AS)
              \fi
              \ifx #1b\allowbreak \fi
            \endgroup
          }{}%
        \fi
      \fi
    }
    \renewcommand{\l@lstlisting}{\@dottedtocline{1}{0em}{8.3em}}%
  }{}%
}%
% ---

% ----------------------------------
% COMANDO PARA PRIMEIRA FOLHA
% ----------------------------------
\newcommand{\imprimirprimeirafolha}{%
  \begin{primeirafolha}%    
    \noindent%
    \begin{tikzpicture}[y=0.80pt,
                        x=0.80pt,
                        yscale=-1.000000,
                        xscale=1.000000,
                        inner sep=0pt,
                        outer sep=0pt,
                        even odd rule]
      \begin{scope}% Camada_x0020_1
        \begin{scope}% _90919680
          % _124851560
          \path[fill=black] (56.7685,45.7277) -- (56.7685,1.2062) .. controls (61.9201,1.3251) and
                            (67.0519,2.0582) .. (72.0449,3.4254) .. controls (71.5297,6.4767) and
                            (72.8374,9.5279) .. (75.3736,11.2914) -- (60.6322,46.5401) .. controls
                            (59.3641,46.1240) and (58.0762,45.8664) .. (56.7685,45.7277) -- cycle;
          
          % _124851488
          \path[fill=black] (52.8816,45.7277) -- (52.8816,1.2656) .. controls (45.8675,1.6222) and
                            (39.0120,3.3461) .. (32.6518,6.3379) -- (49.1369,46.5003) .. controls
                            (50.3455,46.1042) and (51.5938,45.8465) .. (52.8816,45.7277) -- cycle;
          
          % _124851416
          \path[fill=black] (46.1582,47.6186) -- (29.7525,7.6741) .. controls (23.4516,10.9039) and
                            (17.7652,15.2629) .. (13.0099,20.5135) -- (42.5323,50.0359) .. controls
                            (43.6419,49.1047) and (44.8505,48.2924) .. (46.1582,47.6186) -- cycle;
          
          % _124851344
          \path[fill=black] (10.9657,22.9313) .. controls (6.6265,28.0829) and (3.3375,34.0468) ..
                            (1.2966,40.4467) -- (37.9917,55.8024) .. controls (38.6256,54.5541) and
                            (39.4182,53.3652) .. (40.3297,52.2953) -- (10.9657,22.9313) -- cycle;
          
          % _124851272
          \path[fill=black] (36.7035,58.7543) -- (0.5237,43.6166) .. controls (-0.3086,50.0759) and
                            (-0.1500,56.6144) .. (0.9991,63.0142) -- (35.8515,63.0142) .. controls
                            (35.9704,61.5679) and (36.2676,60.1413) .. (36.7034,58.7544) -- cycle;
          
          % _124851200
          \path[fill=black] (35.8631,66.2129) -- (1.9024,66.2129) .. controls (3.9630,71.5627) and
                            (6.6379,76.6350) .. (9.8478,81.3704) -- (36.6755,70.3540) .. controls
                            (36.2594,69.0066) and (35.9821,67.6197) .. (35.8631,66.2129) -- cycle;
          
          % _124851128
          \path[fill=black] (40.3804,76.7181) .. controls (39.4293,75.6086) and (38.6170,74.4000) ..
                            (37.9631,73.0922) -- (12.0666,83.7124) .. controls (15.6726,87.2987) and
                            (19.6553,90.4491) .. (23.9350,93.1636) -- (40.3804,76.7181) -- cycle;
          
          % _124851056
          \path[fill=black] (60.9707,100.4600) .. controls (60.5942,97.3889) and (62.0009,94.3969) ..
                            (64.6164,92.7326) -- (60.5149,82.5880) .. controls (54.3132,84.5100) and
                            (47.5567,83.1428) .. (42.6033,78.9423) -- (26.7523,94.7932) .. controls
                            (37.2338,100.3610) and (49.2607,102.3621) .. (60.9707,100.4600) -- cycle;
          
          % _124850984
          \path[fill=black] (63.2818,81.4455) -- (67.4030,91.6694) .. controls (70.5931,91.1345) and
                            (73.7633,92.5809) .. (75.4672,95.3152) .. controls (77.2307,94.4830) and
                            (78.9742,93.6111) .. (80.6981,92.6997) -- (67.0068,78.9886) .. controls
                            (65.8576,79.9595) and (64.6093,80.7916) .. (63.2818,81.4455) -- cycle;
          
          % _124850912
          \path[fill=black] (112.5510,70.2050) .. controls (111.4018,69.0756) and (110.6093,67.6292) ..
                            (110.2922,66.0243) -- (73.6565,66.0243) .. controls (73.3395,69.9672) and
                            (71.7743,73.7120) .. (69.2381,76.7237) -- (83.6031,91.0886) .. controls
                            (94.0449,85.3029) and (103.7537,78.2889) .. (112.5509,70.2049) -- cycle;
          
          % _124850840
          \path[fill=black] (91.8559,14.9474) .. controls (93.5798,16.6712) and (95.1847,18.4941) ..
                            (96.6904,20.4159) -- (66.9699,50.1365) .. controls (65.8801,49.2251) and
                            (64.7112,48.4524) .. (63.4629,47.7985) -- (78.2043,12.5499) .. controls
                            (80.9386,13.1047) and (83.7719,12.1536) .. (85.6542,10.0731) .. controls
                            (87.8337,11.5393) and (89.9141,13.1839) .. (91.8559,14.9474) -- cycle;
          \begin{scope}% g3432
            % _124850768
            \path[fill=unicampred] (68.6872,99.5520) ellipse (0.1348cm and 0.1353cm);
            
            % _124850696
            \path[fill=unicampred] (119.0270,63.8342) circle (0.1353cm);
            
            % _124850624
            \path[fill=unicampred] (79.7374,4.7948) circle (0.1353cm);
          \end{scope}
          
          % _124850528
          \path[fill=black] (20.0002,138.9090) -- (20.0002,126.3270) -- (25.3896,126.3270) --
                            (32.7206,135.0060) -- (32.7206,126.4070) -- (36.4853,126.4070) --
                            (36.4853,138.9090) -- (30.7393,138.9090) -- (23.6856,130.6670) --
                            (23.6856,138.9090) -- cycle;
          
          % _124850456
          \path[fill=black] (39.6450,138.9090) -- (39.6450,126.2280) -- (43.1718,126.2280) --
                            (43.1718,138.9090) -- cycle;
          
          % _124850384
          \path[fill=black] (57.2938,134.2870) -- (60.8009,134.2870) -- (60.8009,135.9712) .. controls
                            (60.8009,137.7147) and (59.2950,139.0819) .. (57.5514,138.9036) --
                            (50.2600,138.9036) .. controls (48.4370,138.9036) and (46.9313,137.5364) ..
                            (46.7331,135.7334) -- (46.7331,129.3930) .. controls (46.7331,127.5107) and
                            (48.3777,126.0246) .. (50.2600,126.2228) -- (57.5514,126.2228) .. controls
                            (59.2355,126.2228) and (60.6424,127.4908) .. (60.8207,129.1552) --
                            (60.8207,130.8592) -- (57.2938,130.8592) .. controls (57.2740,130.0072) and
                            (56.5607,129.3533) .. (55.7088,129.3930) -- (52.0234,129.3930) .. controls
                            (51.0921,129.3533) and (50.2995,130.0666) .. (50.2600,130.9781) --
                            (50.2600,134.1483) .. controls (50.2995,135.0796) and (51.0921,135.7730) ..
                            (52.0234,135.7334) -- (55.7088,135.7334) .. controls (56.5409,135.7730) and
                            (57.2542,135.1389) .. (57.2938,134.2870) -- cycle;
          
          % _124850312
          \path[fill=black] (67.9041,136.9130) -- (67.0389,138.9319) -- (63.2895,138.9319) --
                            (68.4809,126.3858) -- (74.2492,126.3858) -- (79.5849,138.9319) --
                            (75.5471,138.9319) -- (74.9703,136.9130) -- (67.9041,136.9130) --
                            cycle(73.5282,133.8846) -- (69.2020,133.8846) -- (71.3651,128.5490) --
                            (73.5282,133.8846) -- cycle;
          
          % _124850240
          \path[fill=black] (86.0781,131.6610) -- (86.0781,138.8530) -- (82.5512,138.8530) --
                            (82.5512,126.1720) -- (86.6131,126.1720) -- (92.9733,136.0590) --
                            (98.8976,126.1720) -- (102.9000,126.1720) -- (102.9000,138.8530) --
                            (99.3731,138.8530) -- (99.3731,132.0570) -- (95.2914,138.8530) --
                            (90.6947,138.8530) -- cycle;
          
          % _124850168
          \path[fill=black] (106.1430,138.9090) -- (106.1430,126.0745) -- (117.2469,126.0745) .. controls
                            (118.9774,126.0745) and (120.2753,127.5166) .. (120.5637,129.2471) --
                            (120.5637,132.7081) .. controls (120.5637,134.4386) and (118.9774,136.0249) ..
                            (117.2469,136.0249) -- (109.8924,136.0249) -- (109.8924,138.9090) --
                            (106.1430,138.9090) -- cycle(109.8924,132.5639) -- (109.8924,129.3913) --
                            (115.5164,129.3913) .. controls (117.6795,129.3913) and (117.6795,132.5639) ..
                            (115.5164,132.5639) -- (109.8924,132.5639) -- cycle;
          
          % _124850096
          \path[fill=black] (4.5576,134.0770) -- (4.5576,126.1515) -- (1.0307,126.1515) --
                            (1.0307,135.8009) .. controls (1.0307,137.4850) and (2.3978,138.8323) ..
                            (4.0622,138.8323) -- (13.9493,138.8323) .. controls (15.6334,138.8323) and
                            (16.9808,137.4850) .. (16.9808,135.8009) -- (16.9808,126.2506) --
                            (13.4539,126.2506) -- (13.4539,134.0770) .. controls (13.4539,134.9488) and
                            (12.7407,135.6621) .. (11.8689,135.6621) -- (6.1427,135.6621) .. controls
                            (5.2709,135.6621) and (4.5576,134.9488) .. (4.5576,134.0770) -- cycle;
          
          % _124850024
          \path[fill=black] (107.8240,41.1055) .. controls (106.0408,36.8851) and (104.0791,32.7441) .. 
                            (101.9393,28.6822) .. controls (100.8495,26.7603) and (99.7003,24.8780) ..
                            (98.4917,23.0353) -- (69.1873,52.3399) .. controls (70.1185,53.4693) and
                            (70.9308,54.6779) .. (71.5847,55.9658) -- (107.8241,41.1055) -- cycle;
          
          % _124849952
          \path[fill=black](109.0850,44.0469) .. controls (110.8483,48.6238) and (112.4532,53.2800) .. 
                            (113.8403,57.9958) .. controls (112.0570,59.1252) and (110.7890,60.9480) ..
                            (110.3332,63.0284) -- (73.6778,63.0284) .. controls (73.5590,61.6217) and
                            (73.3014,60.2348) .. (72.8655,58.8874) -- (109.0851,44.0469) -- cycle;
        \end{scope}
      \end{scope}
    \end{tikzpicture}
            
    \center{\ABNTEXchapterfont\LARGE UNIVERSIDADE ESTADUAL DE\\ CAMPINAS}
    
    \vspace*{0.7cm}
    
    {\ABNTEXchapterfont\Large Instituto de Matemática, Estatística e\\ Computação Científica}
    
    \vspace*{2cm}

    {\ABNTEXchapterfont\large\MakeUppercase{\imprimirautor}}

    \vfill
    
    \begin{center}
	\ifthenelse{\boolean{ABNTEXotherlanguage}}{%
	    {\ABNTEXchapterfont\bfseries\LARGE\imprimirtitulootherlang}
	    
	    \vspace*{\fill}
	    
	    {\ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo}
	}{%
	    {\ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo}
	}
    \end{center}
    \vfill

    {\large Campinas}

    {\large\imprimirdata}

    \vspace*{1cm}
  \end{primeirafolha}
}
% ----------------------------------

% ----------------------------------
% COMANDO PARA FOLHA DE ROSTO
% ----------------------------------
\makeatletter
\renewcommand{\folhaderostocontent}{
    \begin{center}
	{\ABNTEXchapterfont\large\imprimirautor}
        
        \vspace*{\fill}
        
        \ifthenelse{\boolean{ABNTEXotherlanguage}}{%
	    \ABNTEXchapterfont\bfseries\Large\imprimirtitulootherlang
	    
	    \vspace*{\fill}
	    
	    \ABNTEXchapterfont\bfseries\Large\imprimirtitulo
	}{\ABNTEXchapterfont\bfseries\Large\imprimirtitulo}
    \end{center}
    
    \vspace*{\fill}
    
    \begin{flushright}
        \begin{minipage}[c]{.5\textwidth}
            \SingleSpacing
	    \ifthenelse{\boolean{ABNTEXotherlanguage}}{%
		\imprimirtipotrabalho\ apresentada ao Instituto de Matemática, Estatística %
		e Computação Científica da Universidade Estadual de Campinas como parte dos %
		requisitos exigidos para a obtenção do título de %
		\ifthenelse{\equal{\imprimircurso}{\empty}}%
		    {\imprimirtitulacao}%
		    {\imprimirtitulacao\ em \imprimircurso}%
		\ifthenelse{\boolean{ABNTEXcotutela}}%
		    { no âmbito do Acordo de Cotutela Internacional de Tese firmado entre a %
		    UNICAMP e a \imprimiruniversidadecotutela\ (\imprimirpaiscotutela).}%
		    {.}
		
		\vspace{1em}%\hspace{\fill} e \hspace{\fill}
		
		\imprimirtypework\ presented to the Institute of Mathematics, Statistics %
		and Scientific Computing of the University of Campinas in partial fulfillment %
		of the requirements for the degree of %
		\ifthenelse{\equal{\imprimircurso}{\empty}}%
		    {\imprimirtitulation}%
		    {\imprimirtitulation\ in \imprimircursootherlang}%
		\ifthenelse{\boolean{ABNTEXcotutela}}%
		    { under the Agreement for the International Joint Supervision of Thesis %
		    signed between UNICAMP and the \imprimiruniversidadecotutela\ (\imprimirpaiscotutela).}%
		    {.}
	    }{%
		\imprimirtipotrabalho\ apresentada ao Instituto de Matemática, Estatística %
		e Computação Científica da Universidade Estadual de Campinas como parte dos %
		requisitos exigidos para a obtenção do título de %
		\ifthenelse{\equal{\imprimircurso}{\empty}}%
		    {\imprimirtitulacao}%
		    {\imprimirtitulacao\ em \imprimircurso}%
		\ifthenelse{\boolean{ABNTEXcotutela}}%
		    { no âmbito do Acordo de Cotutela Internacional de Tese firmado entre a %
		    UNICAMP e a \imprimiruniversidadecotutela\ (\imprimirpaiscotutela).}%
		    {.}
	    }
        \end{minipage}%
    \end{flushright}
    \vspace*{\fill}
    \ifthenelse{\boolean{ABNTEXotherlanguage}}{
	\noindent
	{\large\orientadorname:~\imprimirorientador\par}
	\noindent
	\abntex@ifnotempty{\imprimircoorientador}{%
	    {\large\coorientadorname:~\imprimircoorientador}%
	}
    }{
	\noindent
	{\large\imprimirorientadorRotulo:~\imprimirorientador\par}
	\noindent
	\abntex@ifnotempty{\imprimircoorientador}{%
	    {\large\imprimircoorientadorRotulo:~\imprimircoorientador}%
	}
    }
    \vspace*{\fill}
    \begin{flushleft}
	\begin{minipage}[c]{.5\textwidth}
	    \SingleSpacing
	    {\large{Este exemplar corresponde à versão final da %
	    \imprimirtipotrabalho\ defendida
	    \ifthenelse{\equal{\sexo}{autora}}%
		{pela aluna \imprimirautor~}%
		{pelo aluno \imprimirautor~}%
	    e orientada %
	    \ifthenelse{\equal{\imprimirorientadorRotulo}{Orientadora}}%
		{pela Profa. Dra.}%
		{pelo Prof. Dr.}
	    \imprimirorientador.}}
	\end{minipage}
    \end{flushleft}
    
    \vspace*{\fill}
    
    \begin{center}
        {\large Campinas}
        \par
        {\large\imprimirdata}
    \end{center}
}
\makeatother
% ----------------------------------

% ----------------------------------------------------
% FIM DAS ALTERAÇÕES PARA O IMECC -- UNICAMP
% ----------------------------------------------------