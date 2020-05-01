Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.nic.cz ([217.31.204.67]:36504 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgEAWnK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 18:43:10 -0400
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH kbuild RFC] kbuild: fix modpost throwing away module symvers when linking vmlinux.o
Date: Sat,  2 May 2020 00:43:00 +0200
Message-Id: <20200501224300.1012-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

If vmlinux.o is rebuilt after modules, the current modpost code throws
away the information already stored in Module.symvers. This is due to
commit mentioned in the Fixes tag, which introduced this
backward-incompatible change which may break ceratin build systems (such
as that of OpenWRT).

Add code to look if modules.order is present when doing modpost for
vmlinux.o, and if it is, include it in modpost.

The change introduced here is ugly, therefore this is only a RFC patch.
Please comment whether fixing this backward-incompatibility is
acceptable.

Fixes: a721588d9475 ("kbuild: modpost: do not parse unnecessary ...")
Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 scripts/Makefile.modpost | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 952fff485546..d1eb4923e21b 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -60,7 +60,12 @@ MODPOST = scripts/mod/modpost						\
 ifdef MODPOST_VMLINUX
 
 quiet_cmd_modpost = MODPOST vmlinux.o
+ifeq ($(wildcard $(MODORDER)),)
       cmd_modpost = $(MODPOST) vmlinux.o
+else
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T -
+      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST) vmlinux.o
+endif
 
 __modpost:
 	$(call cmd,modpost)
-- 
2.24.1
