Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40007 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 20/37] modpost: show warning if any of symbol dump files is missing
Date: Mon,  1 Jun 2020 14:57:14 +0900
Message-Id: <20200601055731.3006266-20-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

If modpost fails to load a symbol dump file, it cannot check unresolved
symbols, hence module dependency will not be added. Nor CRCs can be added.

Currently, external module builds check only $(objtree)/Module.symvers,
but it should check files specified by KBUILD_EXTRA_SYMBOLS as well.

Move the warning message from the top Makefile to scripts/Makefile.modpost
and print the warning if any dump file is missing.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 10 +---------
 scripts/Makefile.modpost |  5 ++++-
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 6280c7597a2d..f80c4ff93ec9 100644
--- a/Makefile
+++ b/Makefile
@@ -1649,17 +1649,9 @@ else # KBUILD_EXTMOD
 # We are always building modules
 KBUILD_MODULES := 1
 
-PHONY += $(objtree)/Module.symvers
-$(objtree)/Module.symvers:
-	@test -e $(objtree)/Module.symvers || ( \
-	echo; \
-	echo "  WARNING: Symbol version dump $(objtree)/Module.symvers"; \
-	echo "           is missing; modules will have no dependencies and modversions."; \
-	echo )
-
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
-modules: descend $(objtree)/Module.symvers
+modules: descend
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_install
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 7d564a39f938..16fe19724c34 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -97,8 +97,11 @@ ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
 MODPOST += -n
 endif
 
+# Clear VPATH to not search for *.symvers in $(srctree). Check only $(objtree).
+VPATH :=
 $(input-symdump):
-	@:
+	@echo >&2 'WARNING: Symbol version dump "$@" is missing.'
+	@echo >&2 '         Modules may not have dependencies or modversions.'
 
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
-- 
2.25.1
