Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:60069 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbfG3P7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 11:59:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/4] kbuild: modpost: handle KBUILD_EXTRA_SYMBOLS only for external modules
Date: Wed, 31 Jul 2019 00:59:00 +0900
Message-Id: <20190730155902.5557-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190730155902.5557-1-yamada.masahiro@socionext.com>
References: <20190730155902.5557-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

KBUILD_EXTRA_SYMBOLS makes sense only when building external modules.
Moreover, the modpost sets 'external_module' if the -e option is given.

I replaced $(patsubst %, -e %,...) with simpler $(addprefix -e,...)
while I was here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index ad4b9829a456..c856512349cd 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -78,7 +78,7 @@ modpost = scripts/mod/modpost                    \
  $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a,)       \
  $(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)   \
  $(if $(KBUILD_EXTMOD),-I $(modulesymfile))      \
- $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))) \
+ $(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS))) \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
  $(if $(KBUILD_MODPOST_WARN),-w)
-- 
2.17.1
