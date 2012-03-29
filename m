Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pmx.elettra.trieste.it ([140.105.206.203]:55844 "EHLO
	pmx.elettra.trieste.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933373Ab2C2PBD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Mar 2012 11:01:03 -0400
From: Alessio Igor Bogani <abogani@kernel.org>
Subject: [PATCH] Let modpost parses vmlinux instead of vmlinux.o
Date: Thu, 29 Mar 2012 16:53:06 +0200
Message-Id: <1333032786-12457-1-git-send-email-abogani@kernel.org>
In-Reply-To: <4F737193.4030709@am.sony.com>
References: <4F737193.4030709@am.sony.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frank.rowand@am.sony.com>
Cc: Rowand Frank <Frank_Rowand@sonyusa.com>, Rusty Russell <rusty@rustcorp.com.au>, Jan Beulich <jbeulich@novell.com>, Kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Tim Bird <Tim.Bird@am.sony.com>, Anders Kaseorg <andersk@ksplice.com>, Arnaud Lacombe <lacombar@gmail.com>, Alessio Igor Bogani <abogani@kernel.org>

Dear Mr. Rowand,

What do you think about this patch?
Thanks!

Ciao,
Alessio

---
 Makefile                 |    2 +-
 scripts/Makefile.modpost |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 123d858..b589d1f 100644
--- a/Makefile
+++ b/Makefile
@@ -876,7 +876,7 @@ quiet_cmd_vmlinux-modpost = LD      $@
 define rule_vmlinux-modpost
 	:
 	+$(call cmd,vmlinux-modpost)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost $@
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost $*
 	$(Q)echo 'cmd_$@ := $(cmd_vmlinux-modpost)' > $(dot-target).cmd
 endef
 
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 56dfafc..ca0db29 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -93,7 +93,7 @@ __modpost: $(modules:.ko=.o) FORCE
 quiet_cmd_kernel-mod = MODPOST $@
       cmd_kernel-mod = $(modpost) $@
 
-vmlinux.o: FORCE
+vmlinux vmlinux.o: FORCE
 	$(call cmd,kernel-mod)
 
 # Declare generated files as targets for modpost
-- 
1.7.5.4

