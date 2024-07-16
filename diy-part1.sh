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

#tcp优化
echo 'net.ipv4.udp_wmem_min = 4096 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_rmem_min = 4096 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_mem = 774240 1032320 1548480 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_rbm_strictvalid = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_rbm_optfmt = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_cache_bucket_size = 10 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_cache_enable = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_slow_start_after_idle = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_dma_copybreak = 4096 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_workaround_signed_windows = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_base_mss = 512 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_mtu_probing = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_abc = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control = bic ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_tso_win_divisor = 3 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_moderate_rcvbuf = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_no_metrics_save = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_low_latency = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_frto = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_tw_reuse = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_adv_win_scale = 2 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_app_win = 31 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_rmem = 4096 87380 4194304 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_wmem = 4096 16384 4194304 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_mem = 196608 262144 393216 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_dsack = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_ecn = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_reordering = 3 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_fack = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_orphan_retries = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.inet_peer_gc_maxtime = 120 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.inet_peer_gc_mintime = 10 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.inet_peer_maxttl = 600 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.inet_peer_minttl = 120 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.inet_peer_threshold = 65664 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.igmp_max_msf = 10 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.igmp_max_memberships = 20 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.secret_interval = 600 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.min_adv_mss = 256 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.min_pmtu = 552 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.mtu_expires = 600 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.gc_elasticity = 8 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.error_burst = 5000 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.error_cost = 1000 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.redirect_silence = 20480 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.redirect_number = 9 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.redirect_load = 20 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.gc_interval = 60 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.gc_timeout = 300 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.gc_min_interval_ms = 500 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.gc_min_interval = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.max_size = 4194304 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.gc_thresh = 262144 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.max_delay = 10 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.route.min_delay = 2 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_ratemask = 6168 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_ratelimit = 1000 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_errors_use_inbound_ifaddr = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_ignore_bogus_error_responses = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_echo_ignore_broadcasts = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_echo_ignore_all = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_max_syn_backlog = 8192 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_rfc1337 = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_stdurg = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_abort_on_overflow = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_tw_recycle = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_syncookies = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_fin_timeout = 15 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_retries2 = 15 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_retries1 = 3 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_intvl = 75 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_probes = 9 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_time = 1800 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_max_tw_buckets = 180000 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_max_orphans = 65536 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_synack_retries = 5 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_syn_retries = 5 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_max_dist = 64 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_secret_interval = 600 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_time = 30 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_low_thresh = 196608 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_high_thresh = 262144 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_local_port_range = 1024    65000 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_dynaddr = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_nonlocal_bind = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_no_pmtu_disc = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_default_ttl = 64 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_forward = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_retrans_collapse = 0 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_sack = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_window_scaling = 1 ' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_timestamps = 1' >>package/base-files/files/etc/sysctl.conf

# 替换源 
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g'  package/emortal/default-settings/files/99-default-settings-chinese

# Do not be evil # ae6ff34105444482cc3d46d43987cc467ea79ac7
# LANG=C sed -i ':label;N;s/^[\x81-\xFE][\x40-\xFE].*\n//g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
# cat target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
