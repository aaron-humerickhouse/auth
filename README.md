# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Setup
### System Requirements
Follow instructions for [installing postgresql](https://www.if-not-true-then-false.com/2012/install-postgresql-on-fedora-centos-red-hat-rhel/)

```
sudo dnf install postgresql-contrib
```

### Application Reqirements
```
gem install foreman
```

### Running the application
```
bundle
rake db:setup
foreman start
```

Server starts on 3001
