if [ $# -ne 2 ]; then
    echo "say_it.sh <text to say in quptes> <output_file_wav>"
    echo 'Example: ./say_it.sh "hello world" output.wav'
    exit 1
fi
SCRIPT=`readlink -f ${BASH_SOURCE[0]} || greadlink -f ${BASH_SOURCE[0]}`
SCRIPTPATH=`dirname "$SCRIPT"`
echo $1 > $SCRIPTPATH/tmp.txt
$SCRIPTPATH/hts/flite+hts_engine-1.06/bin/flite_hts_engine -m $SCRIPTPATH/hts/hts_voice_cmu_us_arctic_slt-1.05/cmu_us_arctic_slt.htsvoice -r 1.0 -s 44100 -o $2 $SCRIPTPATH/tmp.txt
rm $SCRIPTPATH/tmp.txt

# https://sourceforge.net/p/hts-engine/mailman/message/20012715/
#Correct command line:

#flite_hts_engine \
#-td trees-dur.inf -tf trees-lf0.inf -tm trees-mcep.inf \
#-md duration.pdf -mf lf0.pdf -mm mcep.pdf \
#-df lf0_sta.win -dm mcep_sta.win \
#-df lf0_dyn.win -dm mcep_dyn.win \
#-df lf0_acc.win -dm mcep_acc.win \
#-o out.wav \
#in.txt

#In hts_engine_API-1.01 and Flite+hts_engine-0.90, you have to use
#'static window file'.

#% cat mcep_sta.win
#1 1.0
#% cat mcep_dyn.win
#3 -0.5 0 0.5
#% cat mcep_acc.win
#3 1 -2 1

#You can try 'Speaker dependent training demo' and get voice.
