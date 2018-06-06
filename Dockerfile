FROM ruby:2.3.3
#FROM technekes/heroku-toolbelt

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client  nodejs
# Define where our application will live inside the image
#RUN apt-get update
#RUN apt-get install -y xvfb fluxbox x11vnc dbus libasound2 libqt4-dbus libqt4-network libqtcore4 libqtgui4 libxss1 libpython2.7 libqt4-xml libaudio2 libmng1 fontconfig liblcms1 lib32stdc++6 lib32asound2 ia32-libs libc6-i386 lib32gcc1 nano
#RUN apt-get install -y python-gobject-2
#RUN apt-get install -y curl git
#RUN xvfb-run --server-args='-screen 0, 1024x768x16' google-chrome -start-maximized > /dev/null &
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#RUN apt-get update

ARG CHROME_VERSION="google-chrome-stable"

ENV DEBIAN_FRONTEND noninteractive

ENV buildDependencies wget unzip

RUN apt-get update -yqq && apt-get install -fyqq ${buildDependencies}

#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
#  && apt-get update -qqy \
#  && apt-get -qqy install \
#    ${CHROME_VERSION:-google-chrome-stable} \
#  && rm /etc/apt/sources.list.d/google-chrome.list \
#  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
#  && google-chrome --version

#RUN  wget --no-check-certificate https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip \
#  && unzip chromedriver_linux64.zip \
#  && rm chromedriver_linux64.zip \
#  && mv -f chromedriver /usr/local/share/ \
#  && chmod +x /usr/local/share/chromedriver \
#  && ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver \
#  && chromedriver -v
RUN apt-get -y install libcurl3 libnspr4-0d libxss1 gconf-service libasound2 libatk1.0-0 libcups2 libdbus-1-3 libgconf-2-4 libgtk-3-0 libx11-xcb1 libxcomposite1 fonts-liberation libappindicator1 libnss3 xdg-utils xvfb
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
#RUN apt-get  install -y xvfb x11vnc x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps

#ADD xvfb_init /etc/init.d/xvfb
#RUN chmod a+x /etc/init.d/xvfb
#ADD xvfb_daemon_run /usr/bin/xvfb-daemon-run
#RUN chmod a+x /usr/bin/xvfb-daemon-run
RUN Xvfb :0 -ac -screen 0 1024x768x24 &

ENV RAILS_ROOT /docker_app
 
# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids
 
# Set our working directory inside the image
WORKDIR $RAILS_ROOT
 
# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile
 
COPY Gemfile.lock Gemfile.lock
 
# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler
RUN git config --global url."https://".insteadOf git://
ENV LANG C.UTF-8
COPY . .
# Finish establishing our Ruby enviornment

#COPY . ~/.netrc
RUN bundle install

EXPOSE 3000
# Copy the Rails application into place



