Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33919 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbfKAIGQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 04:06:16 -0400
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:prune-kernel:Removed old kernels and modules dir from system
Date: Fri,  1 Nov 2019 13:35:10 +0530
Message-Id: <20191101080510.26247-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rdunlap@infradead.org
Cc: bfields@fieldses.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch allow you to remove old kernels and associated modules
directory from the system.You can do it at once with the -r flag
and interactively with the -i flag.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index a25aa2160d47..373a845792e6 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,3 +1,66 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+#This script will remove old kernels and modules directory related to it.
+# "-h" or "--help" show how to use this script or show without parameter.
+#"-r" or "--remove" show how to silently remove old kernel and modules dir.
+#"-i" or "--interactive" show how to remove interactively.

+flag=$1
+kernel_version=$2
+modules_version=$3
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
+	printf "\n -r or --remove  kernel_version modules_version \n"
+	printf "\n -i or --interactive do as interactive way \n"
+	return 0
+}
+
+	case "$flag" in
+		-i | --interactive)
+			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
+			read kernel_version
+			if [[ $kernel_version != "" ]]; then
+				remove_old_kernel
+				printf "Please give the full modules directory name to remove:%s"
+				read modules_version
+				if [[ $modules_version != "" ]]; then
+					remove_old_modules_dir
+					printf "\n\nRemoved kernel version:$kernel_version and associated modules directory:$modules_version ...Done \n"
+				else
+					exit 1
+				fi
+			fi
+			;;
+		-h | --help)
+			usage
+			exit 1
+			;;
+		-r | --remove)
+			if [[ $# -ne 3 ]]; then
+				printf "You need to provide kernel version and modules directory name \n"
+				exit 1
+			else
+				remove_old_kernel
+				remove_old_modules_dir
+			fi
+			;;
+		*)
+			usage
+			exit 1
+			;;
+	esac
--
2.23.0
