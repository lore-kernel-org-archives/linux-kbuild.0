Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19691 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Date: Mon, 25 May 2020 00:42:15 +0900
Message-Id: <20200524154235.380482-10-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

$(firstword ...) in scripts/Makefile.modpost was added by commit
3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
to build multiple external module directories.

It was a solution to resolve symbol dependencies when an external
module depends on another external module.

Commit 0d96fb20b7ed ("kbuild: Add new Kbuild variable
KBUILD_EXTRA_SYMBOLS") introduced another solution by passing symbol
info via KBUILD_EXTRA_SYMBOLS, then broke the multi-word M= support.

  include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
               $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)

... does not work if KBUILD_EXTMOD contains multiple words.

This feature has been broken for more than a decade. Remove the
bitrotten code, and stop parsing if M or KBUILD_EXTMOD contains
multiple words.

As Documentation/kbuild/modules.rst explains, if your module depends
on another one, there are two solutions:
  - add a common top-level Kbuild file
  - use KBUILD_EXTRA_SYMBOLS

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Add more commit log

 Makefile                 | 3 +++
 scripts/Makefile.modpost | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 72eb55a36545..48a2dfaf3bf3 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,9 @@ ifeq ("$(origin M)", "command line")
   KBUILD_EXTMOD := $(M)
 endif
 
+$(if $(word 2, $(KBUILD_EXTMOD)), \
+	$(error building multiple external modules is not supported))
+
 export KBUILD_CHECKSRC KBUILD_EXTMOD
 
 extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 957eed6a17a5..b79bf0e30d32 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -44,7 +44,7 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 
 kernelsymfile := $(objtree)/Module.symvers
-modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
+modulesymfile := $(KBUILD_EXTMOD)/Module.symvers
 
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
-- 
2.25.1
