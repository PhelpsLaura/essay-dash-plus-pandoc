# README

#### Essay Dashboard [pandoc]

This is yet another iteration of a web app I've written for myself to have an alternative space to plan and write essays. It's very tuned to my writing style, so isn't the most elegant or useful for anyone operating outside of my brain. That being said, it has been very useful in keeping all of my essay notes in one place and helping me in the writing process. Basically a fork of essay-dash, but with pandoc.


#### Tools used
* Ruby 2.5.3, Rails 5.2.2

* Using [PostgreSQL](https://www.postgresql.org/) as the database

* Using [pandoc-ruby](https://github.com/alphabetum/pandoc-ruby) gem to compile external markdown into documents; requires installation of [Pandoc 2.0](http://pandoc.org/installing.html) for this to work.

* Using [Redcarpet](https://github.com/vmg/redcarpet) gem for internal markdown parsing

* Using [Materialize](http://materializecss.com/about.html) gem for aesthetics, bells, and whistles. (Materialize is my favorite thing.)

#### Done:

* Building Word Doc, PDF, and plain MD!!!

#### TODO:

* Clean formatting

* Add footnotes to database

* Individual File Names <!--(new param? generate from title?)-->

* Finalize Download options



##### More

* If you want to see the *very far from complete* attempt that a friend and I made during a 12-hour hackathon to rebuild this idea from the ground up in a way that makes sense for a wider audience, check out [this repository](https://github.com/PhelpsLaura/essayOrganizer).

* The repository for the original project (without Pandoc) is over [here](https://github.com/PhelpsLaura/essay-dash).
