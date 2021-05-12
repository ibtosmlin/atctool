#!user/bin/bash

# atc bash for ~/.bashrc
touch ~/.bashrc


echo '# onlinejudegepath' >> ~/.bashrc
echo 'export PATH="/home/ibtosm/.local/bin:$PATH"' >> ~/.bashrc

echo '# atc alias' >> ~/.bashrc

echo 'alias atc="source ~/work/zgit/atctool/atc.sh"'
echo 'alias atp="source ~/work/zgit/atctool/atp.sh"'
echo 'alias atps="source ~/work/zgit/atctool/atps.sh"'
echo 'alias atpc="source ~/work/zgit/atctool/atpc.sh"'
echo 'alias cdat="cd ~/work/atc/prac"'
echo 'alias bkup="source ~/work/zgit/atctool/bkup.sh"'

echo 'alias testpy="python3 ~/work/tmp/test.py"'
echo 'alias testsh="~/work/tmp/test.sh"'
echo 'alias testcp="~/work/tmp/testcp.sh"'
