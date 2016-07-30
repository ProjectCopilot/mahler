FROM python:2.7
MAINTAINER Ankit Ranjan "ankit@copilot.help"

ADD . /usr/src/app
WORKDIR /usr/src/app

# Install Git
VOLUME /.ssh_host
RUN apt-get install -y git && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
RUN  echo "    IdentityFile /.ssh/id_rsa" >> /etc/ssh/ssh_config

# Download the components
WORKDIR components
RUN while read in; do git clone $in; done < projects.lst

WORKDIR /usr/src/app

# Start the components
RUN docker-compose up

RUN pip install -r requirements.txt
CMD [ "python", "./app.py" ]
