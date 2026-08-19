FROM ruby:3.3-alpine3.24 AS builder
WORKDIR /app
ARG BUNDLER_VERSION="4.0.18"
# install build deps
RUN apk --no-cache add build-base ruby-dev && gem install bundler -v $BUNDLER_VERSION
COPY Gemfile Gemfile.lock /app/
RUN bundle install

FROM ruby:3.3-alpine3.24 AS runtime
WORKDIR /app
# install runtime deps
RUN apk add --no-cache libstdc++
# copy deps
COPY --from=builder /usr/local/bundle /usr/local/bundle
# launch server
EXPOSE 4000
ENTRYPOINT ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0"]