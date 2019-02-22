Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:53323 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfBVHkW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Feb 2019 02:40:22 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 4/6] kbuild: simplify single target rules
Date: Fri, 22 Feb 2019 16:40:09 +0900
Message-Id: <1550821211-30324-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The dependency will be checked anyway after Kbuild descends into a
sub-directory. Skip object/source dependency checks in top Makefile.

VPATH can be simpler since the top Makefile no longer checks the
presence of the source file, which is located in in the external
module directory.

One good thing is, it can compile an object from a generated source
file.

  $ make crypto/rsapubkey.asn1.o
    ...
  ASN.1   crypto/rsapubkey.asn1.c
  CC      crypto/rsapubkey.asn1.o

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Do not merge pattern rules

 Makefile | 47 ++++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/Makefile b/Makefile
index 538a4f1..4d8516e 100644
--- a/Makefile
+++ b/Makefile
@@ -219,7 +219,7 @@ objtree		:= .
 src		:= $(srctree)
 obj		:= $(objtree)
 
-VPATH		:= $(srctree)$(if $(KBUILD_EXTMOD),:$(KBUILD_EXTMOD))
+VPATH		:= $(srctree)
 
 export srctree objtree VPATH
 
@@ -1703,31 +1703,23 @@ tools/%: FORCE
 #  target-dir => where to store outputfile
 #  build-dir  => directory in kernel source tree to use
 
-ifeq ($(KBUILD_EXTMOD),)
-        build-dir  = $(patsubst %/,%,$(dir $@))
-        target-dir = $(dir $@)
-else
-        zap-slash=$(filter-out .,$(patsubst %/,%,$(dir $@)))
-        build-dir  = $(KBUILD_EXTMOD)$(if $(zap-slash),/$(zap-slash))
-        target-dir = $(if $(KBUILD_EXTMOD),$(dir $<),$(dir $@))
-endif
-
-%.s: %.c prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.i: %.c prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.o: %.c prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.lst: %.c prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.s: %.S prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.o: %.S prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.symtypes: %.c prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.ll: %.c prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+build-target = $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD)/)$@
+build-dir = $(patsubst %/,%,$(dir $(build-target)))
+
+%.i: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.ll: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.lst: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.o: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.s: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.symtypes: prepare FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+%.ko: %.o
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 # Modules
 PHONY += /
@@ -1737,9 +1729,6 @@ PHONY += /
 Documentation/ samples/: headers_install
 %/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
-%.ko: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(@:.ko=.o)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 # FIXME Should go into a make.lib or something
 # ===========================================================================
-- 
2.7.4
