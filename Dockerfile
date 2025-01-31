FROM jekyll/jekyll:4

WORKDIR /srv/jekyll

COPY . .

# Change ownership of the files to the jekyll user
RUN chown -R jekyll:jekyll /srv/jekyll

USER jekyll

# Ensure the jekyll user has write permissions
RUN chmod -R u+w /srv/jekyll

# Install a specific version of bundler
RUN gem install bundler -v 2.3.26

# Install dependencies
RUN bundle install

# Build the site
RUN jekyll build

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0"]