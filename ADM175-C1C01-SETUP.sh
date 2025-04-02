# revoke license on bigip1
sudo ssh 192.168.1.31 tmsh revoke sys license

# confirm bigip1 is INOPERATIVE and then ModuleNotLicensed::LICENSE INOPERATIVE before resetting to factory default
#  ~you need to do this twice-occasionally this command fails mid-way thru execution~
#  ~however, if it works the first time, the second will fail because ssh no longer works~
sleep 5
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "INOPERATIVE" ] && break; sleep 5; done
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "ModuleNotLicensed::LICENSE INOPERATIVE" ] && break; sleep 5; done
sudo ssh 192.168.1.31 tmsh load sys config default
 
# grab a reg key from GitHub, disable debugging for curl so token isn't saved in log file
labdir=/home/student/Desktop/Lab_Files
mkdir $labdir
filename=$(date +ltm-reg-key-%Y-%m.txt)
set +x
curl --silent --output $labdir/ltm-reg-key.txt -H "Authorization: token $TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/$filename
echo curl --silent --output $labdir/ltm-reg-key.txt -H "Authorization: token XXXXXXXXXXXXXXXXXX" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/$filename
