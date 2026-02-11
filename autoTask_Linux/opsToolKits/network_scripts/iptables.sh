#!/bin/bash

SERVDNS1="8.8.8.8"
SERVDNS2="172.31.24.35"
INFC="ens5"

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# udp
iptables -A OUTPUT -p udp -o $INFC -d $SERVDNS1 --sport 1024:65535 --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -o $INFC -d $SERVDNS2 --sport 1024:65535 --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -i $INFC -s $SERVDNS1 --dport 1024:65535 --sport 53 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -i $INFC -s $SERVDNS2 --dport 1024:65535 --sport 53 -m state --state ESTABLISHED -j ACCEPT

#tcp
iptables -A OUTPUT -p tcp -o $INFC -d $SERVDNS1 --sport 1024:65535 --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -o $INFC -d $SERVDNS2 --sport 1024:65535 --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -i $INFC -s $SERVDNS1 --dport 1024:65535 --sport 53 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -i $INFC -s $SERVDNS2 --dport 1024:65535 --sport 53 -m state --state ESTABLISHED -j ACCEPT

# Allow TCP 80/443
iptables -A OUTPUT -p tcp -o $INFC --sport 1024:65535 -m multiport --dports 80,443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -i $INFC --sport 1024:65535 -m multiport --sports 80,443 -m state --state ESTABLISHED -j ACCEPT
