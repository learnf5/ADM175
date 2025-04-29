# download config from GitHub and copy and load/merge to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/mng_obj_state.scf --output /tmp/mng_obj_state.scf
sudo scp /tmp/mng_obj_state.scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file mng_obj_state.scf

# confirm bigip1 is active again
sleep 5
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
