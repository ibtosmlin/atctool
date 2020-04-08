#!user/bin/bash
# コピー
cp -i ~/work/zgit/atctools/atc.sh ~/.local/bin/

mkdir -p ~/work/atc/templates
cp -i ./templates/*.* ~/work/atc/templates

# atc bash for ~/.bashrc
touch ~/.bashrc
echo '# atc alias' >> ~/.bashrc
echo 'alias atc="source atc.sh"' >> ~/.bashrc
