FROM jekyll/jekyll:4

WORKDIR /srv/jekyll

COPY . .

# Ensure the jekyll user has write permissions
RUN chown -R jekyll:jekyll /srv/jekyll

USER jekyll

# Install dependencies
RUN bundle install

# Build the site
RUN jekyll build

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0"]