Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:36541 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750760AbcBFApK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Feb 2016 19:45:10 -0500
Received: by mail-pf0-f173.google.com with SMTP id n128so76683313pfn.3
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2016 16:45:10 -0800 (PST)
Date: Fri, 5 Feb 2016 16:44:38 -0800
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] kbuild: disable Android-specific compiler features
Message-ID: <20160206004438.GA21780@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

The Android compilers enable some non-standard features by default. While
most Android build systems inject the needed "-mno-android" option via
KCFLAGS, it happens too late (at least on x86_64), since KBUILD_CFLAGS
gains KCFLAGS after running (and failing) many cc-option tests. (For
example, the stack-protector tests happen after arch-specific
KBUILD_CFLAGS are added but before the external KCFLAGS are added.) As
such, we should notice this option and immediately turn it on as the
first cc-option test we run.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 6c1a3c247988..126c98b582bb 100644
--- a/Makefile
+++ b/Makefile
@@ -393,6 +393,10 @@ KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -Wno-format-security \
 		   -std=gnu89
 
+# We must turn off the Android-specific compiler options as early as possible
+# otherwise cc-option calls below may erroneously fail.
+KBUILD_CFLAGS	+= $(call cc-option,-mno-android,)
+
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
 KBUILD_AFLAGS   := -D__ASSEMBLY__
-- 
2.6.3


-- 
Kees Cook
Chrome OS & Brillo Security
