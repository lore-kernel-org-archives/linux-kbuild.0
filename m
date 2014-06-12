Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:41310 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753017AbaFLP2R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Jun 2014 11:28:17 -0400
Received: by mail-pb0-f53.google.com with SMTP id uo5so856836pbc.12
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jun 2014 08:28:16 -0700 (PDT)
From: Andy Lutomirski <luto@amacapital.net>
Subject: [PATCH v3] x86,vdso: Fix vdso_install
Date: Thu, 12 Jun 2014 08:28:10 -0700
Message-Id: <b10299edd8ba98d17e07dafcd895b8ecf4d99eff.1402586707.git.luto@amacapital.net>
In-Reply-To: <CA+5PVA5rP4cF14-ckD4K4MgBNtfHB+xPg3whEL26JkxegE7qpg@mail.gmail.com>
References: <CA+5PVA5rP4cF14-ckD4K4MgBNtfHB+xPg3whEL26JkxegE7qpg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, Josh Boyer <jwboyer@fedoraproject.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, sam@ravnborg.org, Andy Lutomirski <luto@amacapital.net>

The filenames are different now.  Inspired by a patch from
Sam Ravnborg.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reported-by: Josh Boyer <jwboyer@fedoraproject.org>
Signed-off-by: Andy Lutomirski <luto@amacapital.net>
---

I kept Sam's ack from v2, since v3 has only a trivial change.

Changes from v1: Remove core kbuild change
Changes from v2: Name the result .so files again, not .so.dbg

 arch/x86/vdso/Makefile | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/vdso/Makefile b/arch/x86/vdso/Makefile
index 9769df0..845b45e 100644
--- a/arch/x86/vdso/Makefile
+++ b/arch/x86/vdso/Makefile
@@ -9,11 +9,6 @@ VDSOX32-$(CONFIG_X86_X32_ABI)	:= y
 VDSO32-$(CONFIG_X86_32)		:= y
 VDSO32-$(CONFIG_COMPAT)		:= y
 
-vdso-install-$(VDSO64-y)	+= vdso.so
-vdso-install-$(VDSOX32-y)	+= vdsox32.so
-vdso-install-$(VDSO32-y)	+= $(vdso32-images)
-
-
 # files to link into the vdso
 vobjs-y := vdso-note.o vclock_gettime.o vgetcpu.o
 
@@ -176,15 +171,20 @@ VDSO_LDFLAGS = -fPIC -shared $(call cc-ldoption, -Wl$(comma)--hash-style=sysv) \
 GCOV_PROFILE := n
 
 #
-# Install the unstripped copy of vdso*.so listed in $(vdso-install-y).
+# Install the unstripped copies of vdso*.so.
 #
-quiet_cmd_vdso_install = INSTALL $@
-      cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
-$(vdso-install-y): %.so: $(obj)/%.so.dbg FORCE
+quiet_cmd_vdso_install = INSTALL $(@:install_%=%)
+      cmd_vdso_install = cp $< $(MODLIB)/vdso/$(@:install_%=%)
+
+vdso_img_insttargets := $(vdso_img_sodbg:%.dbg=install_%)
+
+$(MODLIB)/vdso: FORCE
 	@mkdir -p $(MODLIB)/vdso
+
+$(vdso_img_insttargets): install_%: $(obj)/%.dbg $(MODLIB)/vdso FORCE
 	$(call cmd,vdso_install)
 
-PHONY += vdso_install $(vdso-install-y)
-vdso_install: $(vdso-install-y)
+PHONY += vdso_install $(vdso_img_insttargets)
+vdso_install: $(vdso_img_insttargets) FORCE
 
 clean-files := vdso32-syscall* vdso32-sysenter* vdso32-int80*
-- 
1.9.3

