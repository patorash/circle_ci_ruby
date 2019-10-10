FROM circleci/ruby:2.6.5-node-browsers
MAINTAINER patorash <chariderpato@gmail.com>
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
  && sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" >> /etc/apt/sources.list.d/postgresql.list' \
  && sudo apt-get update \
  && sudo apt-get --purge remove imagemagick \
  && sudo apt-get install -y \
       postgresql-client-11 \
       ghostscript \
       fontconfig \
       fonts-migmix \
       libpq5 \
  && sudo apt-get upgrade \
  && sudo apt-get clean \
  && sudo rm -rf /var/lib/apt/lists/*