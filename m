Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:37728 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbeHHEcS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Aug 2018 00:32:18 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: make samples really depend on headers_install
Date: Wed,  8 Aug 2018 11:14:14 +0900
Message-Id: <1533694454-7086-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Kernel headers must be installed into $(objtree)/usr/include to avoid
the build failure of samples.

Commit ddea05fa148b ("kbuild: make samples depend on headers_install")
addressed this, but "samples/" is only used for the single target build.

"make samples/" properly installs kernel headers, but it does not work
for general building because a phony target "sample" (no trailing slash)
is used.

Reported-by: David Howells <dhowells@redhat.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Correct commit log (backslash -> slash)
  - Fix a typo

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7a3c454..1e47d13 100644
--- a/Makefile
+++ b/Makefile
@@ -1009,9 +1009,10 @@ ifdef CONFIG_GDB_SCRIPTS
 endif
 	+$(call if_changed,link-vmlinux)
 
-# Build samples along the rest of the kernel
+# Build samples along the rest of the kernel. This needs headers_install.
 ifdef CONFIG_SAMPLES
 vmlinux-dirs += samples
+samples: headers_install
 endif
 
 # The actual objects are generated when descending,
-- 
2.7.4

