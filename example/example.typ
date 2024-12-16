#import "../lib.typ": *
#import "@preview/cuti:0.3.0": show-cn-fakebold
#show: show-cn-fakebold
#set text(font: ("libertinus serif", "PingFang SC"))
#align(horizon)[
#show: slides.with(
  title: "Parallel molecular data storage by printing epigenetic bits on DNA", // Required
  // subtitle: "在DNA上打印表观遗传位来实现并行分子数据存储",
  date: "2024.12.17",
  authors: ("穆新宇", "邱天", "许智威"),
  // Optional Style Options
  title-color: rgb("#660874"),
  ratio: 4/3, // aspect ratio of the slides, any valid number
  layout: "medium", // one of "small", "medium", "large"
  toc: true, 
  count: true,
  footer: true,
  // footer-title: "Custom Title", 
  // footer-subtitle: "Custom Subtitle", 
  theme: "full"
)


= 背景

== 存储难题


全球数据领域的显著扩展对大规模数据存储提出了迫切挑战，并对更好的存储材料提出了紧迫需求。

#quote(attribution: [Huawei])[
全球每年产生数据总量达1YB，其中非结构化数据比例超过80%
]

== DNA
#page[
=== 小复习

/ *DNA（脱氧核糖核酸）*: 一种长链聚合物，组成单位称为核苷酸，而糖类与磷酸借由酯键相连，组成其长链骨架。
#align(center)[#figure(image("Nucleotides_zh.png", width: 65%), caption: [核苷酸])]
]

/ *转录（Transcription）*: 在*RNA聚合酶*的催化下，遗传信息由DNA复制到RNA（尤其是mRNA）的过程。

1. RNA聚合酶与一种或多种通用转录因子一起结合DNA上的*启动子*
2. RNA聚合酶催化聚合核糖核苷酸（与模板DNA链的脱氧核糖核苷酸互补）
3. 在RNA聚合酶的作用下形成RNA糖—磷酸骨架，进而形成RNA链

#page[
/ *表观基因（Epigenetics）*: 在人类细胞中，除了DNA序列本身之外，还有一种叫做*表观基因*的机制，它能够在不改变DNA的基本顺序的前提下，稳定地记录和调控细胞的功能信息。
表观基因的实现：
- *DNA甲基化*：DNA分子上的某些胞嘧啶（C）碱基会被添加上甲基（CH₃）基团，这通常会抑制基因的表达。
- *组蛋白修饰*：组蛋白是与DNA结合形成染色质的蛋白质。组蛋白的修饰（如乙酰化、甲基化等）会改变染色质的结构，进而影响基因的表达。
- *非编码RNA*：一些非编码RNA（如miRNA、lncRNA等）也能通过与DNA或RNA的相互作用，调节基因的表达。
]

=== DNA作为存储介质的特点

- DNA存储因其高存储密度和耐久性而引起了关注
- 当前DNA存储写入方法及其问题

#figure(image("traditional-dna.png", width: 80%), caption: [表观基因修饰 vs. 从头DNA合成])

=== epi - bit

文章提出了epi - bit——一种基于表观基因的并行、可编程、稳定、可扩展的DNA数据存取模式，并尝试在大规模数据存取上进行了实验和验证。

= 系统设计

== 写入流程

#figure(image("可移动类型.png", width: 90%), caption: [DNA版本的活字印刷])

类比活字印刷，文章提出的基于表观基因的并行DNA写入系统的写入过程大致如下：

1. 制作一些单链DNA模板（白纸），将与这些单链DNA互补的另一条链打散，形成预制可移动类型集合（Premade DNA movable types，活字印刷中的活字），再将这些可移动类型与模板单链DNA混合，发生碱基互补配对
#figure(image("预制DNA小片段.png", width: 70%), caption: [预制一些DNA小片段，与单链DNA混合])

2. 利用DNM1（一种酶）催化CH₃的挂载，这个过程是*并行的*，这也是这篇文章的精华之处

#figure(image("并行写入模板链.png", width: 44%), caption: [预制一些DNA小片段，与单链DNA混合])

#page[
=== 一些可能的疑问
#quote[
- 为什么预制的DNA片段集合中有多个0和1？
- DNM1催化CH₃挂载时，CH₃是从哪里来的？
]
]

== 单bit写入验证

在验证单bit的写入是否正确时，文章采用了一些生物和化学方法，这里就不再给出。
#figure(image("生物化学方法.png"), caption: [分子信标与荧光测定法])

= 总结

== 主要成就
#page[
与传统方法相比，epi - bit 存储框架具有显著优势。它采用并行 “印刷” 模式，利用预制的 DNA 可移动类型和甲基转移酶 DNMT1，如同活字印刷术一样，将 epi - bit 信息快速、高效地写入 DNA 模板，极大地提高了数据写入速度，降低了成本。此外，该框架成功存储了约 275,000 比特的数据，证明了其在大规模数据存储方面的可行性和有效性，为未来数据存储技术的发展提供了新方向。
]

== 进一步改进

