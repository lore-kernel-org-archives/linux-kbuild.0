Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39781 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752249AbeBFAh4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:37:56 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 12/14] kconfig: test: check visibility of tristate choice values in y choice
Date: Tue,  6 Feb 2018 09:34:52 +0900
Message-Id: <1517877294-4826-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

If tristate choice values depend on symbols set to 'm', they should be
hidden when the choice containing them is changed from 'm' to 'y'
(i.e. exclusive choice).

This issue was fixed by commit fa64e5f6a35e ("kconfig/symbol.c: handle
choice_values that depend on 'm' symbols").

Add a test case to avoid regression.

For the input in this unit test, there is a room for argument if
"# CONFIG_CHOICE1 is not set" should be written to the .config file.

After commit fa64e5f6a35e, this line was written to the .config file.

Then, it is not written after my fix "kconfig: do not write choice
values when their dependency becomes n".

In this test, "# CONFIG_CHOICE1 is not set" is don't care.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../kconfig/tests/choice_value_with_m_dep/Kconfig    | 20 ++++++++++++++++++++
 .../tests/choice_value_with_m_dep/__init__.py        | 15 +++++++++++++++
 scripts/kconfig/tests/choice_value_with_m_dep/config |  2 ++
 .../tests/choice_value_with_m_dep/expected_config    |  3 +++
 .../tests/choice_value_with_m_dep/expected_stdout    |  4 ++++
 5 files changed, 44 insertions(+)
 create mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
 create mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/__init__.py
 create mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/config
 create mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/expected_config
 create mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout

diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig b/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
new file mode 100644
index 0000000..dbc49e2
--- /dev/null
+++ b/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
@@ -0,0 +1,20 @@
+config MODULES
+	bool
+	default y
+	option modules
+
+config DEP
+	tristate
+	default m
+
+choice
+	prompt "Tristate Choice"
+
+config CHOICE0
+	tristate "Choice 0"
+
+config CHOICE1
+	tristate "Choice 1"
+	depends on DEP
+
+endchoice
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/__init__.py b/scripts/kconfig/tests/choice_value_with_m_dep/__init__.py
new file mode 100644
index 0000000..ec71777
--- /dev/null
+++ b/scripts/kconfig/tests/choice_value_with_m_dep/__init__.py
@@ -0,0 +1,15 @@
+"""
+Hide tristate choice values with mod dependency in y choice
+===========================================================
+
+If tristate choice values depend on symbols set to 'm', they should be
+hidden when the choice containing them is changed from 'm' to 'y'
+(i.e. exclusive choice).
+
+Related Linux commit: fa64e5f6a35efd5e77d639125d973077ca506074
+"""
+
+def test(conf):
+    assert conf.oldaskconfig('config', 'y') == 0
+    assert conf.config_contains('expected_config')
+    assert conf.stdout_contains('expected_stdout')
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/config b/scripts/kconfig/tests/choice_value_with_m_dep/config
new file mode 100644
index 0000000..3a126b7
--- /dev/null
+++ b/scripts/kconfig/tests/choice_value_with_m_dep/config
@@ -0,0 +1,2 @@
+CONFIG_CHOICE0=m
+CONFIG_CHOICE1=m
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/expected_config b/scripts/kconfig/tests/choice_value_with_m_dep/expected_config
new file mode 100644
index 0000000..4d07b44
--- /dev/null
+++ b/scripts/kconfig/tests/choice_value_with_m_dep/expected_config
@@ -0,0 +1,3 @@
+CONFIG_MODULES=y
+CONFIG_DEP=m
+CONFIG_CHOICE0=y
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout b/scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout
new file mode 100644
index 0000000..5eac85d
--- /dev/null
+++ b/scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout
@@ -0,0 +1,4 @@
+Tristate Choice [M/y/?] 
+Tristate Choice
+> 1. Choice 0 (CHOICE0)
+choice[1]: 1
-- 
2.7.4

