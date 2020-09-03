FROM ubuntu:18.04

RUN apt-get update -y
#RUN apt-get upgrade -y
RUN apt-get install wget curl less gnupg -y

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update -y
RUN apt-get install google-chrome-stable -y
RUN apt-get clean

RUN useradd -m dev
USER dev

RUN mkdir ~/.nvm
ENV NVM_DIR=/home/dev/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN ls -la $NVM_DIR/nvm.sh
RUN bash -l -c 'source /home/dev/.nvm/nvm.sh; nvm install node'

RUN mkdir -p /home/dev/app
COPY . /home/dev/app
WORKDIR /home/dev/app
RUN bash -l -c 'source /home/dev/.nvm/nvm.sh; npm install'
RUN bash -l -c 'source /home/dev/.nvm/nvm.sh; npm install forever -g'

ENV PORT="8081"
ENV AWS_ACCESS_KEY_ID="AKIATYYXSQPR5KKPUQJM"
ENV AWS_SECRET_ACCESS_KEY="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"
ENV S3_BUCKET_NAME="btg-prerender-cache"
ENV AWS_REGION="eu-west-1"

EXPOSE 8081

CMD ["/home/dev/.nvm/versions/node/v12.6.0/bin/node", "/home/dev/.nvm/versions/node/v12.6.0/bin/forever", "start", "server.js"]
