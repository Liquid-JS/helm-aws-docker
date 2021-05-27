#!/bin/sh

odir=$(pwd)
mkdir -p $4
cd $4

skopeo copy --src-creds=$1 docker://$2 dir:tmp
layers=$(jq -r '.layers[] | .digest[7:]' tmp/manifest.json)

for l in $layers
do
    mv tmp/$l tmp/$l.tar.gz
    tar -xvf tmp/$l.tar.gz $3 
done

rm -rf tmp
cd $odir
