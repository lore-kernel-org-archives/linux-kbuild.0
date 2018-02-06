Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39630 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750903AbeBFAhv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:37:51 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 11/14] kconfig: test: check .config sanity for choice values with unmet dep
Date: Tue,  6 Feb 2018 09:34:51 +0900
Message-Id: <1517877294-4826-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I fixed a problem where "# CONFIG_..." for choice values are wrongly
written into the .config file when they are once visible, then become
invisible later.

Add a test for this subtle case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/tests/no_write_if_dep_unmet/Kconfig     | 14 ++++++++++++++
 scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py | 17 +++++++++++++++++
 scripts/kconfig/tests/no_write_if_dep_unmet/config      |  1 +
 .../kconfig/tests/no_write_if_dep_unmet/expected_config |  5 +++++
 4 files changed, 37 insertions(+)
 create mode 100644 scripts/kconfig/tests/no_write_if_dep_unmet/Kconfig
 create mode 100644 scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py
 create mode 100644 scripts/kconfig/tests/no_write_if_dep_unmet/config
 create mode 100644 scripts/kconfig/tests/no_write_if_dep_unmet/expected_config

diff --git a/scripts/kconfig/tests/no_write_if_dep_unmet/Kconfig b/scripts/kconfig/tests/no_write_if_dep_unmet/Kconfig
new file mode 100644
index 0000000..c00b8fe
--- /dev/null
+++ b/scripts/kconfig/tests/no_write_if_dep_unmet/Kconfig
@@ -0,0 +1,14 @@
+config A
+	bool "A"
+
+choice
+	prompt "Choice ?"
+	depends on A
+
+config CHOICE_B
+	bool "Choice B"
+
+config CHOICE_C
+	bool "Choice C"
+
+endchoice
diff --git a/scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py b/scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py
new file mode 100644
index 0000000..d096622
--- /dev/null
+++ b/scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py
@@ -0,0 +1,17 @@
+"""
+Do not write choice values to .config if the dependency is unmet
+================================================================
+
+"# CONFIG_... is not set" should not be written into the .config file
+for symbols with unmet dependency.
+
+This was not working correctly for choice values because choice needs
+a bit different symbol computation.
+
+This checks that no unneeded "# COFIG_... is not set" is contained in
+the .config file.
+"""
+
+def test(conf):
+    assert conf.oldaskconfig('config', 'n') == 0
+    assert conf.config_matches('expected_config')
diff --git a/scripts/kconfig/tests/no_write_if_dep_unmet/config b/scripts/kconfig/tests/no_write_if_dep_unmet/config
new file mode 100644
index 0000000..abd280e
--- /dev/null
+++ b/scripts/kconfig/tests/no_write_if_dep_unmet/config
@@ -0,0 +1 @@
+CONFIG_A=y
diff --git a/scripts/kconfig/tests/no_write_if_dep_unmet/expected_config b/scripts/kconfig/tests/no_write_if_dep_unmet/expected_config
new file mode 100644
index 0000000..0d15e41
--- /dev/null
+++ b/scripts/kconfig/tests/no_write_if_dep_unmet/expected_config
@@ -0,0 +1,5 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux Kernel Configuration
+#
+# CONFIG_A is not set
-- 
2.7.4

