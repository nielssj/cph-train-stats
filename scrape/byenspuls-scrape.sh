TIME=$(date +"%H:%M:%S")
CURL="curl 'http://www.dsb.dk/Rejseplan/bin/query.exe/mny?look_minx=815529&look_maxx=21744484&look_miny=52369836&look_maxy=59216104&tpl=trains2json3&look_json=yes&performLocating=1&look_requesttime=$TIME&look_nv=get_ageofreport|yes|get_rtmsgstatus|yes|get_rtfreitextmn|yes|interval|30000|intervalstep|2000|get_nstop|yes|get_pstop|yes|get_stopevaids|yes|tplmode|trains2json3|cats|001,002,007,008,009,014,015,016,039,040,048,057,058,097,098,004,005,029,030,031,099,006&interval=30000&intervalstep=2000&' -X POST -H 'Cookie: backend42=web; dsbREQcustomerProfileFlag=customerProfileFlag%3D0%26; dsbMYHAFASprofileContextS=profileContextS%3DunknownContext%26; dsbMYHAFASdbStatusParameter=dbstatus%3Dyellow%26' -H 'Origin: http://www.dsb.dk' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Accept-Language: en-US,en;q=0.8,da;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36' -H 'Content-type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: text/javascript, text/html, application/xml, text/xml, */*' -H 'X-Prototype-Version: 1.5.0' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H 'Referer: http://www.dsb.dk/Rejseplan/bin/help.exe/mn?L=vs_livemap&tpl=fullscreenmap&view=dsb' -H 'Content-Length: 0' --compressed"
OUTFILE="data/"$(date +%y%m%d-%H%M%S)"-byenspuls.json"

mkdir "data"
echo "[" >> $OUTFILE
while :
do
	eval "$CURL" >> $OUTFILE
	echo "," >> $OUTFILE
	sleep 30
done