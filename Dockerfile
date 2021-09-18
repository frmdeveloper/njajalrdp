FROM nikolaik/python-nodejs:latest

RUN apt update
RUN apt-get install -y sudo
RUN rm -rf /var/lib/apt/lists/*
RUN clear
RUN sudo su
RUN wget -O w10x64.sh https://raw.githubusercontent.com/frmdeveloper/njajalrdp/main/w10x64.sh
RUN chmod +x w10x64.sh

CMD ["./w10x64.sh"]