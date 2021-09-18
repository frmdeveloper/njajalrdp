FROM nikolaik/python-nodejs:latest

RUN apt update && \
  apt-get install -y \
  neofetch \
  ffmpeg \
  wget \
  tesseract-ocr \
  chromium \
  imagemagick && \
  rm -rf /var/lib/apt/lists/*
RUN pip install pillow

WORKDIR /app
COPY package.json .
RUN npm install -g npm@7.20.5
RUN npm install

COPY . .

CMD ["node", "index.js"]