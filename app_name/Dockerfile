FROM ruby:2.4.2
ENV LANG C.UTF-8
#RUN yum update -qq && yum install -y build-essential libpq-dev nodejs
RUN gem install bundler
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /app_name
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME