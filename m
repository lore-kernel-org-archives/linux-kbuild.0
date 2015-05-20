Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:33620 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753923AbbETWCq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:46 -0400
Received: by padbw4 with SMTP id bw4so81632570pad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:46 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 10/10] merge_config.sh: add tests for cmdline configs
Date: Wed, 20 May 2015 15:01:00 -0700
Message-Id: <1432159260-39390-11-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Again, these tests could be more complicated but at least it gets
the very basics covered.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 .../merge_config_test/12-cmdline-success.sh        |   13 +++++++++
 .../merge_config_test/13-cmdline-failure.sh        |   13 +++++++++
 .../merge_config_test/14-cmdline-reduntant.sh      |   13 +++++++++
 .../merge_config_test/15-cmdline-complex.sh        |   30 ++++++++++++++++++++
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
1.7.10.4

