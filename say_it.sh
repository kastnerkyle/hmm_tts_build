if [ $# -ne 2 ]; then
    echo "say_it.sh <text to say in quptes> <output_file_wav>"
    echo 'Example: ./say_it.sh "hello world" output.wav'
    exit 1
fi
SCRIPT=`readlink -f ${BASH_SOURCE[0]} || greadlink -f ${BASH_SOURCE[0]}`
SCRIPTPATH=`dirname "$SCRIPT"`
echo $1 > $SCRIPTPATH/tmp.txt
$SCRIPTPATH/hts/flite+hts_engine-1.06/bin/flite_hts_engine -m $SCRIPTPATH/hts/hts_voice_cmu_us_arctic_slt-1.05/cmu_us_arctic_slt.htsvoice -s 44100 -o $2 $SCRIPTPATH/tmp.txt
rm $SCRIPTPATH/tmp.txt
