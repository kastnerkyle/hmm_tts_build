# https://ubuntuforums.org/archive/index.php/t-751169.html
# https://ubuntuforums.org/showthread.php?t=2271517
pushd .
SCRIPT=`readlink -f ${BASH_SOURCE[0]} || greadlink -f ${BASH_SOURCE[0]}`
SCRIPTPATH=`dirname "$SCRIPT"`
mkdir -p $SCRIPTPATH/hts
cp -pr $SCRIPTPATH/*.tar.gz $SCRIPTPATH/hts
cd $SCRIPTPATH/hts
# originals downloaded here
#wget -c http://downloads.sourceforge.net/hts-engine/hts_engine_API-1.09.tar.gz
#wget -c http://downloads.sourceforge.net/hts-engine/flite%2Bhts_engine-1.06.tar.gz
#wget -c http://downloads.sourceforge.net/hts-engine/hts_voice_cmu_us_arctic_slt-1.05.tar.gz
for i in *.gz; do
    tar xzf "$i"
done
cd hts_engine_API-1.09/
./configure
make
cd ..
cd flite+hts_engine-1.06/

./configure \
     --with-hts-engine-header-path="$SCRIPTPATH"/hts/hts_engine_API-1.09/include \
     --with-hts-engine-library-path="$SCRIPTPATH"/hts/hts_engine_API-1.09/lib
make
popd
