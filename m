Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36274 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754046AbbETWCm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:42 -0400
Received: by pabts4 with SMTP id ts4so81519812pab.3
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:41 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 07/10] merge_config.sh: add tests
Date: Wed, 20 May 2015 15:00:57 -0700
Message-Id: <1432159260-39390-8-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

For being a small script, merge_config.sh is fairly scary to change since there's no
real way to know if you did something wrong. So it seems appropriate to add a simple
test suite.

I've started with testcases in the areas I care about, other should of course feel
free to expand on this.

Use is simple, from the kernel tree, run ./scripts/kconfig/merge_config_test/runall.
It'll execute out of a tmpdir under /tmp.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 .../kconfig/merge_config_test/01-no-fragment.sh    |   12 ++++++++++
 .../kconfig/merge_config_test/02-already-set.sh    |   19 ++++++++++++++++
 .../merge_config_test/03-turnoff-failure.sh        |   19 ++++++++++++++++
 .../merge_config_test/04-turnoff-failure2.sh       |   19 ++++++++++++++++
 .../merge_config_test/05-turnoff-success.sh        |   19 ++++++++++++++++
 .../merge_config_test/06-turnoff-success2.sh       |   19 ++++++++++++++++
 .../kconfig/merge_config_test/07-turnon-success.sh |   19 ++++++++++++++++
 .../merge_config_test/08-tristate-success.sh       |   20 +++++++++++++++++
 .../merge_config_test/09-tristate-failure.sh       |   20 +++++++++++++++++
 .../merge_config_test/10-turnon-redundant.sh       |   19 ++++++++++++++++
 .../merge_config_test/11-turnon-redundant-err.sh   |   19 ++++++++++++++++
 scripts/kconfig/merge_config_test/common.sh        |   23 ++++++++++++++++++++
 scripts/kconfig/merge_config_test/runall.sh        |   22 +++++++++++++++++++
 13 files changed, 249 insertions(+)
 create mode 100755 scripts/kconfig/merge_config_test/01-no-fragment.sh
 create mode 100755 scripts/kconfig/merge_config_test/02-already-set.sh
 create mode 100755 scripts/kconfig/merge_config_test/03-turnoff-failure.sh
 create mode 100755 scripts/kconfig/merge_config_test/04-turnoff-failure2.sh
 create mode 100755 scripts/kconfig/merge_config_test/05-turnoff-success.sh
 create mode 100755 scripts/kconfig/merge_config_test/06-turnoff-success2.sh
 create mode 100755 scripts/kconfig/merge_config_test/07-turnon-success.sh
 create mode 100755 scripts/kconfig/merge_config_test/08-tristate-success.sh
 create mode 100755 scripts/kconfig/merge_config_test/09-tristate-failure.sh
 create mode 100755 scripts/kconfig/merge_config_test/10-turnon-redundant.sh
 create mode 100755 scripts/kconfig/merge_config_test/11-turnon-redundant-err.sh
 create mode 100755 scripts/kconfig/merge_config_test/common.sh
 create mode 100755 scripts/kconfig/merge_config_test/runall.sh

