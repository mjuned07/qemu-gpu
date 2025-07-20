wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin
mkdir -p ~/.config/ngrok
wget https://raw.githubusercontent.com/mjuned07/qemu-gpu/refs/heads/main/ngrok.yml -O ~/.config/ngrok/ngrok.yml
read -p "Paste authtoken here: " CRP
ngrok config add-authtoken $CRP
mkdir -p windows && cd windows
wget https://raw.githubusercontent.com/mjuned07/qemu-gpu/refs/heads/main/compose.yml
apt-get install docker-ce docker-ce-cli
docker compose up -d
ngrok start --all --log=stdout
