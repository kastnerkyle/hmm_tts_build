SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo $1 > $SCRIPTPATH/tmp.txt
$SCRIPTPATH/hts/flite+hts_engine-1.06/bin/flite_hts_engine -m $SCRIPTPATH/hts/hts_voice_cmu_us_arctic_slt-1.05/cmu_us_arctic_slt.htsvoice -s 44100 -o output.wav $SCRIPTPATH/tmp.txt
rm $SCRIPTPATH/tmp.txt
