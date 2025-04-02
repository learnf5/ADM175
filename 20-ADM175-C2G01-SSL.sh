# download config from github, copy and load/merge it to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/#COURSE_ID/main/ssl_offload.scf --output /tmp/ssl_offload.scf
sudo scp /tmp/ssl_offload.scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file ssl_offload.scf

# confirm bigip1 is active again
sleep 5
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
