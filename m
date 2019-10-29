Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44557 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfJ2DBC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 23:01:02 -0400
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:prune-kernel:prune kernel and modules dir from the system
Date: Tue, 29 Oct 2019 08:30:30 +0530
Message-Id: <20191029030030.31659-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rdunlap@infradead.org, bfields@fieldses.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch will remove old kernel and modules directory from 
the system interactive way and also at once ,provied the parameter
given to the invoking script.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/prune-kernel | 58 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index 58a7650ce592..a6c990450ddc 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,2 +1,60 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+#This script will delete old kernels and modules directory related to it,both
+#automated and interactive way, if you choose -i or --interactive as parameter.
+#For normal operation you have to invoke this script like below
+#prune-kernel -r kernel_ver modules_dir_name
+flag=$1
+kernel_ver=$2
+modules_dir_name=$3
+boot_dir=/boot
+modules_dir=/lib/modules
+
+remove_old_kernel() {
+	cd $boot_dir
+	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
+	return 0
+}
+
+remove_old_modules_dir() {
+	cd $modules_dir
+	rm -rf $modules_version
+	return 0
+}
+
+usage() {
+	printf "Usage: $(basename $0) [-ri] \n"
+	printf "\n -r | --remove kernel_ver modules_dir_name \n"
+	printf "\n -i | --interactive use as interactive way \n"
+}
+
+while getopts :hir opt;do
+	case "$flag" in
+		-i | --interactive)
+			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
+			read kernel_version
+			if [[ $kernel_version != "" ]]; then
+				remove_old_kernel
+				printf "Please give the full modules directory name to remove:%s"
+				read modules_version
+				remove_old_modules_dir
+				printf "\n\n\n Removed kernel version:$kernel_version and associated modules directory:$modules_version ..Done.\n"
+			else
+				exit 1
+			fi
+			;;
+		-h | --help)
+			usage
+			exit 1
+			;;
+		-r | --remove)
+			shift $(( OPTIND -1 ))
+			cd $boot_dir
+			rm -f $kernel_ver
+			cd $modules_dir
+			rm -rf $modules_dir_name
+			printf "Removed kernel version:$kernel_ver and modules directory:$modules_dir_name from the system. \n\n"
+			exit 0
+			;;
+	esac
+done
--
2.23.0
