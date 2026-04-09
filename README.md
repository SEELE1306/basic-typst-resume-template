# Basic Resume

<div align="center">Version 0.3.1</div>

> **From the original repo:** This is a template for a simple resume. It is intended to be used as a good starting point for quickly crafting a standard resume that will properly be parsed by ATS systems. Inspiration is taken from [Jake's Resume](https://github.com/jakegut/resume) and [guided-resume-starter-cgc](https://typst.app/universe/package/guided-resume-starter-cgc/). I'm currently a college student and was unable to find a Typst resume template that fit my needs, so I wrote my own. I hope this template can be useful to others as well.

Changes from the original repo (as of v0.3.1):
- Adds the ability to include a profile picture in the resume, which is essential for resumes (DE: Lebenslauf) in Germany. 
- All helper functions are also moved to the corresponding `lib.typ` file, as they might be useful if a cover letter is to be designed.

## Sample Resume

![example resume](https://raw.githubusercontent.com/SEELE1306/basic-typst-resume-template/main/example-resume.png)

## Quick Start

You can find the template in `/templates/resume.typ`. 

A Typst package has not been made for this fork yet, for now you would have to clone the repo and import the lib files from the assets directory.

Your profile picture should be placed inside `/assets/images`. The path to the image should be changed in the entry `#let profile-picture = image("/path/to/the/image")`.

```typst
#import "../assets/lib.typ": *

// Put your personal information here, replacing mine
#let name = "Max Mustermann"
#let address = "1 Musterstraße, 12345 Musterstadt, Deutschland"
#let email1 = "max.mustermann@gmail.com"
#let email2 = "max.mustermann@uni-ms.de"
#let github = "github.com/maxmsm"
#let linkedin = "linkedin.com/in/maxmustermann"
#let phone = "+49 123 4567890"
#let personal-site = ""
#let profile-picture = image("../assets/images/profile.png")
#let introduction = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum."

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  address: address,
  email1: email1,
  email2: email2,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  profile-picture: profile-picture,
  introduction: introduction,
)

/*
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
* #work(company: "", dates: "", location: "", title: "")
* #project(dates: "", name: "", role: "", url: "")
* certificates(name: "", issuer: "", url: "", date: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/


== Bildung

#resume-education(
  institution: "Universität Musterstadt",
  location: "Musterstadt, Deutschland",
  dates: __dates_helper(start-date: "10.2022", end-date: "präsenz"),
  degree: "B.Sc. Elektrotechnik",

  // Uncomment the line below if you want edu formatting to be consistent with everything else
  consistent: true
)
- Notendurchschnitt: 1,7 | Deutschlandstipendium 2023, 2024, 2025
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

// Other sections in resume.typ
```

You can then render your Typst project into a PDF file either by using the `Tinymist Typst` and `vscode-pdf` extensions in VS Code, or in the terminal:

```typst
// Render Typst project to a PDF
typst compile ./template/resume.typ my-resume.pdf

// Render Typst project to a PNG
typst compile --format png ./template/resume.typ my-resume.png
```
