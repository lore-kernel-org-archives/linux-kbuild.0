Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39885 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751514AbeBFAh6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:37:58 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 14/14] kconfig: test: check if recursive inclusion is detected
Date: Tue,  6 Feb 2018 09:34:54 +0900
Message-Id: <1517877294-4826-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

If recursive inclusion is detected, it should fail with error messages.
Test this.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/tests/err_recursive_inc/Kconfig         |  1 +
 scripts/kconfig/tests/err_recursive_inc/Kconfig.inc     |  1 +
 scripts/kconfig/tests/err_recursive_inc/__init__.py     | 10 ++++++++++
 scripts/kconfig/tests/err_recursive_inc/expected_stderr |  4 ++++
 4 files changed, 16 insertions(+)
 create mode 100644 scripts/kconfig/tests/err_recursive_inc/Kconfig
 create mode 100644 scripts/kconfig/tests/err_recursive_inc/Kconfig.inc
 create mode 100644 scripts/kconfig/tests/err_recursive_inc/__init__.py
 create mode 100644 scripts/kconfig/tests/err_recursive_inc/expected_stderr

diff --git a/scripts/kconfig/tests/err_recursive_inc/Kconfig b/scripts/kconfig/tests/err_recursive_inc/Kconfig
new file mode 100644
index 0000000..3ce7a3f
--- /dev/null
+++ b/scripts/kconfig/tests/err_recursive_inc/Kconfig
@@ -0,0 +1 @@
+source "Kconfig.inc"
diff --git a/scripts/kconfig/tests/err_recursive_inc/Kconfig.inc b/scripts/kconfig/tests/err_recursive_inc/Kconfig.inc
new file mode 100644
index 0000000..1fab1c1
--- /dev/null
+++ b/scripts/kconfig/tests/err_recursive_inc/Kconfig.inc
@@ -0,0 +1 @@
+source "Kconfig"
diff --git a/scripts/kconfig/tests/err_recursive_inc/__init__.py b/scripts/kconfig/tests/err_recursive_inc/__init__.py
new file mode 100644
index 0000000..1dae64f
--- /dev/null
+++ b/scripts/kconfig/tests/err_recursive_inc/__init__.py
@@ -0,0 +1,10 @@
+"""
+Detect recursive inclusion error
+================================
+
+If recursive inclusion is detected, it should fail with error messages.
+"""
+
+def test(conf):
+    assert conf.oldaskconfig() != 0
+    assert conf.stderr_contains('expected_stderr')
diff --git a/scripts/kconfig/tests/err_recursive_inc/expected_stderr b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
new file mode 100644
index 0000000..b256c91
--- /dev/null
+++ b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
@@ -0,0 +1,4 @@
+Kconfig:1: recursive inclusion detected. Inclusion path:
+  current file : 'Kconfig'
+  included from: 'Kconfig.inc:1'
+  included from: 'Kconfig:3'
-- 
2.7.4

