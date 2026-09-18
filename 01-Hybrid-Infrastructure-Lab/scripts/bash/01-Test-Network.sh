#!/bin/bash

# Hybrid Infrastructure Lab
# Ubuntu01 network and DNS validation script
# Server: Ubuntu01
# Domain: Conettin.lab

echo "========================================="
echo " Ubuntu01 Infrastructure Check"
echo "========================================="

echo
echo "[1] IPv4 Configuration"
ip -4 addr show eth0

echo
echo "[2] Default Route"
ip route show default

echo
echo "[3] DNS Configuration"
resolvectl dns eth0

echo
echo "[4] Gateway Connectivity"
if ping -c 2 -W 2 192.168.1.1 > /dev/null; then
    echo "Gateway reachable: PASS"
else
    echo "Gateway reachable: FAIL"
fi

echo
echo "[5] DC01 IP Connectivity"
if ping -c 2 -W 2 192.168.1.10 > /dev/null; then
    echo "DC01 reachable: PASS"
else
    echo "DC01 reachable: FAIL"
fi

echo
echo "[6] DC01 DNS Resolution"
DC_IP=$(getent ahostsv4 dc01.conettin.lab | awk 'NR==1 {print $1}')

if [ "$DC_IP" = "192.168.1.10" ]; then
    echo "dc01.conettin.lab -> $DC_IP : PASS"
else
    echo "dc01.conettin.lab -> ${DC_IP:-NOT RESOLVED} : FAIL"
fi

echo
echo "[7] DNS Server Test"
if nslookup dc01.conettin.lab 192.168.1.10 > /dev/null 2>&1; then
    echo "Internal DNS query: PASS"
else
    echo "Internal DNS query: FAIL"
fi

echo
echo "[8] SSH Service"
if systemctl is-active --quiet ssh; then
    echo "SSH service: RUNNING"
else
    echo "SSH service: NOT RUNNING"
fi

echo
echo "========================================="
echo " Validation Completed"
echo "========================================="