- *优化序列设计*：进一步优化 DNA 序列设计，确保可移动类型与 DNA 模板之间的相互作用更加精准、稳定，减少非特异性结合和错误组装的可能性。
- *提高DNM1催化性能*：优化DNM1的性能，使其能够在不同条件下稳定地维持 DNA 甲基化状态。
- *增加存储密度*：研究并引入更多种类的 DNA 修饰方式，除了 5 - 甲基胞嘧啶（5mC）外，探索其他碱基修饰（如 N6 - 甲基腺嘌呤、5 - 羟甲基胞嘧啶）等。


// == General

// _diatypst_ is a simple slide generator for _typst_. 

// Features:

// - easy delimiter for slides and sections (just use headings)
// - sensible styling
// - dot counter in upper right corner (like LaTeX beamer)
// - adjustable color-theme
// - default show rules for terms, code, lists, ... that match color-theme

// This short presentation is a showcase of the features and options of _diatypst_.

// == Usage

// To start a presentation, initialize it in your typst document:

// ```typst
// #import "@preview/diatypst:0.2.0": *
// #show: slides.with(
//   title: "Diatypst", // Required
//   subtitle: "easy slides in typst",
//   date: "01.07.2024",
//   authors: ("John Doe"),
// )
// ...
// ```

// Then, insert your content.

// - Level-one headings corresponds to new sections.
// - Level-two headings corresponds to new slides.

// == Options

// To start a presentation, only the title key is needed, all else is optional!

// Basic Content Options:
// #table(
//   columns: 3,
//   [*Keyword*], [*Description*], [*Default*],
//   [_title_], [Title of your Presentation, visible also in footer], [`none` (required!)],
//   [_subtitle_], [Subtitle, also visible in footer], [`none`],
//   [_date_], [a normal string presenting your date], [`none`],
//   [_authors_], [either string or array of strings], [`none`],
//   [_footer-title_], [custom text in the footer title (left)], [same as `title`],
//   [_footer-subtitle_], [custom text in the footer subtitle (right)], [same as `subtitle`],
// )

// #pagebreak()

// Advanced Styling Options:
// #table(
//   columns: 3,
//   [*Keyword*], [*Description*], [*Default*],
//   [_layout_], [one of _small, medium, large_, adjusts sizing of the elements on the slides], [`"medium"`],
//   [_ratio_], [aspect ratio of the slides, e.g., 16/9], [`4/3`],
//   [_title-color_], [Color to base the Elements of the Presentation on], [`blue.darken(50%)`],
//   [_count_], [whether to display the dots for pages in upper right corner], [`true`],
//   [_footer_], [whether to display the footer at the bottom], [`true`],
//   [_toc_], [whether to display the table of contents], [`true`],
//   [_theme_], [one of _normal, full_, adjusts the theme of the slide], [`"normal"`],
// )

// The full theme adds more styling to the slides, similar to a a full LaTeX beamer theme.

// = Default Styling in diatypst

// == Terms, Code, Lists

// _diatypst_ defines some default styling for elements, e.g Terms created with ```typc / Term: Definition``` will look like this

// / *Term*: Definition

// A code block like this

// ```python
// // Example Code 
// print("Hello World!")
// ```

// Lists have their marker respect the `title-color`

// #columns(2)[
//   - A
//     - AAA
//       - B
//   #colbreak()
//   1. AAA
//   2. BBB
//   3. CCC
// ]



// == Tables and Quotes



// #columns(2)[
//   Look at this styled table
//   #table(
//     columns: 3,
//     [*Header*],[*Header*],[*Header*],
//     [Cell],[Cell],[Cell],
//     [Cell],[Cell],[Cell],
//   )
//   #colbreak()
//   compared to an original one
//   #table(
//     stroke: 1pt,
//     columns: 3,
//     [*Header*],[*Header*],[*Header*],
//     [Cell],[Cell],[Cell],
//     [Cell],[Cell],[Cell],
//   )
// ]

// And here comes a quote

// #quote(attribution: [Plato])[
//   This is a quote
// ]

// And finally, web links are styled like this: #link("https://typst.app")[typst.app]

// = Additional

// == More Info

// For more information, visit the #link("www.github.com/skriptum/diatypst")[diatypst repository]. The package is also available on the #link("https://typst.app/universe/package/diatypst")[typst universe].

// For Issues and Feature Requests, please use the GitHub Repo.

// To find the source code for this presentation, visit the #link("https://github.com/skriptum/diatypst/tree/main/example")[example folder on GitHub]. An minimal template can also be #link("https://github.com/skriptum/diatypst/blob/main/template/main.typ")[found here]  

// == Inspiration

// this template is inspired by #link("https://github.com/glambrechts/slydst")[slydst], and takes part of the code from it. If you want simpler slides, look here!

// The word _diatypst_ is inspired by 

// #columns(2)[
//   #image("diaprojektor.jpg", height: 3cm)
//   the ease of use of a #link("https://de.wikipedia.org/wiki/Diaprojektor")[Diaprojektor] (German for Slide Projector)

//   #colbreak()

//   #image("diatype.jpg", height: 3cm) 
//   and the #link("https://en.wikipedia.org/wiki/Diatype_(machine)")[Diatype] (60s typesetting machine)
// ]

]
