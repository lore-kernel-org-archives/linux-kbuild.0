Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34502 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfHJPyn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 09/11] kbuild: unify clean-dirs rule for in-kernel and external module
Date: Sun, 11 Aug 2019 00:53:05 +0900
Message-Id: <20190810155307.29322-10-yamada.masahiro@socionext.com>
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Factor out the duplicated code for in-kernel and external module
cleaning.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index e60c09d57b30..871c42e241a6 100644
--- a/Makefile
+++ b/Makefile
@@ -1017,6 +1017,7 @@ vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
 			$(drivers-) $(net-) $(libs-) $(virt-))))
 
 build-dirs	:= $(vmlinux-dirs)
+clean-dirs	:= $(vmlinux-alldirs)
 
 init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
@@ -1388,11 +1389,8 @@ DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
 #
 clean: rm-dirs  := $(CLEAN_DIRS)
 clean: rm-files := $(CLEAN_FILES)
-clean-dirs      := $(addprefix _clean_, $(vmlinux-alldirs))
 
-PHONY += $(clean-dirs) clean archclean vmlinuxclean
-$(clean-dirs):
-	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
+PHONY += archclean vmlinuxclean
 
 vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
@@ -1629,12 +1627,7 @@ PHONY += _emodinst_post
 _emodinst_post: _emodinst_
 	$(call cmd,depmod)
 
-clean-dirs := $(addprefix _clean_,$(KBUILD_EXTMOD))
-
-PHONY += $(clean-dirs) clean
-$(clean-dirs):
-	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
-
+clean-dirs := $(KBUILD_EXTMOD)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
 
 PHONY += /
@@ -1664,6 +1657,11 @@ descend: $(build-dirs)
 $(build-dirs): prepare
 	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
 
+clean-dirs := $(addprefix _clean_, $(clean-dirs))
+PHONY += $(clean-dirs) clean
+$(clean-dirs):
+	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
+
 clean: $(clean-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
-- 
2.17.1
