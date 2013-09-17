Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm6-vm6.access.bullet.mail.gq1.yahoo.com ([216.39.63.154]:38027
	"EHLO nm6-vm6.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753490Ab3IQXPA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Sep 2013 19:15:00 -0400
From: danielfsantos@att.net
Subject: [PATCH 3/5] Makefile: Generate error_strings.h
Date: Tue, 17 Sep 2013 18:08:35 -0500
Message-Id: <1379459317-13046-4-git-send-email-daniel.santos@pobox.com>
In-Reply-To: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
References: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>
Cc: Daniel Santos <daniel.santos@pobox.com>

This is an initial attempt and needs improvement.  Ideally,
error_strings.h should only be generated when STRERROR or STRERROR_NAME
are enabled. This implementation also fails to remake error_strings.h
when arch-specific dependencies change.  Also, I've noticed that this
implementation fails to output a message when it's running, so help with
this would be appreciated.

Signed-off-by: Daniel Santos <daniel.santos@pobox.com>
---
 Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8243a23..38049ca 100644
--- a/Makefile
+++ b/Makefile
@@ -835,7 +835,7 @@ endif
 prepare2: prepare3 outputmakefile asm-generic
 
 prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
-                   include/config/auto.conf
+                   include/config/auto.conf include/generated/error_strings.h
 	$(cmd_crmodverdir)
 
 archprepare: archheaders archscripts prepare1 scripts_basic
@@ -873,6 +873,13 @@ $(version_h): $(srctree)/Makefile FORCE
 include/generated/utsrelease.h: include/config/kernel.release FORCE
 	$(call filechk,utsrelease.h)
 
+include/generated/error_strings.h: include/uapi/asm-generic/errno-base.h \
+				   include/uapi/asm-generic/errno.h \
+				   include/uapi/linux/errno.h \
+				   include/linux/errno.h
+	$(shell ARCH=$(ARCH) $(srctree)/scripts/mkstrerror.sh \
+			> $(srctree)/include/generated/error_strings.h)
+
 PHONY += headerdep
 headerdep:
 	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
-- 
1.8.1.5

