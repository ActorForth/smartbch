#!/bin/bash

# check for args
if [ "$#" -ne 1 ]
then
  echo "Please specify introduction such as happyman"
  exit 1
fi

echo "Generating a private key"
# docker-compose run smartbch gen-test-keys -n 10 > test-keys.txt
docker-compose run smartbch gen-test-keys -n 1 --show-address | tee gen-test-keys3.txt
echo

echo "Generating consensus key info"
docker-compose run smartbch generate-consensus-key-info | tee generate-consensus-key-info3.txt
# echo "Init the node, include the keys from the last step as a comma separated list."
# docker-compose run smartbch init mynode --chain-id 0x2711 \
#     --init-balance=10000000000000000000 \
#     --test-keys=`paste -d, -s test-keys.txt` \
#     --home=/root/.smartbchd --overwrite
# echo

# GEN="8307c4b5a9062d70e91638fa9cf422ca83132766f244763466173f694e6b79d9 0x7dB508857382c696A254eDEc46DE38620CaCF2FE"
GEN=$(head -1 gen-test-keys3.txt) #get first line of gen-test-key.txt :string
IFS=' ' #space as delimiter

read -ra BIT <<<"$GEN" #split string into :array name BIT
EOF=${BIT[1]}
K1=$(head -1 generate-consensus-key-info3.txt)
# CPK=$(docker-compose run -w /root/.smartbchd/ smartbch generate-consensus-key-info)
# docker-compose run --entrypoint mv smartbch /root/.smartbchd/priv_validator_key.json /root/.smartbchd/config
# echo

echo "Generate genesis validator info"

docker-compose run smartbch generate-genesis-validator \
    --validator-address=$EOF \
    --consensus-pubkey=$K1 \
    --voting-power=1 \
    --staking-coin=0 \
    --introduction=$1 | tee long-validator-info.txt
echo
echo "Introduction: $1"
echo "Finished!"