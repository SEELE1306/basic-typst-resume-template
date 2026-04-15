//#import "@preview/basic-resume:0.2.9": *
#import "../assets/lib.typ": *

// Put your personal information here, replacing mine
#let name = "Max Mustermann"
#let address = "Musterstraße 1, 12345 Musterstadt, Deutschland"
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
  dates: __dates_helper(start-date: "10.2022", end-date: "aktuell"),
  degree: "B.Sc. Elektrotechnik",

  // Uncomment the line below if you want edu formatting to be consistent with everything else
  consistent: true
)
- Notendurchschnitt: 1,7 | Deutschlandstipendium 2023, 2024, 2025
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

#resume-education(
  institution: "Fachhochschule Musterstadt",
  location: "Musterstadt, Deutschland",
  dates: __dates_helper(start-date: "10.2021", end-date: "07.2022"),
  degree: "Studienkolleg für Studierende der Ingenieurswissenschaft",

  // Uncomment the line below if you want edu formatting to be consistent with everything else
  consistent: true
)
- Notendurchschnitt: 1,3 | Stipendium der Hochschule im 12.2022
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

== Praktische Erfahrungen

#resume-work(
  title: "Werkstudent Programmierung und Qualitätskontrolle",
  location: "Musterstadt, Deutschland",
  company: "Musterunternehmen GmbH",
  dates: __dates_helper(start-date: "03.2024", end-date: "aktuell"),
)
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 

#resume-work(
  title: "Studentische Hilfskraft in Nachrichtentechnik",
  location: "Musterstadt, Deutschland",
  company: "Universität Musterstadt",
  dates: __dates_helper(start-date: "10.2022", end-date: "02.2023"),
)
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

== Projekte

#resume-project(
  name: "System zur Messung der Außentemperatur",
  // Role is optional
  role: "Hardwareentwicklung",
  // Dates is optional
  dates: __dates_helper(start-date: "10.2024", end-date: "10.2025"),
  // URL is also optional
  url: "",
  location: "Musterstadt, Deutschland",
  company: "Universität Musterstadt"
)
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

== Kompetenzen
- *Sprachlich*: *Vietnamesisch* Muttersprache | *Englisch* C1 | *Deutsch* B2/C1
- *Technisch*: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
- *Sozial*: Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

