Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:38339 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbeKZSRy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 13:17:54 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kconfig: tests: test reverse dependency with tristate if-conditional
Date: Mon, 26 Nov 2018 16:22:49 +0900
Message-Id: <1543216969-2227-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543216969-2227-1-git-send-email-yamada.masahiro@socionext.com>
References: <1543216969-2227-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Taehee Yoo <ap420073@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Add a test-case for the fixed reverse dependency handling.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../kconfig/tests/revdep_with_tristate_if/Kconfig   | 21 +++++++++++++++++++++
 .../tests/revdep_with_tristate_if/__init__.py       | 14 ++++++++++++++
 .../tests/revdep_with_tristate_if/expected_config   |  9 +++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 scripts/kconfig/tests/revdep_with_tristate_if/Kconfig
 create mode 100644 scripts/kconfig/tests/revdep_with_tristate_if/__init__.py
 create mode 100644 scripts/kconfig/tests/revdep_with_tristate_if/expected_config

diff --git a/scripts/kconfig/tests/revdep_with_tristate_if/Kconfig b/scripts/kconfig/tests/revdep_with_tristate_if/Kconfig
new file mode 100644
index 0000000..2bd1141
--- /dev/null
+++ b/scripts/kconfig/tests/revdep_with_tristate_if/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config MODULES
+	def_bool y
+	option modules
+
+config A
+	tristate
+
+config B
+	tristate "b"
+	default y
+	select A if C
+	imply D if C
+
+config C
+	tristate "c"
+	default m
+
+config D
+	tristate "d"
diff --git a/scripts/kconfig/tests/revdep_with_tristate_if/__init__.py b/scripts/kconfig/tests/revdep_with_tristate_if/__init__.py
new file mode 100644
index 0000000..ad95cec
--- /dev/null
+++ b/scripts/kconfig/tests/revdep_with_tristate_if/__init__.py
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+select/imply property with tristate if-conditional
+
+The reverse dependencies (select/imply) are used to define a lower limit
+of another symbol. The current value of the selector is set to the lower
+limit of the selectee. This did not handled correctly in the past when the
+property has a tristate if-conditional.
+"""
+
+
+def test(conf):
+    assert conf.alldefconfig() == 0
+    assert conf.config_matches('expected_config')
diff --git a/scripts/kconfig/tests/revdep_with_tristate_if/expected_config b/scripts/kconfig/tests/revdep_with_tristate_if/expected_config
new file mode 100644
index 0000000..9826223
--- /dev/null
+++ b/scripts/kconfig/tests/revdep_with_tristate_if/expected_config
@@ -0,0 +1,9 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Main menu
+#
+CONFIG_MODULES=y
+CONFIG_A=y
+CONFIG_B=y
+CONFIG_C=m
+CONFIG_D=y
-- 
2.7.4
