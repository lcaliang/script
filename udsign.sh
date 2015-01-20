#!/bin/bash
#
#
# unzip update.zip ,modify build.prop,zip to update.zip and sign it to update-sign.zip
echo "elangcs"

unzip $1 -d /tmp/update/
buildprop='/tmp/update/system/build.prop'
###############S or R ################
r2s='_S_'
s2r='_R_'
inputstring="ro.build.id
             ro.build.display.id
             ro.build.fingerprint
             ro.build.description
             pwv.sw.version
             pwv.sw.version.inner"
for ele in $inputstring
do
echo $ele
sed -e '/^'$ele'*/ , /'$s2r'/s/'$s2r'/'$r2s'/' -i $buildprop
done
###############sign or not############
sign='true'
sed -e 's/^pwv.custom.sign.*/pwv.custom.sign='$sign'/' -i $buildprop
DATE=`date +%y%m%d`
temp=`pwd`
cd /tmp/update/
zip -ry update_$DATE.zip ./
mv update_$DATE.zip $temp/
cd $temp/
#################should modify if use on other PC
java -Xmx2048m -jar ../../out/host/linux-x86/framework/signapk.jar -w ../../build/target/product/security/testkey.x509.pem ../../build/target/product/security/testkey.pk8 update_$DATE.zip update_$DATE-sign.zip
#source ~/work/env/profile
################end of modify if use on other PC
rm /tmp/update -rf
