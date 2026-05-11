FROM ruby:3.1-slim AS base

# Installiere notwendige Pakete
RUN apt-get update && apt-get install -y \ 
    git \ 
    unzip \ 
    locales \ 
    locales-all \ 
    wget \ 
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=de_DE:de
ENV LC_ALL=de_DE.UTF-8

# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US.UTF-8
# ENV LC_ALL en_US.UTF-8

COPY Gemfile ./
RUN bundle install

COPY . .

FROM base AS final

WORKDIR /usr/src/app

CMD ["bundle", "exec", "rake"]