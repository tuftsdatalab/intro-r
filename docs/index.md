---
binder_popup: "[binder-link]{:target='_blank'}"
binder_button: "[![Launch Binder](https://mybinder.org/badge_logo.svg)][binder-link]{:target='_blank'}"
github_button: "[![View on Github](../badges/github.svg)][repo-link]"
zipball_button: "[![Download Zip](../badges/zip.svg)][zipball-link]"
tarball_button: "[![Download TarGz](../badges/tgz.svg)][tarball-link]"
---

{{ page.zipball_button }}&nbsp;
{{ page.tarball_button }}&nbsp;
{{ page.github_button }}&nbsp;
{{ page.binder_button }}&nbsp;
![last updated][last-updated-badge]&nbsp;
[![datalab.tufts.edu](../badges/datalab.svg)](https://sites.tufts.edu/datalab)

**A Tufts University Data Lab Workshop**\
Written by {{ site.author }}

Resources: [go.tufts.edu/{{ site.resources }}](https://go.tufts.edu/{{ site.resources }})\
Slides: [tufts.box.com/v/{{ site.slides }}](https://tufts.box.com/v/{{ site.slides }})\
Live offerings: [go.tufts.edu/workshops](https://go.tufts.edu/workshops)\
Contact: <datalab-support@elist.tufts.edu>

---
## Table of Contents {#toc}

- [Workshop Overview](#overview)
- [Running the Workshop using a Local R and RStudio Installation](#local)
- [Running the Workshop using RStudio Server in your Browser](#binder)

---
## Workshop Overview {#overview}

<!-- DO NOT CHANGE ANYTHING ABOVE THIS LINE -->

An introductory R workshop that is suitable for self-guided study and covers the following:

- **Variables** and **datatypes**
- Working with **vectors** (arrays) and **lists**
- Commands for **descriptive statistics**
- Reading **data** from a **file**
- Working with **data frames**
- Basic **data wrangling** (cleaning)
- Creating and tweaking **visualizations**
- R **packages** and the **tidyverse**

<!-- DO NOT CHANGE ANYTHING BELOW THIS LINE -->

---
## Running the Workshop using a Local R and RStudio Installation {#local}

{{ page.zipball_button }}&nbsp;
{{ page.tarball_button }}

1. Make sure you have **both R and RStudio** installed. Instructions are available here: [go.tufts.edu/installingR](https://go.tufts.edu/installingR)
2. Click on the [**Download Zip**][zipball-link] or [**Download TarGz**][tarball-link] button above to download an archive containing the workshop materials.
3. Extract the `{{ site.repo }}-workshop` directory contained within the archive to a suitable location.
4. Open the extracted `{{ site.repo }}-workshop` directory and ensure it contains `{{ site.file }}` along with other files.
5. *Right-click* on `{{ site.file }}` and select ***Open With > RStudio*** to launch the workshop.

---
## Running the Workshop using RStudio Server in your Browser {#binder}

{{ page.binder_button }}

1. Click on the [**Launch Binder**]{{ page.binder_popup }} button above.
2. A Binder instance will launch in a new tab with the message *Starting Repository*.
3. Wait patiently and do not close the Binder tab. After a few minutes, an **RStudio** instance will launch.
4. Once **RStudio** has launched, locate the *Files* tab in the bottom-right. It should list `{{ site.file }}` along with other files.
5. Click on `{{ site.file }}` in the *Files* tab to launch the workshop.


[binder-link]: https://mybinder.org/v2/gh/tuftsdatalab/{{ site.repo }}/binder?urlpath=rstudio
[repo-link]: https://github.com/tuftsdatalab/{{ site.repo }}
[zipball-link]: https://github.com/tuftsdatalab/{{ site.repo }}/archive/workshop.zip
[tarball-link]: https://github.com/tuftsdatalab/{{ site.repo }}/archive/workshop.tar.gz
[last-updated-badge]: https://img.shields.io/github/last-commit/tuftsdatalab/{{ site.repo }}?label=last%20updated
