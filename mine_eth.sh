#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eu1.ethermine.org:4444
WALLET=0x12897813341d42F45b6687b311de440781F796dB.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
