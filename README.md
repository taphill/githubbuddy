# GitHub Buddy

[![Status](https://img.shields.io/badge/status-dev-green)]()
[![Ruby Version](https://img.shields.io/badge/ruby-v3.0.0-red)](https://www.ruby-lang.org/en/downloads/releases/)
[![Rails Version](https://img.shields.io/badge/rails-v6.1.0.0-red)](https://rubyonrails.org/)

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
* [Project Blog](#project-blog)

## Getting Started
<iframe width="560" height="315" src="https://www.youtube.com/embed/oHL7Ymv1hXo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Authenticate with GitHub
<img src="https://i.ibb.co/HpxcpVc/ghb-signin.png" alt="ghb-signin">
<img src="https://i.ibb.co/wNwnpkJ/ghb-auth.png" alt="ghb-auth">

### Sync Your Account
<img src="https://i.ibb.co/b2RyfnK/ghb-sync.png" alt="ghb-sync">
  
### Start Organizing
<img src="https://i.ibb.co/55xzFLh/ghb-tags.png" alt="ghb-tags">

## Overview

GitHub Buddy is an app created with Ruby on Rails and is currently hosted on Heroku. The goal of this project is to provide users with an easier way organize their favorite repos and stay up to date with the latest releases. On a personal note, this project will serve as a deep exploration of rails and webpack for myself while building something I believe people may find useful! The eventual goal is allow folks to contribute to this project and suggest features that will enhance the overall user experience.

### Design
<img src="https://i.ibb.co/k4RfJg5/Git-Hub-Buddy.png" alt="github-buddy-inital-org-chart">

This high level model overview is the initial design for GitHub Buddy and highlights the core functionality of the app. A user will have many repos in their starred list which they will be able to tag and and organize to their liking. Each user will also have a profile and a feed that can link them to the latest releases of the repos they care about most.

## Contribution

Before getting started please take a moment to review our [code of conduct](https://github.com/taphill/githubbuddy/blob/main/CODE_OF_CONDUCT.md).

This application currently uses Rails 6.1.0.0 and Ruby 3.0.0. To contribute please fork this repo and then clone it to your local machine.

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
$ rbenv install 2.7.2
```

After you have installed ruby you can cd into the githubbuddy project directory on you local machine and run
```
$ rbenv local 2.7.2
```

If you run `$ rbenv version` you should see that 2.7.2 is set as the local version!

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

## Project Blog

If you’re curious to follow along with how this project is progressing I will be posting updates [here](PROJECTBLOG.md). These posts will mostly address roadblocks I’ve run into, how I managed to solve them, what I’ve learned, or an other tidbit of information I think someone my find useful.

[Project Blog](PROJECTBLOG.md)
