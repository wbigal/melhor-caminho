FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

COPY Gemfile* $APP_HOME/
RUN bundle install

ENV APP_HOME /opt/melhor-caminho
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
