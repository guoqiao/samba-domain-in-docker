#!/bin/bash -x

sudo python3 /usr/local/samba/bin/samba-tool domain provision \
    --use-rfc2307 \
    --server-role=dc \
    --realm="{{SAMBA_REALM}}" \
    --domain="{{SAMBA_DOMAIN}}" \
    --dns-backend="{{samba_dns_backend}}" \
    --backend-store='{{SAMBA_BACKEND_STORE}}' \
    --adminpass='{{SAMBA_PASSWORD}}' \
    --krbtgtpass='{{SAMBA_PASSWORD}}' \
    --machinepass='{{SAMBA_PASSWORD}}' \
    --dnspass='{{SAMBA_PASSWORD}}' \
    --option='dns forwarder={{SAMBA_DNS_FORWARDER}}' \
    --option='kccsrv:samba_kcc=true' \
    --option='ldapserverrequirestrongauth=no'
