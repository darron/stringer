FROM octohost/ruby:2.1.6

ENV PORT 3000

RUN mkdir /srv/www

RUN apt-get update ; \
  apt-get install -y make libcurl3 libcurl3-gnutls libcurl4-openssl-dev libpq-dev libsqlite3-dev ; \
  apt-get clean && rm -rf /var/lib/apt/lists/*

ADD . /srv/www/

WORKDIR /srv/www

RUN bundle install

EXPOSE 3000

CMD foreman start web
