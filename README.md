# Games App

Online gaming portal for playing tic tac toe. Made with Ruby on Rails, HTML 5, CSS3

## Live site

<http://games.louiechristie.com>

## Setup Locally

Clone the repo

```shell
rake db:setup
```

### Restore a Postgres database backup (if you have a one)

```shell
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U <username> -d games_app_development latest.dump
```

### Run

```shell
bin/rails server
```

## Setup on Heroku

```shell
heroku run rake db:setup --app <app-name>
```

```shell
heroku run rake db:migrate --app <app-name>
```
