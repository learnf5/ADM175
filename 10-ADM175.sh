# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# copy archive files from GitHub to bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/train_base_175.ucs --output /home/student/Desktop/Lab_Files/train_base.ucs
sudo scp /home/student/Desktop/Lab_Files/train_base.ucs 192.168.1.31:/var/local/ucs/
