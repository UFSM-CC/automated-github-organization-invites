FROM ruby

LABEL maintainer="Crazynds"

WORKDIR /var/prog

RUN apt-get update
RUN apt-get install ruby-dev -y

RUN apt-get -y autoremove \
    && apt-get clean\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./ /var/prog/
COPY Gemfile Gemfile.lock ./

RUN bundle install

EXPOSE 2210
ENTRYPOINT ["bundle", "exec", "ruby", "web_app.rb"]
