#!/bin/bash
echo "Running tests, this should take somewhere between 4:02-11:37 minutes to complete during which there will be no output."

COUNT=10
TIMEOUT=30

# List of all pool addresses tested by this script
EA1=us1.ethermine.org
EA2=us2.ethermine.org
EA3=asia1.ethermine.org
EA4=eu1.ethermine.org
NA1=eth-us-east1.nanopool.org
NA2=eth-us-west1.nanopool.org
NA3=eth-eu1.nanopool.org
NA4=eth-eu2.nanopool.org
NA5=eth-asia1.nanopool.org
NA6=eth-jp1.nanopool.org
NA7=eth-au1.nanopool.org
TA1=eth.2miners.com
TA2=us-eth.2miners.com
TA3=asia-eth.2miners.com
FA1=eth-us-east.flexpool.io
FA2=eth-us-west.flexpool.io
FA3=eth-de.flexpool.io
FA4=eth-se.flexpool.io
FA5=eth-sg.flexpool.io
FA6=eth-au.flexpool.io
FA7=eth-br.flexpool.io
HA1=eth.ethashpool.com

# Get IP used for mining
EI1=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${EA1}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
EI2=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${EA2}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
EI3=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${EA3}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
EI4=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${EA4}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
NI1=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${NA1}:9999 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
NI2=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${NA2}:9999 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
NI3=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${NA3}:9999 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
NI4=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${NA4}:9999 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
NI5=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${NA5}:9999 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
NI6=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${NA6}:9999 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
NI7=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${NA7}:9999 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
TI1=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${TA1}:2020 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
TI2=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${TA2}:2020 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
TI3=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${TA3}:2020 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
FI1=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${FA1}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
FI2=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${FA2}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
FI3=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${FA3}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
FI4=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${FA4}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
FI5=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${FA5}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
FI6=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${FA6}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
FI7=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${FA7}:4444 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")
HI1=$(timeout ${TIMEOUT} ./stratum-ping -c 1 ${HA1}:3939 | grep PING | sed -e "s/).*//" | sed -e "s/.*(//")

