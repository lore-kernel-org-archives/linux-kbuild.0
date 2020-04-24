Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:57904 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgDXFuB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 01:50:01 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kconfig: tests: remove randconfig test for choice in choice
Date: Fri, 24 Apr 2020 14:49:28 +0900
Message-Id: <20200424054929.502485-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

Nesting choice statements does not make any sense.

Commit df8df5e4bc37 ("usb: get rid of 'choice' for legacy gadget
drivers") got rid of the only user.

I will make it a syntax error. Remove the test in advance.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .../kconfig/tests/rand_nested_choice/Kconfig  | 35 -------------------
 .../tests/rand_nested_choice/__init__.py      | 17 ---------
 .../tests/rand_nested_choice/expected_stdout0 |  2 --
 .../tests/rand_nested_choice/expected_stdout1 |  4 ---
 .../tests/rand_nested_choice/expected_stdout2 |  5 ---
 5 files changed, 63 deletions(-)
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/Kconfig
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/__init__.py
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout0
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout1
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout2

diff --git a/scripts/kconfig/tests/rand_nested_choice/Kconfig b/scripts/kconfig/tests/rand_nested_choice/Kconfig
deleted file mode 100644
index 8350de7f732b..000000000000
--- a/scripts/kconfig/tests/rand_nested_choice/Kconfig
+++ /dev/null
@@ -1,35 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-choice
-	prompt "choice"
-
-config A
-	bool "A"
-
-config B
-	bool "B"
-
-if B
-choice
-	prompt "sub choice"
-
-config C
-	bool "C"
-
-config D
-	bool "D"
-
-if D
-choice
-	prompt "subsub choice"
-
-config E
-	bool "E"
-
-endchoice
-endif # D
-
-endchoice
-endif # B
-
-endchoice
diff --git a/scripts/kconfig/tests/rand_nested_choice/__init__.py b/scripts/kconfig/tests/rand_nested_choice/__init__.py
deleted file mode 100644
index 9e4b2db53581..000000000000
--- a/scripts/kconfig/tests/rand_nested_choice/__init__.py
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-"""
-Set random values recursively in nested choices.
-
-Kconfig can create a choice-in-choice structure by using 'if' statement.
-randconfig should correctly set random choice values.
-
-Related Linux commit: 3b9a19e08960e5cdad5253998637653e592a3c29
-"""
-
-
-def test(conf):
-    for i in range(20):
-        assert conf.randconfig() == 0
-        assert (conf.config_contains('expected_stdout0') or
-                conf.config_contains('expected_stdout1') or
-                conf.config_contains('expected_stdout2'))
diff --git a/scripts/kconfig/tests/rand_nested_choice/expected_stdout0 b/scripts/kconfig/tests/rand_nested_choice/expected_stdout0
deleted file mode 100644
index 05450f3d4eb5..000000000000
--- a/scripts/kconfig/tests/rand_nested_choice/expected_stdout0
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_A=y
-# CONFIG_B is not set
diff --git a/scripts/kconfig/tests/rand_nested_choice/expected_stdout1 b/scripts/kconfig/tests/rand_nested_choice/expected_stdout1
deleted file mode 100644
index 37ab29584157..000000000000
--- a/scripts/kconfig/tests/rand_nested_choice/expected_stdout1
+++ /dev/null
@@ -1,4 +0,0 @@
-# CONFIG_A is not set
-CONFIG_B=y
-CONFIG_C=y
-# CONFIG_D is not set
diff --git a/scripts/kconfig/tests/rand_nested_choice/expected_stdout2 b/scripts/kconfig/tests/rand_nested_choice/expected_stdout2
deleted file mode 100644
index 849ff47e9848..000000000000
--- a/scripts/kconfig/tests/rand_nested_choice/expected_stdout2
+++ /dev/null
@@ -1,5 +0,0 @@
-# CONFIG_A is not set
-CONFIG_B=y
-# CONFIG_C is not set
-CONFIG_D=y
-CONFIG_E=y
-- 
2.25.1
