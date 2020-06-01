Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40022 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/37] modpost: refactor -i option calculation
Date: Mon,  1 Jun 2020 14:57:10 +0900
Message-Id: <20200601055731.3006266-16-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

Prepare to use -i for in-tree modpost as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 8d000987b201..6808086075b6 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,13 +43,9 @@ __modpost:
 include include/config/auto.conf
 include scripts/Kbuild.include
 
-kernelsymfile := $(objtree)/Module.symvers
-
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
-	$(if $(KBUILD_EXTMOD),-i $(kernelsymfile))					\
-	$(if $(KBUILD_EXTMOD),$(addprefix -i ,$(KBUILD_EXTRA_SYMBOLS)))			\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w) \
 	-o $@
@@ -86,12 +82,14 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
 # modpost option for external modules
 MODPOST += -e
 
+input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
 
 endif
 
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
+	$(addprefix -i ,$(input-symdump)) \
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
 
 ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
-- 
2.25.1
