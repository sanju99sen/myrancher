!/usr/bin/bash

set -x

CONFIG_FILE=config/rke_config

export ip1=`cat $CONFIG_FILE|grep ip1|cut -d"=" -f2`
export ip2=`cat $CONFIG_FILE|grep ip2|cut -d"=" -f2`
export ip3=`cat $CONFIG_FILE|grep ip3|cut -d"=" -f2`
export ssh_user=`cat $CONFIG_FILE|grep ssh_user|cut -d"=" -f2`
export cni=`cat $CONFIG_FILE|grep cni|cut -d"=" -f2`
export service_cidr=`cat $CONFIG_FILE|grep servive_cidr|cut -d"=" -f2`
export pod_cidr=`cat $CONFIG_FILE|grep pod_cidr|cut -d"=" -f2`
export cluster_dns_svc_ip=`cat $CONFIG_FILE|grep cluster_dns_svc_ip|cut -d"=" -f2`
export cluster_domain=`cat $CONFIG_FILE|grep cluster_domain|cut -d"=" -f2`
export kubernetes_img=`cat $CONFIG_FILE|grep kubernetes_img|cut -d"=" -f2`
export master_node1=`cat $CONFIG_FILE|grep master_node1|cut -d"=" -f2`
export master_node2=`cat $CONFIG_FILE|grep master_node2|cut -d"=" -f2`
export master_node3=`cat $CONFIG_FILE|grep master_node3|cut -d"=" -f2`


echo "controlplane1=$ip1 controlplane2=$ip2 controlplane3=$ip3 ssh_user=$ssh_user CNI=$cni SERVICE_NETWORK=$servive_cidr POD_NETWORK=$pod_cidr CLUSTER_DNS=$cluster_dns_svc_ip CLUSTER_DOMAIN=$cluster_domain KUBERNETES_IMAGE=$kubernetes_img master_node1=$master_node1 master_node2=$master_node2 master_node3=$master_node3"

expect gen_rke_config.exp $ip1 $ip2 $ip3 $ssh_user $cni $service_cidr $pod_cidr $cluster_dns_svc_ip $cluster_domain $kubernetes_img $master_node1 $master_node2 $master_node3
