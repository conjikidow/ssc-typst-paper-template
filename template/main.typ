// This template is licensed under the MIT-0 License.
// You can freely use and modify it without any restrictions.
#import "@preview/halo-smallsat:0.1.0": project

#show: project.with(
  // "40th Annual Small Satellite Conference" for SSC26.
  conference-number: 40,
  paper-number: "[Paper Number]",
  title: "[Title]",
  authors: (
    // Authors who share an affiliation are grouped together; pass their names as an array.
    // A group's `phone`/`email` are the first author's.
    (
      name: ("[First Author Full Name]", "[Second Author Full Name]"),
      affiliation: "[First Affiliation]",
      address: "[First Affiliation Address]",
      phone: "[First Author Phone Number]", // optional; delete if not needed
      email: "[First Author Email]", // optional; delete if not needed
    ),
    (
      name: "[Third Author Full Name]",
      affiliation: "[Second Affiliation]",
      address: "[Second Affiliation Address]",
      phone: "[Third Author Phone Number]", // optional; delete if not needed
      email: "[Third Author Email]", // optional; delete if not needed
    ),
  ),
  first-author-last-name: "[First Author Last Name]",
  abstract: [
    Provide an informative abstract of no more than 500 words.
  ],
)

= Introduction

Replace this text with your manuscript.
Cite references with superscript numbers. @example
Refer to a figure by its label, as in @fig:example.

#figure(
  // Replace the placeholder with your figure, e.g. image("figure.png").
  rect(width: 7cm, height: 5cm, stroke: 0.4pt)[
    #align(center + horizon)[Placeholder]
  ],
  caption: [Figure Caption],
) <fig:example>

#bibliography("references.bib", title: [References], style: "nature")
