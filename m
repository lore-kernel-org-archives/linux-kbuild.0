Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37773 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfLCJt2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 04:49:28 -0500
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH 1/2] Enlist running kernel modules information
Date: Tue,  3 Dec 2019 15:18:45 +0530
Message-Id: <20191203094845.610692-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, rdunlap@infradead.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This is new file to show running kernel modules list.One line bash
script.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/kernel_modules_info.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 scripts/kernel_modules_info.sh

diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
new file mode 100755
index 000000000000..f005c47a3aa6
--- /dev/null
+++ b/scripts/kernel_modules_info.sh
@@ -0,0 +1,23 @@
+#!/bin/bash - 
+#SPDX-License-Identifier: GPL-2.0
+#===============================================================================
+#
+#          FILE: kernel_modules_info.sh
+# 
+#         USAGE: ./kernel_modules_info.sh 
+# 
+#   DESCRIPTION:  Running kernel modules information.
+# 
+#       OPTIONS: ---
+#  REQUIREMENTS: awk
+#          BUGS: ---
+#         NOTES: ---
+#        AUTHOR: Bhaskar Chowdhury (https://about.me/unixbhaskar), unixbhaskar@gmail.com
+#  ORGANIZATION: Independent
+#       CREATED: 12/03/2019 13:52
+#      REVISION:  ---
+#===============================================================================
+
+set -o nounset                              # Treat unset variables as an error
+
+awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|desc|depends)/'
-- 
2.24.0
