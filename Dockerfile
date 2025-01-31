FROM jekyll/jekyll:4

WORKDIR /srv/jekyll

COPY . .

# Change ownership of the files to the jekyll user
RUN chown -R jekyll:jekyll /srv/jekyll

USER jekyll

# Ensure the jekyll user has write permissions
RUN chmod -R u+w /srv/jekyll

RUN bundle install
RUN jekyll build

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0"]
