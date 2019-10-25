Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38602 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390519AbfJYFrV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 01:47:21 -0400
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:prune-kernel:prune old kernels and modules dir 
Date: Fri, 25 Oct 2019 11:17:03 +0530
Message-Id: <20191025054703.16400-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: bfields@fieldses.org, rdunlap@infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch will remmove old kernel and associated modules directory from
the system.

Few interaction with the script ,below 

1) ✔ ~/git-linux/linux-kbuild [master ↑·18|✔]
10:40 $ ./scripts/prune-kernel


2)10:41 $ ./scripts/prune-kernel -h
You need to use this script like this :

  ./scripts/prune-kernel -r kernel_version  modules_directory_name
 ./scripts/prune-kernel -i  option for interactive way to  use it.


3) 10:41 $ ./scripts/prune-kernel -r 5.2.2 5.2.2-gentoo
Removed  kernel version:5.2.2 and modules directory:5.2.2-gentoo from
the system.


4)10:41 $ ./scripts/prune-kernel -i


 Want to removing old kernels and modules dir [YN]: Y
 Please give another version to remove: 5.2.2
 /boot/vmlinuz-5.3.7-050307-generic
 /boot/vmlinuz-5.3.6-050306-generic
 find: ‘/boot/efi’: Permission denied
 Please give the full modules directory name to remove: 5.2.2-gentoo
 5.3.6-050306-generic
 5.3.7-050307-generic



  Removed kernel version:5.2.2 and associated modules:5.2.2-gentoo
  ..Done.




Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
To Bruce,
I have incorporated all the changes you asked for ,kindly review.

 scripts/prune-kernel | 75 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 19 deletions(-)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index e8aa940bc0a9..292ba70d7770 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,21 +1,58 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
-
-# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
-# again, /boot and /lib/modules/ eventually fill up.
-# Dumb script to purge that stuff:
-
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
+#This script will delete old kernels and modules directory related to it interactively.
+#if you choose "-i" as interactive otherwise it will just go ahead and do the stuff once
+#you mentione the kernel_version and modules_directory_name as parameter.
+flag=$1
+kernel_ver=$2
+modules_dir_name=$3
+boot_dir=/boot
+modules_dir=/lib/modules
+remove_old_kernel() {
+	cd $boot_dir
+	find $boot_dir -name "vmlinuz-*" -type f -exec ls -1 {} \;
+	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
+	return 0
+}
+remove_old_modules_dir() {
+	cd $modules_dir
+	find $modules_dir -maxdepth 0 -type d -exec ls -1 {} \;
+	rm -rf $modules_version
+	return 0
+}
+while getopts :hir opt;
+do 
+		 case "$1" in
+			 -i | --interactive)
+		 printf "\n\n Want to removing old kernels and modules dir [YN]: %s"
+		 read response
+		 if [[ $response == "Y" ]];then
+			 printf "Please give another version to remove: %s"
+			 read kernel_version
+			 remove_old_kernel
+			 printf "Please give the full modules directory name to remove: %s"
+			 read modules_version
+			 remove_old_modules_dir
+			 printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ..Done. \n\n"
+		 elif [[ $response == "N" ]];then
+			 exit 1
+		 fi
+		 ;;
+	                  -h | --help)
+                    
+                     printf "You need to use this script like this :\n
+	             $0 -r kernel_version modules_directory_name\n
+                     $0 -i option for interactive way to use it.\n\n"
+	      
+	         exit 1
+		     ;;
+	                 -r | --remove)
+			 shift $(( OPTIND - 1 ))
+			 rm -f kernel_ver
+                         cd $modules_dir
+	                 rm -rf $modules_dir_name
+	                 printf "Removed  kernel version:$kernel_ver and modules directory:$modules_dir_name from the system.\n\n"
+			 exit 0
+                         ;;
+ esac
+     done
-- 
2.20.1
