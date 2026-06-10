# Typst Template for the Small Satellite Conference Manuscript

[![Typst Version](https://img.shields.io/badge/typst-0.13%20%7C%200.14-blue)](https://typst.app/)
[![styled with typstyle](https://img.shields.io/badge/styled_with-typstyle-024a51.svg?style=flat)](https://github.com/typstyle-rs/typstyle)
[![prek](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/j178/prek/master/docs/assets/badge-v0.json)](https://github.com/j178/prek)

This is an unofficial Typst template for the [Annual Small Satellite Conference](https://smallsat.org/) (SSC) manuscript.
It was created with reference to the official LaTeX and Word templates.

## Usage

To initialize a project with this template, run the following command:

```bash
typst init @preview/halo-smallsat
```

Or, you can manually add the following line at the beginning of your Typst file:

```typst
#import "@preview/halo-smallsat:0.1.0": project
```

The `project` function exported by this template has the following named arguments:

| Argument | Required | Default | Description |
| --- | --- | --- | --- |
| `paper` | optional | `"us-letter"` | The paper size, either `"us-letter"` or `"a4"`. |
| `conference-number` | required | — | The conference number (e.g. `40` for the 40th conference, in 2026). |
| `paper-number` | required | — | The paper number (e.g. `"SSC26-X-X"`). |
| `title` | required | — | The title of the manuscript. |
| `authors` | required | — | The manuscript's authors: an array of affiliation-group dictionaries (see below). |
| `first-author-last-name` | required | — | The last name of the first author. |
| `abstract` | required | — | The abstract of the manuscript (max 500 words). |

Each entry in `authors` is a dictionary describing one affiliation group, with the following keys:

| Key | Required | Description |
| --- | --- | --- |
| `name` | required | The author's name, or an array of names for several authors sharing one affiliation. |
| `affiliation` | required | The affiliation of the author(s). |
| `address` | required | The address of the affiliation. |
| `phone` | optional | The phone number (the first author's, for a shared group). |
| `email` | optional | The email address (the first author's, for a shared group). |

The scaffolded project is a minimal starting point (see [`template/main.typ`](template/main.typ)).
For a complete example that exercises every feature, see [`example/main.typ`](example/main.typ).

## License

- The `lib.typ` file and all other files in this repository, except for the content in the `template` and `example`
  directories, are licensed under the [MIT License](./LICENSE-MIT).
- The content in the `template` and `example` directories is licensed under the [MIT-0 License](./LICENSE-MIT-0),
  which allows for unlimited reuse without any restrictions.
