FROM ruby:3.4.9-slim-trixie AS jekyll

# installing ruby-full installs Jekyll as per
# https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll

RUN apt-get update && apt-get install -y --no-install-recommends \
    ruby-full \
    build-essential

WORKDIR /site

COPY Gemfile Gemfile.lock _config.yml _localhost.yml ./

RUN gem update --system && bundle install

COPY . .

EXPOSE 4000

ENTRYPOINT [ "jekyll" ]

CMD [ "--help" ]

# build from the image we just built with different metadata
FROM jekyll AS jekyll-serve

# bundle exec jekyll serve --config _config.yml,_localhost.yml
CMD [ "bundle", "exec", "jekyll", "serve", "--config", "_config.yml,_localhost.yml" ]
