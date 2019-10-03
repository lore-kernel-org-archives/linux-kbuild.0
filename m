Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:49078 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCKaB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 06:30:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/4] modpost: do not parse vmlinux for external module builds
Date: Thu,  3 Oct 2019 19:29:13 +0900
Message-Id: <20191003102915.28301-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191003102915.28301-1-yamada.masahiro@socionext.com>
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When building external modules, $(objtree)/Module.symvers is scanned
for symbol information of vmlinux and in-tree modules.

Additionally, vmlinux is parsed if it exists in $(objtree)/.
This is totally redundant since all the necessary information is
contained in $(objtree)/Module.symvers.

Do not parse vmlinux at all for external module builds. This makes
sense because vmlinux is deleted by 'make clean'.

'make clean' leaves all the build artifacts for building external
modules. vmlinux is unneeded for that.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 952fff485546..72109d201196 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -67,8 +67,12 @@ __modpost:
 
 else
 
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T -
+
+ifeq ($(KBUILD_EXTMOD),)
+MODPOST += $(wildcard vmlinux)
+else
 # When building external modules load the Kbuild file to retrieve EXTRA_SYMBOLS info
-ifneq ($(KBUILD_EXTMOD),)
 
 # set src + obj - they may be used when building the .mod.c file
 obj := $(KBUILD_EXTMOD)
@@ -79,8 +83,6 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
 endif
 
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - $(wildcard vmlinux)
-
 # find all modules listed in modules.order
 modules := $(sort $(shell cat $(MODORDER)))
 
-- 
2.17.1
