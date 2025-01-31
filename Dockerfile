FROM jekyll/jekyll:4

WORKDIR /srv/jekyll
COPY . .

RUN jekyll build

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0"]
