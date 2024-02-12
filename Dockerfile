FROM ruby:2.7.7

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update &&\
    apt-get install -y nodejs &&\
    npm install -g yarn

WORKDIR /kumazaki-insta-app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
