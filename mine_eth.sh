#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eu1.ethermine.org:4444
WALLET=0x6c8a06D6DC2A7e711b30F14586E696a832341D16.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
