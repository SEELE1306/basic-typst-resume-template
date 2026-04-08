// -------------- [[ HELPER FUNCTIONS ]] --------------

// Generic two by two component for resume
#let __generic_two_by_two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  [
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

// Generic one by two component for resume
#let __generic_one_by_two(
  left: "",
  right: "",
) = {
  [
    #left #h(1fr) #right
  ]
}

// Contact item
#let __contact_item(value, prefix: "", link-type: "") = {
  if value != "" {
    if link-type != "" {
      link(link-type + value)[#(prefix + value)]
    } else {
      value
    }
  }
}

#let __dates_helper(
  start-date: "",
  end-date: "",
) = {
  if start-date == "" {
    end-date
  } else {
    start-date + " " + sym.dash.em + " " + end-date
  }
}


// -------------- [[ RESUME TEMPLATE ]] --------------

#let resume(
  author: "",
  author-position: left,
  pronouns: "",
  address: "",
  email1: "",
  email2: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  profile-picture: image,
  introduction: "",
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "a4",
  author-font-size: 20pt,
  font-size: 10pt,
  lang: "de",
  body,
) = {

  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: font,
    size: font-size,
    lang: lang,
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false,
  )

  set page(
    margin: (1.5cm),
    paper: paper,
  )

  // Link styles
  show link: underline


  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )

  show link: set text(
    fill: rgb(accent-color),
  )

  // Name will be aligned left, bold and big
  show heading.where(level: 1): it => [
    #set align(author-position)
    #set text(
      weight: 700,
      size: author-font-size,
    )
    #pad(it.body)
  ]

  // Personal information section
  let personal-info(
    pronouns: "",
    phone: "",
    address: "",
    email1: "",
    email2: "",
    github: "",
    linkedin: "",
    personal-site: "",
  ) = {
    let items = (
        __contact_item(pronouns),
        __contact_item(phone, link-type: "tel:"),
        __contact_item(address),
        __contact_item(email1, link-type: "mailto:"),
        __contact_item(email2, link-type: "mailto:"),
        __contact_item(github, link-type: "https://"),
        __contact_item(linkedin, link-type: "https://"),
        __contact_item(personal-site, link-type: "https://"),
      )
    items.filter(x => x != none).join("  |  ")}

  // Profile picture
  let profile(profile-picture: "") = {
    block(
      clip: true,
      stroke: 1pt,
      width: 100pt,
      height: 100pt,
      profile-picture,
    )
  }

  pad(bottom: 12pt,
    grid(
      columns: (auto, auto),
      rows: 100pt,
      gutter: 40pt,
      [
        = #(author)
        
        #{personal-info(
            pronouns: pronouns, 
            phone: phone, 
            address: address, 
            email1: email1, 
            email2: email2, 
            github: github, 
            linkedin: linkedin, 
            personal-site: personal-site
            )
          }

        #(introduction)
      ],

      align(right + horizon)[
        #{profile(profile-picture: profile-picture)}
      ],
    )
  )

  // Main body.
  set par(justify: true)

  body
}

// -------------- [[ RESUME ENTRIES ]] --------------

// Section components below
#let resume-education(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
  // Makes dates on upper right like rest of components
  consistent: false,
) = {
  if consistent {
    // constant style (dates top-right, location bottom-right)
    __generic_two_by_two(
      top-left: strong(institution),
      top-right: dates,
      bottom-left: emph(degree),
      bottom-right: emph(location),
    )
  } else {
    // original style (location top-right, dates bottom-right)
    __generic_two_by_two(
      top-left: strong(institution),
      top-right: location,
      bottom-left: emph(degree),
      bottom-right: emph(dates),
    )
  }
}

#let resume-work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  __generic_two_by_two(
    top-left: strong(title),
    top-right: dates,
    bottom-left: company,
    bottom-right: emph(location),
  )
}

#let resume-project(
  role: "",
  name: "",
  url: "",
  dates: "",
  location: "",
  company: "",
) = {
  __generic_two_by_two(
    top-left: {
      if role == "" {
        [*#name* #if url != "" and dates != "" [ (#link("https://" + url)[#url])]]
      } else {
        [*#role*, #name #if url != "" and dates != ""  [ (#link("https://" + url)[#url])]]
      }
    },
    top-right: {
      if dates == "" and url != "" {
        link("https://" + url)[#url]
      } else {
        dates
      }
    },
    bottom-left: company,
    bottom-right: emph(location)
  )
}

#let resume-certificate(
  name: "",
  issuer: "",
  url: "",
  date: "",
) = {
  [
    *#name*, #issuer
    #if url != "" {
      [ (#link("https://" + url)[#url])]
    }
    #h(1fr) #date
  ]
}

#let resume-extracurricular(
  activity: "",
  dates: "",
) = {
  __generic_one_by_two(
    left: strong(activity),
    right: dates,
  )
}