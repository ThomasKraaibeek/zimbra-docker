#!/bin/sh
until [ -f /opt/zimbra/zmsetup.*.log ] && [ -f "/opt/zimbra/log/imapd.pid" ] # Zimbra is done setting up and servers are started
do 
    sleep 3
done
echo "Setup finished. Setting up plain auth."
su - zimbra
#zmprov -l sp admin@zimbra.io pass
zmprov -l mcf zimbraReverseProxySendPop3Xoip FALSE
zmprov -l ms zimbra-docker.zimbra.io zimbraReverseProxyPop3SaslPlainEnabled TRUE
zmprov -l ms zimbra-docker.zimbra.io zimbraReverseProxyPop3StartTlsMode on
zmcontrol stop
zmcontrol start