# Dockerize Rails Template

## Run in local:
- Requirements: Docker, Docker Compose
- `cd repo`
- `docker-compose build web`
- `docker-compose run --rm web rails db:create db:migrate`
- Test record data run below:
- `docker-compose run --rm web rails runner 'Joke.create(body: "Knock! Knock! Whos there? Owls say. Owls say who? Yes, they do.")'`
- start your application server with `docker-compose up web` and go to `localhost:3000`

## Steps to deploy on heroku:
- Requirements: Heroku CLI
  ```
  $ heroku create
  $ heroku container:login
  $ heroku container:push web
  $ heroku container:release web
  ```
- we need to setup a postgres database manually using:
  `$ heroku addons:create heroku-postgresql:hobby-dev`
- set some environment variables
  `$ heroku config:set RAILS_ENV=production SECRET_KEY_BASE=supersecret RAILS_LOG_TO_STDOUT=true`
- `$ heroku run rails db:migrate`
- `$ heroku run rails runner 'Joke.create(body: "Knock! Knock! Whos there? Owls say. Owls say who? Yes, they do.")'`
- `$ heroku open`
