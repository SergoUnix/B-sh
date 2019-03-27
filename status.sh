if [ $UID -ne 1 ]
then
echo -e "\e[1;32mHostname: \e[0m"$HOSTNAME
echo -e "\e[1;32mIP addres: \e[0m"
ip addr show | grep "inet "  | grep -v  "inet 127" | awk '{print $2}'
echo -e "\e[1;32mLogged user: \e[0m"
who
echo -e "\e[1;32mSystem uptime: \e[0m" $(uptime | awk '{print $3" "$4}' | tr -d ",")
echo -e "\e[1;32mLoad average: \e[0m" $(uptime | awk '{print $10" "$11" "$12}')
echo -e "\e[1;32mRam usages: \e[0m"
free -h | awk '{if (NR==1 || NR==2) print $0}'
echo -e "\e[1;32mSwap usages: \e[0m"
free -h | awk '{if (NR==1 || NR==4) print $0}'
echo -e "\e[1;32mDisk usages: \e[0m"
df -h | awk 'NR==1'
df -h | grep /dev/
fi
