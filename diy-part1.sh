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
echo 'vm.swappiness = 1' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_ratio = 10' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_background_bytes = 0' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_bytes = 0' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_background_ratio = 3' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_expire_centisecs = 2000' >>package/base-files/files/etc/sysctl.conf
echo 'vm.dirty_writeback_centisecs = 500' >>package/base-files/files/etc/sysctl.conf
echo 'vm.vfs_cache_pressure = 50' >>package/base-files/files/etc/sysctl.conf
echo 'vm.min_free_kbytes = 131072' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.sched_min_granularity_ns = 1000000' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.sched_wakeup_granularity_ns = 2000000' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.sched_migration_cost_ns = 500000' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.msgmnb = 65536' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.msgmax = 65536' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.shmmax = 68719476736' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.shmall = 4294967296' >>package/base-files/files/etc/sysctl.conf
echo 'fs.suid_dumpable = 0' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.core_pattern = /dev/null' >>package/base-files/files/etc/sysctl.conf
echo 'kernel.threads-max = 1024' >>package/base-files/files/etc/sysctl.conf
echo 'fs.file-max = 100000' >>package/base-files/files/etc/sysctl.conf
echo 'fs.inotify.max_user_watches = 524288' >>package/base-files/files/etc/sysctl.conf
echo 'fs.inotify.max_user_instances = 512' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_wmem_min = 4096' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_rmem_min = 4096' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.udp_mem = 65536 131072 262144' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_rbm_strictvalid = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_rbm_optfmt = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_cache_bucket_size = 10' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.cipso_cache_enable = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_errors_use_inbound_ifaddr = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_ignore_bogus_error_responses = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_echo_ignore_broadcasts = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.icmp_echo_ignore_all = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.core.netdev_max_backlog = 500000' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.tcp_max_syn_backlog = 4096' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_max_dist = 64' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_secret_interval = 600' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_time = 30' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_low_thresh = 262144' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ipfrag_high_thresh = 524288' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_local_port_range = 1024 65535' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_dynaddr = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_nonlocal_bind = 1' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_no_pmtu_disc = 0' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_default_ttl = 64' >>package/base-files/files/etc/sysctl.conf
echo 'net.ipv4.ip_forward = 0' >>package/base-files/files/etc/sysctl.conf

# 替换源 
sed -i 's,mirrors.vsean.net/openwrt,mirrors.pku.edu.cn/immortalwrt,g'  package/emortal/default-settings/files/99-default-settings-chinese

# Do not be evil # ae6ff34105444482cc3d46d43987cc467ea79ac7
# LANG=C sed -i ':label;N;s/^[\x81-\xFE][\x40-\xFE].*\n//g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
# cat target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-h3c-nx30pro.dts
