# Install ruby
FROM ruby:alpine

# install required packages for rails
RUN apk add --update build-base postgresql-dev tzdata
RUN gem install rails -v '5.2.2'

# specify work directory
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# copy directory and run command
COPY . .
CMD ["puma"]
