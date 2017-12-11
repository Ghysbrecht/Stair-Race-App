FROM ruby:2.3.0
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

#Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT
COPY ./db/docker.sqlite3 $APP_ROOT/db/development.sqlite3
COPY ./db/docker.sqlite3 $APP_ROOT/db/production.sqlite3
run rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
