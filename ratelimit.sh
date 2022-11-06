IPT=/sbin/iptables

AIKA=120 # Kuinka ison ajan sisällä
MAARA=60 # Monta kertaa kyseisen ajan sisällä
INTERFACE="ens1" # interface
PORT1= # portti lukema 1 esim http/https jne
PORT2= # portti lukema 2 esim http/https jne
PROTOCOL= # Protokolla esim TCP/UDP/ICMP jne
APPEND=INPUT #

DACTION="reject" # Toiminto esim ACCPECT/DROP/REJECT jne
$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT1} -i ${INTERFACE} -m state --state NEW -m recent --set
$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT1} -i ${INTERFACE} -m state --state NEW -m recent --update --seconds ${AIKA} --hitcount ${MAARA} -j ${DACTION}

$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT2} -i ${INTERFACE} -m state --state NEW -m recent --set
$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT2} -i ${INTERFACE} -m state --state NEW -m recent --update --seconds ${AIKA} --hitcount ${MAARA} -j ${DACTION}