diff --git a/scripts/kconfig/merge_config_test/01-no-fragment.sh b/scripts/kconfig/merge_config_test/01-no-fragment.sh
new file mode 100755
index 0000000..c892f9b
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/01-no-fragment.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Simple merge: No fragment specified, just base config
+
+FRAG=$(echo "" | writefrag)
+
+merge ${FRAG}
+M=$?
+
+[ $M -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/02-already-set.sh b/scripts/kconfig/merge_config_test/02-already-set.sh
new file mode 100755
index 0000000..1d71030
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/02-already-set.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Turn on an option that is already on
+
+FRAG=$(writefrag) << EOF
+CONFIG_MMU=y
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return pass if MMU is still set in output
+
+check CONFIG_MMU=y
+G=$?
+
+[ $M -eq 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/03-turnoff-failure.sh b/scripts/kconfig/merge_config_test/03-turnoff-failure.sh
new file mode 100755
index 0000000..aa9bf63
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/03-turnoff-failure.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn off a function that won't turn off.
+
+FRAG=$(writefrag) << EOF
+# CONFIG_MMU is not set
+EOF
+
+merge ${FRAG}
+M=$?
+
+# Return pass if MMU is still set in output
+
+check CONFIG_MMU=y
+G=$?
+
+[ $M -ne 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/04-turnoff-failure2.sh b/scripts/kconfig/merge_config_test/04-turnoff-failure2.sh
new file mode 100755
index 0000000..cebcdbc
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/04-turnoff-failure2.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn off a function that won't turn off.
+
+FRAG=$(writefrag) << EOF
+CONFIG_MMU=n
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return pass if MMU is still set in output
+
+check CONFIG_MMU=y
+G=$?
+
+[ $M -ne 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/05-turnoff-success.sh b/scripts/kconfig/merge_config_test/05-turnoff-success.sh
new file mode 100755
index 0000000..7a8822e
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/05-turnoff-success.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn off a function that will turn off.
+
+FRAG=$(writefrag) << EOF
+# CONFIG_64BIT is not set
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return fail if 64BIT is still set in output
+
+check CONFIG_64BIT=y
+G=$?
+
+[ $M -eq 0 -a $G -ne 0 ]
diff --git a/scripts/kconfig/merge_config_test/06-turnoff-success2.sh b/scripts/kconfig/merge_config_test/06-turnoff-success2.sh
new file mode 100755
index 0000000..d5e7cc5
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/06-turnoff-success2.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn off a function that will turn off.
+
+FRAG=$(writefrag) << EOF
+CONFIG_64BIT=n
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return fail if 64BIT is still set in output
+
+check CONFIG_64BIT=y
+G=$?
+
+[ $M -eq 0 -a $G -ne 0 ]
diff --git a/scripts/kconfig/merge_config_test/07-turnon-success.sh b/scripts/kconfig/merge_config_test/07-turnon-success.sh
new file mode 100755
index 0000000..eb24ba0
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/07-turnon-success.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn on a function that will turn on.
+
+FRAG=$(writefrag) << EOF
+CONFIG_EMBEDDED=y
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return fail if EMBEDDED is not set in output
+
+check CONFIG_EMBEDDED=y
+G=$?
+
+[ $M -eq 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/08-tristate-success.sh b/scripts/kconfig/merge_config_test/08-tristate-success.sh
new file mode 100755
index 0000000..3c454b8
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/08-tristate-success.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn on a tristate that is allowed
+
+FRAG=$(writefrag) << EOF
+CONFIG_MODULES=y
+CONFIG_PCI_STUB=m
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return fail if PCI_STUB=m is not set in output
+
+check CONFIG_PCI_STUB=m
+G=$?
+
+[ $M -eq 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/09-tristate-failure.sh b/scripts/kconfig/merge_config_test/09-tristate-failure.sh
new file mode 100755
index 0000000..7f586ea
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/09-tristate-failure.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Try to turn on a tristate that failes
+
+FRAG=$(writefrag) << EOF
+CONFIG_MODULES=n
+CONFIG_PCI_STUB=m
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return fail if PCI_STUB=m is set in output
+
+check CONFIG_PCI_STUB=m
+G=$?
+
+[ $M -ne 0 -a $G -ne 0 ]
diff --git a/scripts/kconfig/merge_config_test/10-turnon-redundant.sh b/scripts/kconfig/merge_config_test/10-turnon-redundant.sh
new file mode 100755
index 0000000..65d9ea7
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/10-turnon-redundant.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Turn on something that's already on, should not warn
+
+FRAG=$(writefrag) << EOF
+CONFIG_64BIT=y
+EOF
+
+merge "${FRAG}"
+M=$?
+
+# Return fail if 64BIT=y is not set in output
+
+check CONFIG_64BIT=y
+G=$?
+
+[ $M -eq 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/11-turnon-redundant-err.sh b/scripts/kconfig/merge_config_test/11-turnon-redundant-err.sh
new file mode 100755
index 0000000..24c1d9b
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/11-turnon-redundant-err.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. "$(dirname $0)/common.sh"
+
+# Turn on something that's already on, watch it warn/fail
+
+FRAG=$(writefrag) << EOF
+CONFIG_64BIT=y
+EOF
+
+merge_r "${FRAG}" "${FRAG}"
+M=$?
+
+# Return fail if 64BIT=y is not set in output
+
+check CONFIG_64BIT=y
+G=$?
+
+[ $M -ne 0 -a $G -eq 0 ]
diff --git a/scripts/kconfig/merge_config_test/common.sh b/scripts/kconfig/merge_config_test/common.sh
new file mode 100755
index 0000000..710c429
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/common.sh
@@ -0,0 +1,23 @@
+TMPDIR=$(mktemp -d /tmp/mergetest.XXXXX)
+SCRIPT="$(dirname $0)/../merge_config.sh"
+
+writefrag() {
+	FRAG=$(mktemp ${TMPDIR}/frag.XXXX)
+	cat > "${FRAG}"
+	echo $FRAG
+}
+
+merge() {
+	"${SCRIPT}" -e -O "${TMPDIR}" /dev/null $*
+	return $?
+}
+
+merge_r() {
+	"${SCRIPT}" -e -r -O "${TMPDIR}" /dev/null $*
+	return $?
+}
+
+check() {
+	grep -q "$1" "${TMPDIR}/.config"
+	return $?
+}
diff --git a/scripts/kconfig/merge_config_test/runall.sh b/scripts/kconfig/merge_config_test/runall.sh
new file mode 100755
index 0000000..3c73d70
--- /dev/null
+++ b/scripts/kconfig/merge_config_test/runall.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+EXITVAL=0
+TMPDIR=$(mktemp -d /tmp/mergetest.XXXXX) || exit 1
+ARCH=x86
+
+cleanup() {
+	rm -rf "${TMPDIR}"
+	exit $EXITVAL
+}
+
+trap cleanup EXIT
+
+for test in $(dirname $0)/*-*.sh ; do
+	echo -n "test $(basename ${test}):  "
+	if ${test} >/dev/null 2>&1 ; then
+		echo PASSED
+	else
+		echo FAILED
+		EXITVAL=1
+	fi
+done
-- 
1.7.10.4

