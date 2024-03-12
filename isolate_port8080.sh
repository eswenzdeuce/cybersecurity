#!/bin/bash

# Flush existing rules
iptables -F

# Set default policies
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Drop traffic on port 8080
iptables -A INPUT -p tcp --dport 8080 -j DROP
iptables -A OUTPUT -p tcp --dport 8080 -j DROP

# Save the rules
iptables-save > /etc/iptables.rules.v4