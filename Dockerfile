FROM ruby:2.3.3

EXPOSE 4567

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y \
  build-essential \
  imagemagick \
  git \
  git-core \
  nodejs \
  yarn \
  bash \
  zsh

RUN usr/sbin/useradd --create-home --home-dir /middleman --shell /bin/bash middleman
RUN export LANG=C.UTF-8
RUN export LC_ALL=C.UTF-8
VOLUME /middleman/app/
VOLUME /middleman/scripts/
RUN chmod 777 /middleman/app
RUN chown -R middleman:middleman /middleman


WORKDIR /middleman/app/
RUN echo "export LC_ALL=C.UTF-8" >> /middleman/.bashrc; \
 echo "export LC_ALL=C.UTF-8" >> /middleman/.bash_profile; \
 echo "export LANG=C.UTF-8" >> /middleman/.bashrc; \
 echo "export LANG=C.UTF-8" >> /middleman/.bash_profile; \
 echo 'export PATH="/middleman/.config/yarn/global/node_modules/.bin:$PATH"' >> /middleman/.bashrc; \
 echo 'export PATH="/middleman/.config/yarn/global/node_modules/.bin:$PATH"' >> /middleman/.bash_profile;

RUN rm -Rf .tmp .cache .sass-cache

USER middleman

ENTRYPOINT ["/middleman/scripts/entry.sh"]
