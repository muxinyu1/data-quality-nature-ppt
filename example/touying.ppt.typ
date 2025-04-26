#import "@preview/touying-flow:1.2.0":*
#import "@preview/pinit:0.2.2":*
#show: flow-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.title,
  footer-alt: self => self.info.subtitle,
  navigation: "mini-slides",
  primary:rgb("#543795"),
  secondary:rgb("#a38acb"),
  // text-font: ("Libertinus Serif"),
  // text-size: 20pt,
  // code-font: ("Jetbrains Mono NL","PingFang SC"),
  // code-size: 16pt,
  config-info(
    title: [],
    subtitle: [],
    author: [],
    date: datetime.today(),
    institution: [],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

#outline-slide()

= Section A

== Subsection A.1

$ x_(n+1) = (x_n + a/x_n) / 2 $

== Subsection A.2

A slide without a title but with *important* infos

= Section B

== Subsection B.1

#lorem(80)

#focus-slide[
  Wake up!
]

== Subsection B.2

We can use `#pause` to #pause display something later.

#pause

Just like this.

#meanwhile

Meanwhile, #pause we can also use `#meanwhile` to #pause display other content synchronously.

#show: appendix

= Appendix

== Appendix

Please pay attention to the current slide number.