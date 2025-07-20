wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin
mkdir -p ~/.config/ngrok
wget https://raw.githubusercontent.com/mjuned07/qemu-gpu/refs/heads/main/ngrok.yml -O ~/.config/ngrok/ngrok.yml
read -p "Paste authtoken here: " CRP
ngrok config add-authtoken $CRP
mkdir -p windows && cd windows
wget https://raw.githubusercontent.com/mjuned07/qemu-gpu/refs/heads/main/compose.yml

pip install udocker
udocker --allow-root install

udocker --allow-root run -it --rm --name windows -p 8006:8006 --device=/dev/kvm --device=/dev/net/tun --cap-add NET_ADMIN -v "${PWD:-.}/windows:/storage" --stop-timeout 120 dockurr/windows
ngrok start --all --log=stdout
