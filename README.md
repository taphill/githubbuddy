# GitHub Buddy

[![Status](https://img.shields.io/badge/status-dev-green)]()
[![Ruby Version](https://img.shields.io/badge/ruby-v3.0.1-red)](https://www.ruby-lang.org/en/downloads/releases/)
[![Rails Version](https://img.shields.io/badge/rails-v6.1.3.1-red)](https://rubyonrails.org/)

A better way to manage your favorite repositories.

## Table of contents

* [Getting Started](#getting-started)
* [Overivew](#overview)
  * [Design](#design)
* [Contribution](#contribution)
  * [PostgreSQL](#postgresql)
  * [Yarn and Node.js](#yarn-and-nodejs)
  * [Ruby](#ruby)
  * [Bundler](#Bundler)

## Getting Started

### Authenticate with GitHub
<img src="https://i.ibb.co/HpxcpVc/ghb-signin.png" alt="ghb-signin">
<img src="https://i.ibb.co/wNwnpkJ/ghb-auth.png" alt="ghb-auth">

### Sync Your Account
<img src="https://i.ibb.co/b2RyfnK/ghb-sync.png" alt="ghb-sync">
  
### Start Organizing
<img src="https://i.ibb.co/55xzFLh/ghb-tags.png" alt="ghb-tags">

## Overview

GitHub Buddy is an app created with Ruby on Rails and is currently hosted on Heroku. The goal of this project is to provide users with an easier way organize their favorite repos and stay up to date with the latest releases. On a personal note, this project will serve as a deep exploration of rails and webpack for myself while building something I believe people may find useful! The eventual goal is allow folks to contribute to this project and suggest features that will enhance the overall user experience.

### Schema
<img src="https://i.ibb.co/2hHBMQK/Screen-Shot-2021-03-24-at-4-03-28-PM.png">

## Contribution

Before getting started please take a moment to review our [code of conduct](https://github.com/taphill/githubbuddy/blob/main/CODE_OF_CONDUCT.md).

This application currently uses Rails 6.1.3.1 and Ruby 3.0.1. To contribute please fork this repo and then clone it to your local machine.

To get your dev environment setup please make sure you have all of the following:

### PostgreSQL

For this project you will need to have PostgreSQL installed. There are a number of ways to do this but the most straight forward is to just download it from their website [here](https://www.postgresql.org/). The most recent version should work fine.

If you're not familiar with working with PostgreSQL you may also find it handy to install [Postico](https://eggerapps.at/postico/), but this is not required. 

### Yarn and Node.js

Rails 6 applications require that you have yarn and node.js installed.

You can find installation instructions for node at the [Node.js website](https://nodejs.org/en/download/) and then run this command to make sure it's installed correctly.
```
$ node --version
```

Per the rails docs, you will need to make sure your node.js version is greater than 8.16.0

You can find installation instructions for yarn at the [Yarn website](https://classic.yarnpkg.com/en/docs/install#mac-stable) and then run this command to make sure it's installed correctly.
```
$ yarn -v
```

### Ruby

My preferred way to manage different ruby versions is with rbenv. To install rbenv follow the installation instructions from the [rbenv repo](https://github.com/rbenv/rbenv#installation)

After you have installed rbenv you can restart your terminal and install ruby! Fair warning this will take about 10-15 minutes so maybe get up and go for a walk, or grab something to eat!
```
$ rbenv install 3.0.1
```

After you have installed ruby you can cd into the githubbuddy project directory on you local machine and run
```
$ rbenv local 3.0.1
```

If you run `$ rbenv version` you should see that 3.0.1 is set as the local version!

### Bundler

Finally, you will need to install bundler
```
$ gem install bundler
```

And then you can install all the dependencies
```
$ bundle install
```

If everything went well you should be able to run this command `$ rails server`, navigate to `http://localhost:3000`, and see the application running locally!
