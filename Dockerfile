FROM ruby:3.3 AS base

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

ARG LANG=de_DE.UTF-8
ARG LANGUAGE=de_DE:de
ARG LC_ALL=de_DE.UTF-8

ENV LANG=$LANG
ENV LANGUAGE=$LANGUAGE
ENV LC_ALL=$LC_ALL

COPY Gemfile ./
RUN bundle install 

COPY . .

FROM base AS final

WORKDIR /usr/src/app

ENTRYPOINT ["bundle", "exec", "rake"]
# CMD ["resume:build_pdf"]