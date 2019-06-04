Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:39732 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfFDKP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:58 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 13/15] kbuild: add support for ensuring headers are self-contained
Date: Tue,  4 Jun 2019 19:14:07 +0900
Message-Id: <20190604101409.2078-14-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

From: Jani Nikula <jani.nikula@intel.com>

Sometimes it's useful to be able to explicitly ensure certain headers
remain self-contained, i.e. that they are compilable as standalone
units, by including and/or forward declaring everything they depend on.

Add special target header-test-y where individual Makefiles can add
headers to be tested if CONFIG_HEADER_TEST is enabled. This will
generate a dummy C file per header that gets built as part of extra-y.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.txt |  7 +++++++
 init/Kconfig                       |  9 +++++++++
 scripts/Makefile.build             | 10 ++++++++++
 scripts/Makefile.lib               |  3 +++
 4 files changed, 29 insertions(+)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index bac301a73a86..ca4b24ec0399 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1018,6 +1018,13 @@ When kbuild executes, the following steps are followed (roughly):
 	In this example, extra-y is used to list object files that
 	shall be built, but shall not be linked as part of built-in.a.
 
+    header-test-y
+
+	header-test-y specifies headers (*.h) in the current directory that
+	should be compile tested to ensure they are self-contained,
+	i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
+	this autogenerates dummy sources to include the headers, and builds them
+	as part of extra-y.
 
 --- 6.7 Commands useful for building a boot image
 
diff --git a/init/Kconfig b/init/Kconfig
index 36894c9fb420..02d8897b91fb 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -96,6 +96,15 @@ config COMPILE_TEST
 	  here. If you are a user/distributor, say N here to exclude useless
 	  drivers to be distributed.
 
+config HEADER_TEST
+	bool "Compile test headers that should be standalone compilable"
+	help
+	  Compile test headers listed in header-test-y target to ensure they are
+	  self-contained, i.e. compilable as standalone units.
+
+	  If you are a developer or tester and want to ensure the requested
+	  headers are self-contained, say Y here. Otherwise, choose N.
+
 config LOCALVERSION
 	string "Local version - append to kernel release"
 	help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ae9cf740633e..2b4d56483c2e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -294,6 +294,16 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Dummy C sources for header test (header-test-y target)
+# ---------------------------------------------------------------------------
+
+quiet_cmd_header_test = HDRTEST $@
+      cmd_header_test = echo "\#include \"$(<F)\"" > $@
+
+# FIXME: would be nice to be able to limit this implicit rule to header-test-y
+$(obj)/%.header_test.c: $(src)/%.h FORCE
+	$(call if_changed,header_test)
+
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f1f38c8cdc74..60a739a22b9c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
 extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
+# Test self-contained headers
+extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.o,$(header-test-y))
+
 # Add subdir path
 
 extra-y		:= $(addprefix $(obj)/,$(extra-y))
-- 
2.17.1
