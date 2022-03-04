---
# Front matter
title: "Отчёт по лабораторной работе №6"
subtitle: "Задача об эпидемии"
author: "Кондрашина Мария Сергеевна"

# Generic otions
lang: ru-RU
toc-title: "Содержание"

# Pdf output format
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
### Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Misc options
indent: true
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

- Научиться строить модель эпидемии.
- Выполнить лабораторную работу №5 согласно своему варианту(34) и сделать по ней отчет.

# Задание. Вариант 34

На одном острове вспыхнула эпидемия. Известно, что из всех проживающих на острове ($N=12 200$) в момент начала эпидемии ($t=0$) число заболевших людей (являющихся распространителями инфекции) $I(0)=130$, А число здоровых людей с иммунитетом к болезни $R(0)=53$. Таким образом, число людей восприимчивых к болезни, но пока здоровых, в начальный момент времени $S(0)=N-I(0)- R(0)$.

Постройте графики изменения числа особей в каждой из трех групп.

Рассмотрите, как будет протекать эпидемия в случае:

1. если $I(0) \leq I^*$
2. если $I(0) > I^*$

# Теоретическое введение

Для того чтобы уметь бороться с эпидемиями, то есть своевременно проводить тот или иной комплекс мероприятий, необходимо уметь оценить эффективность каждого такого комплекса и выбрать наиболее оптимальный для определенного вида эпидемии. Оценка эффективности базируется, как правило, на прогнозе о протекании эпидемии. Отсюда вытекает задача построения модели, которая могла бы служить целям прогноза. Самой простой моделью является описание естественного хода эпидемии без применения каких-либо профилактических мероприятий. [2]

Предположим, что некая популяция, состоящая из $N$ особей, (считаем, что популяция изолирована) подразделяется на три группы. Первая группа - это восприимчивые к болезни, но пока здоровые особи, обозначим их через $S(t)$. Вторая группа – это число инфицированных особей, которые также при этом являются распространителями инфекции, обозначим их $I(t)$. А третья группа, обозначающаяся через $R(t)$ – это здоровые особи с иммунитетом к болезни. До того, как число заболевших не превышает критического значения $I^*$, считаем, что все больные изолированы и не заражают здоровых. Когда $I(0) > I^*$,тогда инфицирование способны заражать восприимчивых к болезни особей. Таким образом, скорость изменения числа $S(t)$ меняется по следующему закону:

$$
\frac{dS}{dt}=
\begin{cases}
    -\alpha*S,  I(0) > I^*\\
    0, I(0) \leq I^*
\end{cases}
$$

Поскольку каждая восприимчивая к болезни особь, которая, в конце концов,заболевает, сама становится инфекционной, то скорость изменения числа инфекционных особей представляет разность за единицу времени между заразившимися и теми, кто уже болеет и лечится, т.е.:

$$
\frac{dI}{dt}=
\begin{cases}
    \alpha*S-\beta*I,  I(0) > I^*\\
    -\beta*I,  I(0) \leq I^*
\end{cases}
$$

А скорость изменения выздоравливающих особей (при этом приобретающие иммунитет к болезни)

$$\frac{dR}{dt} = \beta*I$$

Постоянные пропорциональности $\alpha,\beta$ - это коэффициенты заболеваемости и выздоровления соответственно.[1]

# Выполнение лабораторной работы

1. Случай если $I(0) \leq I^*$
Система уравнений для случая 1:
$$
\begin{cases}
    \frac{dS}{dt}=0\\
    \frac{dI}{dt}=-\beta*I\\
    \frac{dR}{dt} = \beta*I
\end{cases}
$$

где коэффициент заболеваемости  $\alpha = 0.01$, а коэффициенты выздоровления $\beta = 0.02$

По условию задания в варианте $N=12200$, $I(0)=130$, $R(0)=53$, $S(0)=N-I(0)- R(0) = 12200 - 130 - 53 = 12017$, $t=[0, 200]$ с шагом 0.01.
Код программы (@fig:001)

![Код программы для случая 1($I(0) \leq I^*$)](lab6p/с1.jpg){ #fig:001 width=100%}

Графики изменения числа особей в каждой из трех групп в случае 1 (если $I(0) \leq I^*$). (@fig:002)

![Динамика изменения числа людей в каждой из трех групп в случае 1($I(0) \leq I^*$)](lab6p/rsi1.jpg){ #fig:002 width=100%}

Так как до того, как число заболевших не превышает критического значения, все больные изолированы и не заражают здоровых, то число здоровых(S) не изменяется, что видно на графике. Но сложно понять изменение заболевших(I) и здоровых с иммунитетом(R), поэтому я отдельно вывела их график. (@fig:003)

![Динамика изменения числа людей заболевших(I) и здоровых с иммунитетом(R) в случае 1($I(0) \leq I^*$)](lab6p/ri1.jpg){ #fig:003 width=100%}

Также выведу отдельно графики для каждой группы

График изменения числа людей восприимчивых к болезни (S): (@fig:004)

![Динамика изменения числа людей восприимчивых к болезни(S) в случае 1($I(0) \leq I^*$)](lab6p/s1.jpg){ #fig:004 width=100%}

График изменения числа людей здоровых с иммунитетом (R): (@fig:005)

![Динамика изменения числа людей здоровых с иммунитетом(R) в случае 1($I(0) \leq I^*$)](lab6p/r1.jpg){ #fig:005 width=100%}

График изменения числа людей заболевших (I): (@fig:006)

![Динамика изменения числа людей заболевших(I) в случае 1($I(0) \leq I^*$)](lab6p/g1f.jpg){ #fig:006 width=100%}

2. Случай если $I(0) > I^*$
Система уравнений для случая 2:
$$
\begin{cases}
    \frac{dS}{dt}=-\alpha*S\\
    \frac{dI}{dt}=\alpha*S-\beta*I\\
    \frac{dR}{dt} = \beta*I
\end{cases}
$$

Коэффициенты и значения не отличаются от предыдущего пункта.

Код программы (@fig:007)

![Код программы для случая 2($I(0) > I^*$)](lab6p/c2.jpg){ #fig:007 width=100%}

Графики изменения числа особей в каждой из трех групп в случае 2 (если $I(0) > I^*$). (@fig:008)

![Динамика изменения числа людей в каждой из трех групп в случае 2($I(0) > I^*$)](lab6p/rsi2.jpg){ #fig:008 width=100%}

Также выведу отдельно графики для каждой группы

График изменения числа людей восприимчивых к болезни (S): (@fig:009)

![Динамика изменения числа людей восприимчивых к болезни(S) в случае 2($I(0) > I^*$)](lab6p/s2.jpg){ #fig:009 width=100%}

График изменения числа людей здоровых с иммунитетом (R): (@fig:010)

![Динамика изменения числа людей здоровых с иммунитетом(R) в случае 2($I(0) > I^*$)](lab6p/r2.jpg){ #fig:010 width=100%}

График изменения числа людей заболевших (I): (@fig:011)

![Динамика изменения числа людей заболевших(I) в случае 2($I(0) > I^*$)](lab6p/i2.jpg){ #fig:011 width=100%}

# Выводы

- Выполнила лабораторную работу №6.
- Познакомилась с написанием модели эпидемии.
- Познакомилась с написанием математических моделей при использованиии openmodelica.

# Список литературы

1. Методические материалы курса.
2. https://studopedia.ru/8_138165_prosteyshaya-model-epidemii.html