# Get geolocation of IP, https not available for free with this API
EC1=$(curl -s http://ip-api.com/json/${EI1}?fields=country | jq -r '.country')
EC2=$(curl -s http://ip-api.com/json/${EI2}?fields=country | jq -r '.country')
EC3=$(curl -s http://ip-api.com/json/${EI3}?fields=country | jq -r '.country')
EC4=$(curl -s http://ip-api.com/json/${EI4}?fields=country | jq -r '.country')
NC1=$(curl -s http://ip-api.com/json/${NI1}?fields=country | jq -r '.country')
NC2=$(curl -s http://ip-api.com/json/${NI2}?fields=country | jq -r '.country')
NC3=$(curl -s http://ip-api.com/json/${NI3}?fields=country | jq -r '.country')
NC4=$(curl -s http://ip-api.com/json/${NI4}?fields=country | jq -r '.country')
NC5=$(curl -s http://ip-api.com/json/${NI5}?fields=country | jq -r '.country')
NC6=$(curl -s http://ip-api.com/json/${NI6}?fields=country | jq -r '.country')
NC7=$(curl -s http://ip-api.com/json/${NI7}?fields=country | jq -r '.country')
TC1=$(curl -s http://ip-api.com/json/${TI1}?fields=country | jq -r '.country')
TC2=$(curl -s http://ip-api.com/json/${TI2}?fields=country | jq -r '.country')
TC3=$(curl -s http://ip-api.com/json/${TI3}?fields=country | jq -r '.country')
FC1=$(curl -s http://ip-api.com/json/${FI1}?fields=country | jq -r '.country')
FC2=$(curl -s http://ip-api.com/json/${FI2}?fields=country | jq -r '.country')
FC3=$(curl -s http://ip-api.com/json/${FI3}?fields=country | jq -r '.country')
FC4=$(curl -s http://ip-api.com/json/${FI4}?fields=country | jq -r '.country')
FC5=$(curl -s http://ip-api.com/json/${FI5}?fields=country | jq -r '.country')
FC6=$(curl -s http://ip-api.com/json/${FI6}?fields=country | jq -r '.country')
FC7=$(curl -s http://ip-api.com/json/${FI7}?fields=country | jq -r '.country')
HC1=$(curl -s http://ip-api.com/json/${HI1}?fields=country | jq -r '.country')

# Calculate mining ping using 2miners/stratum-ping
ER1=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${EI1}:4444 | tail -1 | awk '{print $4}')
ER2=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${EI2}:4444 | tail -1 | awk '{print $4}')
ER3=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${EI3}:4444 | tail -1 | awk '{print $4}')
ER4=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${EI4}:4444 | tail -1 | awk '{print $4}')
NR1=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${NI1}:9999 | tail -1 | awk '{print $4}')
NR2=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${NI2}:9999 | tail -1 | awk '{print $4}')
NR3=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${NI3}:9999 | tail -1 | awk '{print $4}')
NR4=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${NI4}:9999 | tail -1 | awk '{print $4}')
NR5=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${NI5}:9999 | tail -1 | awk '{print $4}')
NR6=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${NI6}:9999 | tail -1 | awk '{print $4}')
NR7=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${NI7}:9999 | tail -1 | awk '{print $4}')
TR1=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${TI1}:2020 | tail -1 | awk '{print $4}')
TR2=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${TI2}:2020 | tail -1 | awk '{print $4}')
TR3=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${TI3}:2020 | tail -1 | awk '{print $4}')
FR1=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${FI1}:4444 | tail -1 | awk '{print $4}')
FR2=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${FI2}:4444 | tail -1 | awk '{print $4}')
FR3=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${FI3}:4444 | tail -1 | awk '{print $4}')
FR4=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${FI4}:4444 | tail -1 | awk '{print $4}')
FR5=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${FI5}:4444 | tail -1 | awk '{print $4}')
FR6=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${FI6}:4444 | tail -1 | awk '{print $4}')
FR7=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${FI7}:4444 | tail -1 | awk '{print $4}')
HR1=$(timeout ${TIMEOUT} ./stratum-ping -c ${COUNT} ${HI1}:3939 | tail -1 | awk '{print $4}')

# Echo results in table
echo ""
printf "%-12s %-15s %-15s %-18s %-30s\n" "Pool" "Geo" "Latency" "IP" "Address"
POOL=Ethermine
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${EC1}" "${ER1%?}" "${EI1}" "${EA1}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${EC2}" "${ER2%?}" "${EI2}" "${EA2}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${EC3}" "${ER3%?}" "${EI3}" "${EA3}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${EC4}" "${ER4%?}" "${EI4}" "${EA4}"
POOL=Nanopool
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${NC1}" "${NR1%?}" "${NI1}" "${NA1}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${NC2}" "${NR2%?}" "${NI2}" "${NA2}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${NC3}" "${NR3%?}" "${NI3}" "${NA3}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${NC4}" "${NR4%?}" "${NI4}" "${NA4}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${NC5}" "${NR5%?}" "${NI5}" "${NA5}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${NC6}" "${NR6%?}" "${NI6}" "${NA6}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${NC7}" "${NR7%?}" "${NI7}" "${NA7}"
POOL=2Miners
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${TC1}" "${TR1%?}" "${TI1}" "${TA1}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${TC2}" "${TR2%?}" "${TI2}" "${TA2}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${TC3}" "${TR3%?}" "${TI3}" "${TA3}"
POOL=Flexpool
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${FC1}" "${FR1%?}" "${FI1}" "${FA1}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${FC2}" "${FR2%?}" "${FI2}" "${FA2}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${FC3}" "${FR3%?}" "${FI3}" "${FA3}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${FC4}" "${FR4%?}" "${FI4}" "${FA4}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${FC5}" "${FR5%?}" "${FI5}" "${FA5}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${FC6}" "${FR6%?}" "${FI6}" "${FA6}"
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${FC7}" "${FR7%?}" "${FI7}" "${FA7}"
POOL=Ethashpool
printf "%-12s %-15s %-15s %-18s %-30s\n" "${POOL}" "${HC1}" "${HR1%?}" "${HI1}" "${HA1}"