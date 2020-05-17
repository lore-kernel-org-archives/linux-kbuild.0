Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38296 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgEQJte (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:34 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/29] modpost: move -T option close to the modpost command
Date: Sun, 17 May 2020 18:48:40 +0900
Message-Id: <20200517094859.2376211-11-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The '-T -' option reads the file list from stdin.

It is clearer to put it close to the piped command.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index b79bf0e30d32..da7730a43819 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,7 +66,7 @@ __modpost:
 
 else
 
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -88,7 +88,7 @@ modules := $(sort $(shell cat $(MODORDER)))
 # Read out modules.order instead of expanding $(modules) to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 quiet_cmd_modpost = MODPOST $(words $(modules)) modules
-      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)
+      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST) -T -
 
 __modpost:
 	$(call cmd,modpost)
-- 
2.25.1
