FROM jekyll/builder

WORKDIR /srv/jekyll

COPY Gemfile .
RUN bundle install

COPY . .
RUN jekyll build

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0"]
