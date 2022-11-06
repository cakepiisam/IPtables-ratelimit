IPT=/sbin/iptables

AIKA=120 # Kuinka ison ajan sisällä
MAARA=60 # Monta kertaa kyseisen ajan sisällä
INTERFACE="ens1" # Interface
PORT1=http # Porttilukema 1 esim http/https jne
PORT2=https # Porttilukema 2 esim http/https jne
PROTOCOL=tcp # Protokolla esim TCP/UDP/ICMP jne
APPEND=INPUT # INPUT/OUTPUT jne

DACTION="reject" # Toiminto esim ACCPECT/DROP/REJECT jne
$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT1} -i ${INTERFACE} -m state --state NEW -m recent --set
$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT1} -i ${INTERFACE} -m state --state NEW -m recent --update --seconds ${AIKA} --hitcount ${MAARA} -j ${DACTION}

$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT2} -i ${INTERFACE} -m state --state NEW -m recent --set
$IPT -A ${APPEND} -p ${PROTOCOL} --dport ${PORT2} -i ${INTERFACE} -m state --state NEW -m recent --update --seconds ${AIKA} --hitcount ${MAARA} -j ${DACTION}



