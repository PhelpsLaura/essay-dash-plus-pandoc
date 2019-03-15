# README

#### Essay Dashboard [pandoc]

This is yet another iteration of a web app I've written for myself to have an alternative space to plan and write essays. It's very tuned to my writing style, so isn't the most elegant or useful for anyone operating outside of my brain. That being said, I'm proud of it. It's been very useful in keeping all of my essay notes in one place and helping me get writing. Basically a fork with pandoc


#### Tools used
* Using Ruby 4.2.2, Rails 5.1.4

* Using [PostgreSQL](https://www.postgresql.org/) as the database

* Using [pandoc-ruby](https://github.com/alphabetum/pandoc-ruby) gem to compile external markdown into documents; requires installation of [Pandoc 2.0](http://pandoc.org/installing.html) for this to work.

* Using [Redcarpet](https://github.com/vmg/redcarpet) gem for internal markdown parsing

* Using [Materialize](http://materializecss.com/about.html) gem for aesthetics, bells, and whistles. (Materialize is my favorite thing.)

#### Done:

* Pandoc Ruby implemented; successfully writing .TeX

#### ToDo:

* How to get to PDF?

* How to get a browser to download a file? Rn saving to assets directory

* Finish full formatting so it's not just the body of the essay

* Include other methods for Word Doc, etc

<!-- * Currently deployed [here](http://www.laphelps.me) via [Heroku](https://heroku.com)! The functionality doesn't actually make sense for the internet, but I wanted to throw it up to show what I've been working on. -->


##### More

(If you want to see the *very far from complete* attempt that a friend and I made during a 12-hour hackathon to rebuild this idea from the ground up in a way that makes sense for a wider audience, check out [this repository](https://github.com/PhelpsLaura/essayOrganizer).)

(The repository for the original project (which I couldn't deploy as it's using SQLite) is over [here](https://github.com/PhelpsLaura/essay-prototype).)
