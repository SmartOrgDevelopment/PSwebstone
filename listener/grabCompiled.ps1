$deployToDir = 'C:\Users\admin2\Desktop\udpListner_Release'
$deployFromDir = 'C:\data\dev\pn4_components\components\components\UDPcommunications\try-ait-UDP\listener\bin\Release'

cd $deployToDir

rm *.exe
rm *.pdb
rm *.xml
rm *.manifest
rm *.dll

cp -Force -Recurse $deployFromDir $deployToDir
cd ./Release
ls









