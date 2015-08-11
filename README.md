# Programming the City

## Contents

* [Overview](#overview)
* [Dependencies](#dependencies)
* [Compatibility](#compatibility)
* [Development Setup](#development-setup)
* [Production Setup](#production-setup)
* [Deployment](#deployment)
* Additional Documentation
    * [Config Vars](https://github.com/livefront/whos-driving-server/blob/master/doc/config_vars.md)
* [Code Style Guide](#code-style-guide)
## Overview

The app is hosted on Heroku.

* 

### Branches

* `master` is used for local development.
* `stable` reflects a stable, tested version of the app. This branch is deployed to Heroku for staging and production.

## Dependencies

* [See the Gemfile](https://github.com/livefront/whos-driving-server/blob/master/Gemfile)
* Ruby 2.2.2
* Rails 4.2.1
* PostgreSQL

## Compatibility

### Supported Browsers

* Firefox 4+
* Google Chrome
* Safari 6+

## Development Setup

### Configure and install the dependencies

* Install gems with `bundle install`

### Grab the Source

1. Clone the repo:

        $ git clone git@github.com:livefront/whos-driving-server.git
        $ cd whos-driving-server
        $ git checkout -t origin/stable
        $ git checkout master

2. Install the Heroku Toolbelt: https://toolbelt.heroku.com/

3. Add Heroku remote:

        $ git remote add staging git@heroku.com:whos-driving-staging.git

4. Set the default remote for Heroku to `staging`:

        $ git config heroku.remote staging

### App Setup

1. Install dependencies:

        $ bundle install

2. Initialize the db and seed it:

        $ rake db:create
        $ rake db:migrate
        $ rake db:seed

3. Run unit tests:

        $ bundle exec rake spec

4. Start the server:

        $ bundle exec rails server

### Configure Heroku

Repeat these instructions for `whos-driving-staging` and `whos-driving-production`.

1. Follow the steps listed in [Development Setup](#development-setup).
2. Create the Heroku app:

        $ heroku create whos-driving-staging

3. Add Heroku add-ons.

        $ heroku addons:add pgbackups:auto-month --app whos-driving-staging
        $ heroku addons:add heroku-postgresql:dev --app whos-driving-staging

4. Add deploy hooks to send deploy notifications.

        $ heroku addons:add deployhooks:email --recipient "user1@example.com user2@example.com" --subject "{{user}} deployed {{app}}" --body "{{user}} deployed {{app}}\n\nCommit {{head}}\n\n{{git_log}}" --app livefront-status-staging


## Deployment

### Staging

**Note: the following commands assume you've set `whos-driving-staging` as your default Heroku app via the following command: `git config heroku.remote staging`.**

    $ heroku maintenance:on
    $ git push staging stable:master
    $ heroku run rake db:migrate
    $ heroku ps:restart
    $ heroku maintenance:off

### Production

1. Test changes locally.

2. Test changes on staging.

3. Merge changes into the `stable` branch:

        $ git checkout stable
        $ git merge master
        $ git commit -m "Booyah"
        $ git push

4. Deploy to `whos-driving-production`:

        $ heroku maintenance:on --app whos-driving-production
        $ git push production stable:master
        $ heroku run rake db:migrate --app whos-driving-production
        $ heroku ps:restart --app whos-driving-production
        $ heroku maintenance:off --app whos-driving-production
