// This example is licensed under the MIT-0 License.
// You can freely use and modify it without any restrictions.
// #import "@preview/smallsat:0.1.0": project
#import "../lib.typ": project

#show: project.with(
  // "us-letter" (default) or "a4".
  paper: "us-letter",
  // "40th Annual Small Satellite Conference" for SSC26.
  conference-number: 40,
  paper-number: "SSC26-XII-07",
  title: "Example Paper for the SSC Typst Template",
  authors: (
    // Several authors who share an affiliation can be passed as an array of names;
    // the phone number and email are the first author's.
    (
      name: ("Jane A. Doe", "John B. Smith"),
      affiliation: "Department of Aerospace Engineering, Northbridge University",
      address: "123 Academic Road, Springfield, USA 12345; +1 555 0100",
      email: "jane.doe@northbridge.example.edu",
    ),
    (
      name: "Alex R. Mercer",
      affiliation: "Western Institute of Technology",
      address: "456 Research Avenue, Metropolis, USA 67890",
      email: "a.mercer@wit.example.org",
    ),
  ),
  first-author-last-name: "Doe",
  abstract: [
    This document is a feature showcase for the Typst Small Satellite Conference template.
    The text below is placeholder content and carries no technical meaning; it exists only to demonstrate the layout of headings, figures, tables, equations, and citations.
    #lorem(50)
  ],
)

#set table(stroke: (x, y) => (
  left: 0pt,
  right: 0pt,
  top: if y < 1 {
    1.5pt
  } else if y < 2 {
    0.5pt
  } else {
    0pt
  },
  bottom: 1.5pt,
))

= First-Level Heading

Body text is fully justified and indented.
Citations appear as superscript numbers in order of appearance. @example_article @example_proceedings

#lorem(40)

= Heading Levels

== Second-Level Heading

#lorem(35)

= Figures and Tables

A single-column figure (@fig:single), a table (@tab:example), and a figure that spans both columns (@fig:wide) are shown below.
#lorem(50)

#figure(
  rect(width: 6cm, height: 5cm, stroke: 0.4pt)[
    #align(center + horizon)[Placeholder]
  ],
  caption: [A figure within a single column],
) <fig:single>

#lorem(20)

#figure(
  text(size: 8pt, table(
    columns: 3,
    align: (center, right, right),
    table.header([*Column A*], [*Column B*], [*Column C*]),
    [Row 1], [10], [0.8],
    [Row 2], [20], [1.6],
    [Row 3], [30], [2.4],
  )),
  caption: [An example table],
) <tab:example>

#figure(
  rect(width: 100%, height: 6cm, stroke: 0.4pt)[
    #align(center + horizon)[Placeholder]
  ],
  caption: [A figure that spans both columns],
  placement: top,
  scope: "parent",
) <fig:wide>

= Equations

Equations are left-flushed and numbered sequentially, with the number in parentheses against the right margin:

$ y = a x + b $

where $a$ and $b$ are placeholder coefficients.
#lorem(25)

= Notes

Notes should be avoided; incorporate the information into the body text instead.
In tables, reference marks such as \*, \*\*, and $dagger$ may be used where a footnote is unavoidable.

= Acknowledgments

#lorem(20)

#bibliography("references.bib", title: [References], style: "nature")
