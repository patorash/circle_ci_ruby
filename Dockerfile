FROM circleci/ruby:2.4.2-node
MAINTAINER patorash <chariderpato@gmail.com>
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
  && sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/postgresql.list' \
  && wget --quiet -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sudo sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && sudo apt-get update \
  && sudo apt-get install -y \
        postgresql-client-9.5 \
        ghostscript \
        fontconfig \
        fonts-migmix \
        google-chrome-stable \
  && sudo apt-get clean \
  && sudo rm -rf /var/lib/apt/lists/*

# Install Chrome WebDriver
RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    sudo mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    sudo unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION && \
    rm /tmp/chromedriver_linux64.zip && \
    sudo chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver && \
    sudo ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver
