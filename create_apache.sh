#! /bin/bash
sudo apt update 
sudo apt install apache2 -y
sudo systemctl enable apache2 --now
