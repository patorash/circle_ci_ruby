FROM circleci/ruby:2.4.2-node-browsers
MAINTAINER patorash <chariderpato@gmail.com>
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
  && sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/postgresql.list' \
  && sudo apt-get update \
  && sudo apt-get --purge remove imagemagick \
  && sudo apt-get install --force-yes -y \
       postgresql-client-9.5 \
       libcups2=1.7.5-11+deb8u2 \
       libcups2-dev \
       libcupsimage2 \
       libcupsfilters-dev \
       libcupsimage2-dev \
       libgs9 \
       libgs-dev \
       ghostscript \
       fontconfig \
       fonts-migmix \
       imagemagick \
  && sudo apt-get upgrade \
  && sudo apt-get clean \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo rm /usr/local/lib/ruby/gems/2.4.0/specifications/default/bundler-1.16.0.gemspec \
  && sudo gem uninstall bundler -a -x \
  && sudo gem install bundler --version 1.15.4
