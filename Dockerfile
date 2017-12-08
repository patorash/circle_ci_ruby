FROM circleci/ruby:2.4.2-node-browsers
MAINTAINER patorash <chariderpato@gmail.com>
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
  && sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/postgresql.list' \
  && sudo apt-get update \
  && sudo apt-get install -y \
       postgresql-client-9.5 \
       fontconfig \
       fonts-migmix \
  && sudo apt-get clean \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo gem uninstall -x bundler \
  && sudo gem install -N bundler --version 1.15.4