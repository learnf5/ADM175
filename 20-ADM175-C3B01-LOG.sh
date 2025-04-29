# download config from GitHub and copy and load onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/config_hsl.scf --output /tmp/config_hsl.scf
sudo scp /tmp/config_hsl.scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file config_hsl.scf

# confirm bigip1 is active again
sleep 5
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
