Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:36370 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755041AbbJ1AnA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:43:00 -0400
Received: by pacfv9 with SMTP id fv9so248532661pac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:43:00 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 10/10] merge_config.sh: add tests for cmdline configs
Date: Wed, 28 Oct 2015 09:42:11 +0900
Message-Id: <1445992931-28107-11-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Again, these tests could be more complicated but at least it gets
the very basics covered.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 .../merge_config_test/12-cmdline-success.sh        | 13 ++++++++++
 .../merge_config_test/13-cmdline-failure.sh        | 13 ++++++++++
 .../merge_config_test/14-cmdline-reduntant.sh      | 13 ++++++++++
 .../merge_config_test/15-cmdline-complex.sh        | 30 ++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100755 scripts/kconfig/merge_config_test/12-cmdline-success.sh
 create mode 100755 scripts/kconfig/merge_config_test/13-cmdline-failure.sh
 create mode 100755 scripts/kconfig/merge_config_test/14-cmdline-reduntant.sh
 create mode 100755 scripts/kconfig/merge_config_test/15-cmdline-complex.sh

diff --git a/scripts/kconfig/merge_config_test/12-cmdline-success.sh b/scripts/kconfig/merge_config_test/12-cmdline-success.sh
new file mode 100755
index 0000000..f8f2bf1
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/12-cmdline-success.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Turn off an option
+
+merge CONFIG_64BIT=n
+M=$?
+
+check CONFIG_64BIT=y
+G=$?
+
+[ $M -eq 0 -a $G -ne 0 ]
diff --git a/scripts/kconfig/merge_config_test/13-cmdline-failure.sh b/scripts/kconfig/merge_config_test/13-cmdline-failure.sh
new file mode 100755
index 0000000..6504786
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/13-cmdline-failure.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn off an option that won't turn off.
+
+merge CONFIG_MMU=n
+M=$?
+
+check CONFIG_MMU=y
+G=$?
+
+[ $M -ne 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/14-cmdline-reduntant.sh b/scripts/kconfig/merge_config_test/14-cmdline-reduntant.sh
new file mode 100755
index 0000000..c9c3fab
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/14-cmdline-reduntant.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Make sure redundant options are warned about
+
+merge_r CONFIG_64BIT=n CONFIG_64BIT=n
+M=$?
+
+check CONFIG_64BIT=y
+G=$?
+
+[ $M -ne 0 -a $G -ne 0 ]
diff --git a/scripts/kconfig/merge_config_test/15-cmdline-complex.sh b/scripts/kconfig/merge_config_test/15-cmdline-complex.sh
new file mode 100755
index 0000000..b754610
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/15-cmdline-complex.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Make sure redundant options are warned about
+
+FRAG1=$(writefrag) << EOF
+CONFIG_EMBEDDED=y
+EOF
+
+FRAG2=$(writefrag) << EOF
+CONFIG_MMU=n
+EOF
+
+merge_r ${FRAG1} CONFIG_64BIT=n ${FRAG2}
+M=$?
+
+check CONFIG_64BIT=y
+G1=$?
+
+check CONFIG_EMBEDDED=y
+G2=$?
+
+check CONFIG_MMU=y
+G3=$?
+
+[ $G1 -ne 0 -a $G2 -eq 0 -a $G3 -eq 0 ]
+G=$?
+
+[ $M -ne 0 -a $G -eq 0 ]
-- 
2.1.4

