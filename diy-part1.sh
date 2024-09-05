#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# name: 替换默认主题 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argonv3/' feeds/luci/collections/luci/Makefile

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#定时任务软件源
#git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset

# 默认ip 192.168.6.1
sed -i 's/192.168.[0-9]\{1,3\}.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 修改时区 UTF-8
sed -i 's/UTC/CST-8/g'  package/base-files/files/bin/config_generate

# 修改主机名 OP
sed -i 's/ImmortalWrt/ASUSWRT/g'  package/base-files/files/bin/config_generate

# 时区
sed -i 's/time1.apple.com/time1.cloud.tencent.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time1.google.com/ntp.aliyun.com/g'  package/base-files/files/bin/config_generate
sed -i 's/time.cloudflare.com/cn.ntp.org.cn/g'  package/base-files/files/bin/config_generate
sed -i 's/pool.ntp.org/cn.pool.ntp.org/g'  package/base-files/files/bin/config_generate

#Tcp和内存调度优化
echo 'vm.swappiness = 10' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_ratio = 15' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_background_ratio = 10' >>package/base-files/files/etc/sysctl.conf
echo 'vm.overcommit_ratio = 50' >>package/base-files/files/etc/sysctl.conf
echo 'vm.max_map_count = 131072' >>package/base-files/files/etc/sysctl.conf
echo 'vm.min_free_kbytes = 65536' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'fs.suid_dumpable = 0' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.core_pattern = /dev/null' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_rmem = 4096 87380 33554432' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_wmem = 4096 65536 33554432' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_window_scaling = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control = cubic' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.netdev_max_backlog = 500000' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.somaxconn = 65535' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.rmem_max = 33554432' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.wmem_max = 33554432' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.rmem_default = 524288' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.wmem_default = 524288' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_rmem_min = 16384' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_wmem_min = 16384' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_mem = 65536 131072 262144' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_max = 524288' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_established = 86400' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_syn_recv = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_time_wait = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_close = 20' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_tcp_timeout_last_ack = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_udp_timeout = 60' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_conntrack_udp_timeout_stream = 120' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_high_thresh = 4194304' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_low_thresh = 3145728' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_time = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_no_pmtu_disc = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_forward = 1' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_stale_time = 60' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_thresh1 = 4096' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_thresh2 = 8192' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_thresh3 = 16384' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_syncookies = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_syn_retries = 2' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_synack_retries = 2' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_slow_start_after_idle = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_low_latency = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_fastopen = 3' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_retries2 = 8' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_time = 600' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_probes = 5' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_intvl = 75' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_fin_timeout = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_max_syn_backlog = 16384' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_timestamps = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_mem = 524288 2097152 4194304' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_tw_reuse = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_max_tw_buckets = 1440000' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_no_metrics_save = 1' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.all.accept_source_route = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.default.accept_source_route = 0' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.printk = 0 0 0 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_log.0 = NONE' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_log.1 = NONE' >>package/base-files/files/etc/sysctl.conf
echo 'net.netfilter.nf_log_all_netns = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-arptables = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-ip6tables = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.bridge.bridge-nf-call-iptables = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv6.conf.all.log_martians = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv6.conf.default.log_martians = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv6.conf.eth0.log_martians = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv6.conf.all.accept_redirects = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv6.conf.default.accept_redirects = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.all.log_martians = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.default.log_martians = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.eth0.log_martians = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_ignore_bogus_error_responses = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.all.accept_redirects = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.default.accept_redirects = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.all.send_redirects = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.conf.default.send_redirects = 0' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.audit = 0' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.dmesg_restrict = 1' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.sysrq = 0' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.panic_on_oops = 1' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.panic = 0' >>package/base-files/files/etc/sysctl.conf
echo '' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.busy_poll = 50' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.busy_read = 50' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.rps_sock_flow_entries = 32768' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.dev_weight = 64' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.netdev_max_backlog = 500000' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.neigh.default.gc_stale_time = 60' >>package/base-files/files/etc/sysctl.conf

# 替换源 
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g'  package/emortal/default-settings/files/99-default-settings-chinese

# Do not be evil # ae6ff34105444482cc3d46d43987cc467ea79ac7
# LANG=C sed -i ':label;N;s/^[\x81-\xFE][\x40-\xFE].*\n//g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
# cat target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
