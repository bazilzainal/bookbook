# Bookbook Sg

This is the working repo for Bookbook Sg, a web app that stores your book lists
and checks whether it is available for loaning. The current app lives on Heroku
[*here.*](http://bookbooksg.herokuapp.com/)

## Getting Started

The app runs on Ruby on Rails. To run it in your local system, make sure that you
are using Rails version 6.1.3.2 and Ruby version 3.0.1.

Alternatively, you can run these commands to install everything in the Gemfile.

```
$ gem install bundler
$ bundle config set --local without 'production'
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

You may also have to run yarn in order to get things to work:
```
$ yarn
```

Optionally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Libraries
The app relies on the NLBSG library. Further information can be found [*here.*](https://github.com/pest-control/nlbsg)