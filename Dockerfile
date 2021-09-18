FROM nikolaik/python-nodejs:latest

RUN apt update
RUN apt-get install -y sudo
RUN apt-get install qemu-system-x86 -y
RUN rm -rf /var/lib/apt/lists/*
RUN sudo su
RUN echo "Download windows files"
RUN wget -O w7x64.img https://bit.ly/akuhnetw7X64
RUN echo "Download ngrok"
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
RUN ./ngrok authtoken 1p0oQSuvZdvucysO6OXmQVAPRFB_5Mc9VZDuQYFMRtf42fVCv
RUN nohup ./ngrok tcp 3388 &>/dev/null &
RUN qemu-system-x86_64 -hda w7x64.img -m 4G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &

COPY . .
CMD ["./w10x64.sh"]