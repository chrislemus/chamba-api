# README

### Getting started

- install gems with `bundle`
- run migration a with `rails db:migrate`
- seed database with `rails db:seed`
- `rails s` will start the api
- `bin/rails server -p ${PORT:-5000} -e $RAILS_ENV` Heroku deploy command

## Overview

All request made to api will need a auth bearer token, except when creating a new account. App uses JWT to authenticate user.

Front-end repo can be found [here](https://github.com/chrislemus/service-field-crm)
