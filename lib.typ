// Typst template for the Small Satellite Conference (SSC) manuscript.
// Reproduces the official LaTeX template.

// Render an integer as an English ordinal with a superscript suffix,
// e.g. 40 -> 40^th (used for "40th Annual Small Satellite Conference").
#let ordinal(n) = {
  let suffix = if calc.rem(n, 100) >= 11 and calc.rem(n, 100) <= 13 {
    "th"
  } else if calc.rem(n, 10) == 1 {
    "st"
  } else if calc.rem(n, 10) == 2 {
    "nd"
  } else if calc.rem(n, 10) == 3 {
    "rd"
  } else {
    "th"
  }
  [#n#super(suffix)]
}

// Normalize an author's `name` field (string or array of strings) to content.
#let author-names(name) = if type(name) == array {
  name.join(", ")
} else {
  name
}

#let project(
  // [Optional] Paper size: "us-letter" (default) or "a4".
  paper: "us-letter",
  // [Required] Conference number, used for the right side of the footer (e.g. 40 -> "40th Annual Small Satellite Conference").
  conference-number: none,
  // [Required] Paper number printed in bold at the top-right corner, e.g. "SSC26-X-X".
  paper-number: none,
  // [Required] Paper title.
  title: none,
  // [Required] Array of author groups. Each group is a dictionary with:
  //   name:        string, or array of strings for several authors sharing the same affiliation
  //   affiliation: string
  //   address:     string
  //   phone:       string (optional)
  //   email:       string (optional)
  authors: none,
  // [Required] Last name of the first author, shown at the left of the page footer.
  first-author-last-name: none,
  // [Required] Abstract content (max 500 words).
  abstract: none,
  // Main body of the paper.
  body,
) = {
  // All of these fields are required.
  if conference-number == none {
    panic("`conference-number` is required (e.g. 40 for SSC26).")
  }
  if paper-number == none {
    panic("`paper-number` is required (e.g. \"SSC26-X-X\").")
  }
  if title == none {
    panic("`title` is required.")
  }
  if authors == none or authors.len() == 0 {
    panic("`authors` is required.")
  }
  if first-author-last-name == none {
    panic("`first-author-last-name` is required.")
  }
  if abstract == none {
    panic("`abstract` is required.")
  }

  // Flatten all author names for the document metadata.
  let all-names = authors
    .map(a => if type(a.name) == array { a.name } else { (a.name,) })
    .flatten()

  let margin = if paper == "us-letter" {
    (rest: 1in)
  } else if paper == "a4" {
    (top: 1.7in, bottom: 1in, left: 0.88in, right: 0.88in)
  } else {
    panic("Unsupported paper size: " + paper + ". Use \"us-letter\" or \"a4\".")
  }

  set document(author: all-names, title: title)
  set page(
    paper: paper,
    margin: margin,
    footer-descent: 17.7pt,
    footer: context [
      #line(length: 100%, stroke: 1pt)
      #grid(
        columns: (1fr, auto, 1fr),
        align(left)[#first-author-last-name],
        align(center)[#counter(page).display()],
        align(
          right,
        )[#ordinal(conference-number) Annual Small Satellite Conference],
      )
    ],
  )
  set text(font: "New Computer Modern", lang: "en", size: 10pt)
  set par(
    justify: true,
    leading: 0.52em,
    spacing: 0.52em,
    first-line-indent: (amount: 1.5em, all: true),
  )

  // --- Front matter (full width, single column) ---

  v(1.0pt)

  // Paper number: bold 14pt, flush right.
  align(right, text(size: 14pt, weight: "bold", paper-number))
  v(5.6mm, weak: true)

  // Title: bold 12pt, centered.
  align(center, text(size: 12pt, weight: "bold", title))
  v(6.7mm, weak: true)

  // Authors and affiliations: centered, grouped by shared affiliation.
  align(center)[
    #set par(first-line-indent: 0pt)
    #{
      let blocks = authors.map(author => {
        let phone = author.at("phone", default: none)
        let email = author.at("email", default: none)
        [
          #author-names(author.name) \
          #author.affiliation \
          #author.address#if phone != none [; #phone]
          #if email != none [\ #email]
        ]
      })
      blocks.join(v(6.8mm, weak: true))
    }
  ]
  v(6.7mm, weak: true)

  // Abstract: centered bold heading, justified text across the full width.
  align(center, text(weight: "bold", upper[Abstract]))
  v(4.8mm, weak: true)
  abstract
  v(6mm, weak: true)

  // --- Headings ---
  // Level 1: bold, all capitals. Level 2/3: bold italic. Unnumbered.
  let after-heading = state("ssc-after-heading", false)
  show par: it => {
    after-heading.update(false)
    it
  }
  show heading: set text(size: 10pt)
  show heading.where(level: 1): it => {
    block(
      above: 2.15em,
      below: 1.55em,
      text(weight: "bold", upper(it)),
    )
    after-heading.update(true)
  }
  show heading.where(level: 2): it => {
    context block(
      above: if after-heading.get() { 1.55em } else { 2.0em },
      below: 1.2em,
      text(weight: "bold", style: "italic", it),
    )
    after-heading.update(true)
  }
  show heading.where(level: 3): it => {
    context block(
      above: if after-heading.get() { 1.2em } else { 2.0em },
      below: 1.2em,
      text(weight: "bold", style: "italic", it),
    )
    after-heading.update(true)
  }

  // --- Figures and tables ---
  // Captions are bold; figure captions sit below, table captions above.
  show figure.caption: set text(weight: "bold")
  show figure.where(kind: image): set figure(supplement: [Figure])
  show figure.where(kind: table): set figure.caption(position: top)

  // --- Body (two columns) ---
  set math.equation(numbering: "(1)")
  show: columns.with(2, gutter: 18pt)
  body
}
