Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19281 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752330AbdKGQeG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 11:34:06 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: create built-in.o automatically if parent directory wants it
Date: Wed,  8 Nov 2017 01:31:46 +0900
Message-Id: <1510072307-16819-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>

"obj-y += foo/" syntax requires Kbuild to visit the "foo" subdirectory
and link built-in.o from that directory.  This means foo/Makefile is
responsible for creating built-in.o even if there is no object to
link (in this case, built-in.o is an empty archive).

We have had several fixups like commit 4b024242e8a4 ("kbuild: Fix
linking error built-in.o no such file or directory"), then ended up
with a complex condition as follows:

  ifneq ($(strip $(obj-y) $(obj-m) $(obj-) $(subdir-m) $(lib-target)),)
  builtin-target := $(obj)/built-in.o
  endif

We still have more cases not covered by the above, so we need to add
  obj- := dummy.o
in several places just for creating empty built-in.o.

A key point is, the parent Makefile knows whether built-in.o is needed
or not.  If a subdirectory needs to create built-in.o, its parent can
tell the fact when Kbuild descends into it.

If non-empty $(need-builtin) flag is passed from the parent, built-in.o
should be created.  $(obj-y) should be still checked to support the
single target "%/".  All of ugly tricks will go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile               | 2 +-
 scripts/Makefile.build | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 008a4e5..cc0b618 100644
--- a/Makefile
+++ b/Makefile
@@ -1003,7 +1003,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
 
 PHONY += $(vmlinux-dirs)
 $(vmlinux-dirs): prepare scripts
-	$(Q)$(MAKE) $(build)=$@
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1
 
 define filechk_kernel.release
 	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 061d0c3..e1c6efd 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -84,7 +84,7 @@ lib-target := $(obj)/lib.a
 obj-y += $(obj)/lib-ksyms.o
 endif
 
-ifneq ($(strip $(obj-y) $(obj-m) $(obj-) $(subdir-m) $(lib-target)),)
+ifneq ($(strip $(obj-y) $(need-builtin)),)
 builtin-target := $(obj)/built-in.o
 endif
 
@@ -569,7 +569,7 @@ targets += $(multi-used-y) $(multi-used-m)
 
 PHONY += $(subdir-ym)
 $(subdir-ym):
-	$(Q)$(MAKE) $(build)=$@
+	$(Q)$(MAKE) $(build)=$@ need-builtin=$(if $(findstring $@,$(subdir-obj-y)),1)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
-- 
2.7.4

