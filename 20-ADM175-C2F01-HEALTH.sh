# download the config from GitHub; copy and load/merge the config to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/monitor_app_health.scf --output /tmp/monitor_app_health.scf
sudo scp /tmp/monitor_app_health.scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file monitor_app_health.scf

# confirm bigip1 is active again
sleep 15
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
