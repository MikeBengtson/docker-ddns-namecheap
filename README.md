Namecheap DDNS Update Docker container
======================================

The idea is to have a docker container to be able to run it into a RaspberryPi, updating your domain as soon as it detects the IP has changed. The update script is based on the one done by Kent Behrends (https://github.com/bci/Namecheap-DDNS-Update). I improved a couple tweks to make it fit better to my needs.

# Create the image

    sudo docker build . -t ddns

# Run the container

    sudo docker run -d --name ddns -v $PWD:/mnt --restart unless-stopped -e DOMAIN="YOUR_DOMAIN" -e PASSWORD="THE_PASSWORD" -e HOSTS="'HOST_NAME'" ddns
