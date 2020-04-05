#!user/bin/bash
# コピー
cp -i ./atc.sh ~/.local/bin/
mkdir -p ~/work/atc/templates
cp -i ./templates/*.* ~/work/atc/templates

# atc bash for ~/.bashrc
touch ~/.bashrc
echo '# atc alias' >> ~/.bashrc
echo 'alias atcd="source atc.sh d"' >> ~/.bashrc
echo 'alias atcs="source atc.sh s"' >> ~/.bashrc
echo 'alias atct="source atc.sh t"' >> ~/.bashrc
echo 'alias atcc="source atc.sh c"' >> ~/.bashrc
echo 'alias atcl="source atc.sh l"' >> ~/.bashrc
echo 'alias atcz="source atc.sh z"' >> ~/.bashrc
