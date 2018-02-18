#!/bin/bash
# Utility to help with lighting and focusing camera
# Use a browser and navigate to the URL displayed 

cp focus.html /tmp
cd /tmp

ctrl_c() {
        echo "** Trapped CTRL-C"
	kill $!
	exit $?
}

trap ctrl_c INT

# Run a web server to view photo
IP=`hostname -I`
IP=${IP%?}
echo "To see photo, browse to http://$IP:8080/focus.html"
echo "Press Ctrl-C to exit"
echo 
echo
python -m SimpleHTTPServer 8080 &
sleep 5

while true; do
    # TEST CAMERA
    echo "taking photo"
    raspistill -cfx 128:128 -w 1024 -h 768 --awb auto -rot 180 -t 1500 -o image.jpg
done


