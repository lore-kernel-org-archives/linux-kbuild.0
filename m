Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36806 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbfJPGOC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 02:14:02 -0400
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts : prune-kernel : prune kernels generalized way
Date: Wed, 16 Oct 2019 11:43:12 +0530
Message-Id: <20191016061312.10626-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org, bfields@fieldses.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch will remove old kernel from the system in a selective way.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
Thanks, a bunch to Randy for the hand holding . :)

 scripts/prune-kernel | 71 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 12 deletions(-)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index e8aa940bc0a9..78dd4c854b2b 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -5,17 +5,64 @@
 # again, /boot and /lib/modules/ eventually fill up.
 # Dumb script to purge that stuff:

+#for f in "$@"
+#do
+#        if rpm -qf "/lib/modules/$f" >/dev/null; then
+#                echo "keeping $f (installed from rpm)"
+#        elif [ $(uname -r) = "$f" ]; then
+#                echo "keeping $f (running kernel) "
+#        else
+#                echo "removing $f"
+#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
+#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
+#                rm -rf "/lib/modules/$f"
+#                new-kernel-pkg --remove $f
+#        fi
+#done
+boot_dir=/boot
+modules_dir=/lib/modules
+
+function remove_old_kernel(){
+	cd $boot_dir
+	rm -If vmlinuz-$kenrel_version System.map-$kernel_version config-$kernel_verison
+}
+function remove_old_kernel_modules_dir(){
+	cd $modules_dir
+	rm -rf $modules_version
+}
+printf "\n\n Enlist the installed kernels \n\n"
+
+find $boot_dir -name "vmlinuz-*" -type f  -exec ls -1 {} \;
+
+printf "\n\n\n Please give the kernel version to remove: %s"
+read kernel_version
+
+remove_old_kernel
+
+printf "\n\n Enlist the installed modules directory \n\n"
+
+find $modules_dir  -maxdepth 0 -type d -exec ls -1 {} \;
+
+printf "\n\n Please give the full modules directory name to remove: %s"
+read modules_version
+
+remove_old_kernel_modules_dir
+
+printf "\n\n Removed kernel version: $kernel_version and associcated modules: $modules_version ...Done \n"
+while :
 do
+printf "\n\n Do you want to remove another?[YN] : %s"
+read response
+
+if [[ $response == "Y" ]];then
+	printf "Please give another version to remove : %s"
+	read kernel_version
+	remove_old_kernel
+	printf "\n\n Please give the full modules directory name to remove: %s"
+	read modules_version
+	remove_old_kernel_modules_dir
+elif [[ $response == "N" ]];then
+	printf "\n\n Alright,no more. \n\n"
+	exit 1
+fi
 done
--
2.21.0
