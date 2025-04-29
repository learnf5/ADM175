# download config from github and copy and load/merge it onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/src_addr_affin_persist.scf --output /tmp/src_addr_affin_persist.scf
sudo scp /tmp/src_addr_affin_persist.scf 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file src_addr_affin_persist.scf

# download config from GitHub and copy and load/merge to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/mng_obj_state.scf --output /tmp/mng_obj_state.scf
sudo scp /tmp/mng_obj_state.scf 192.168.1.31:/var/local/scf

### WE MAY NEED TO SAVE THIS FOR THE SECOND OF TWO LABS (OBJECT)
###sudo ssh 192.168.1.31 tmsh load sys config merge file mng_obj_state.scf

# confirm bigip1 is active 
sleep 5
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
