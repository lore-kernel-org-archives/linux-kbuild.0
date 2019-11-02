Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46867 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKBGbG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Nov 2019 02:31:06 -0400
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:prune-kernel:remove old kernels and modules dir from system
Date: Sat,  2 Nov 2019 12:00:36 +0530
Message-Id: <20191102063036.28601-1-unixbhaskar@gmail.com>
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
 scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 17 deletions(-)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index e8aa940bc0a9..01d0778db71f 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,21 +1,69 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+#This script will remove old kernels and modules directory related to it.
+#"-r" or "--remove" show how to silently remove old kernel and modules dir.
+# "-h" or "--help" show how to use this script or show without parameter.
+#"-i" or "--interactive" show how to remove interactively.
+
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
+	printf "Usage: $(basename $0) [-ri]\n"
+	printf "\n -r or --remove  kernel_version modules_version\n"
+	printf "\n -i or --interactive do as interactive way\n"
+	return 0
+}
+
+case "$flag" in
+	-i | --interactive)
+		printf "\nEnter kernel version to remove or blank/empty to exit:"
+		read kernel_version
+		if [[ $kernel_version != "" ]]; then
+			remove_old_kernel
+			printf "\nRemoved kernel version:$kernel_version from the system.\n\n"
+			printf "Please give the full modules directory name to remove:"
+			read modules_version
+			if [[ $modules_version != "" ]]; then
+				remove_old_modules_dir
+				printf "\n\nRemoved modules directory:$modules_version from the system.\n\n"
+			else
+				exit 1
+			fi
+		fi
+		;;
+	-h | --help)
+		usage
+		exit 0
+		;;
+	-r | --remove)
+		if [[ $# -ne 3 ]]; then
+			 printf "You need to provide kernel version and modules directory name.\n"
+			 exit 1
+		 else
+			 remove_old_kernel
+			 remove_old_modules_dir
+		fi
+		;;
+	*)
+		usage
+		exit 1
+		;;
+esac

-# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
-# again, /boot and /lib/modules/ eventually fill up.
-# Dumb script to purge that stuff:

-for f in "$@"
-do
-        if rpm -qf "/lib/modules/$f" >/dev/null; then
-                echo "keeping $f (installed from rpm)"
-        elif [ $(uname -r) = "$f" ]; then
-                echo "keeping $f (running kernel) "
-        else
-                echo "removing $f"
-                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
-                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
-                rm -rf "/lib/modules/$f"
-                new-kernel-pkg --remove $f
-        fi
-done
--
2.23.0
