#!user/bin/bash
# コピー
cp -i ~/work/zgit/atctools/atc.sh ~/.local/bin/

mkdir -p ~/work/atc/templates
cp -i ~/work/zgit/atctools/templates/*.* ~/work/atc/templates

cp -i ~/work/zgit/atctools/atp.sh ~/.local/bin/

# atc bash for ~/.bashrc
touch ~/.bashrc
echo '# atc alias' >> ~/.bashrc
echo 'alias atc="source atc.sh"' >> ~/.bashrc
echo 'alias atp="source atp.sh"' >> ~/.bashrc
