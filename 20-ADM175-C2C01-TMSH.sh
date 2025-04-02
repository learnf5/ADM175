# copy archive files from GitHub to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/cfg_w_tmsh.scf --output /tmp/cfg_w_tmsh.scf
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/train_base.scf --output /tmp/train_base.scf
curl --silent https://github.com/learnf5/$COURSE_ID/raw/main/train_base_171.ucs --output /tmp/train_base_171.ucs
mv /tmp/train_base_171.ucs /tmp/train_base.ucs
sudo scp /tmp/*.scf 192.168.1.31:/var/local/scf
sudo scp /tmp/train_base.ucs 192.168.1.31:/var/local/ucs

# load/merge archive to bigip1 and pause
sudo ssh 192.168.1.31 tmsh load sys config merge file cfg_w_tmsh.scf
sleep 15

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
