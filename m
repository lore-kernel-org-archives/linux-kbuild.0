Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38302 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgEQJtf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:35 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Date: Sun, 17 May 2020 18:48:39 +0900
Message-Id: <20200517094859.2376211-10-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

$(firstword ...) in scripts/Makefile.modpost was added by commit
3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
to build multiple external module directories.

This feature has been broken for a while. Remove the bitrotten code, and
stop parsing if M or KBUILD_EXTMOD contains multiple words.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 3 +++
 scripts/Makefile.modpost | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1915630cc24b..aeb690c692ee 100644
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
