#!user/bin/bash
# コピー
cp -i ./atc.sh ~/.local/bin/
mkdir -p ~/work/atc/templates
cp -i ./templates/*.* ~/work/atc/templates

# atc bash for ~/.bashrc
touch ~/.bashrc
echo '# atc alias' >> ~/.bash
echo 'alias atcd="source atc.sh d"' >> ~/.bash
echo 'alias atcd="source atc.sh s"' >> ~/.bash
echo 'alias atcd="source atc.sh t"' >> ~/.bash
echo 'alias atcd="source atc.sh c"' >> ~/.bash
echo 'alias atcd="source atc.sh l"' >> ~/.bash
echo 'alias atcd="source atc.sh z"' >> ~/.bash
