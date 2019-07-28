Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:60666 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1Rfh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 13:35:37 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: detect missing header include guard
Date: Mon, 29 Jul 2019 02:34:45 +0900
Message-Id: <20190728173445.10954-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190728173445.10954-1-yamada.masahiro@socionext.com>
References: <20190728173445.10954-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Our convention is to surround the whole of the header content with an
include guard. This avoids the same header being parsed over again in
case it is included multiple times.

The include guard is missing in several places, or broken due to the
mismatch between #ifndef and #define.

The recently added header-test-y syntax allows the comprehensive sanity
checks of headers. This commit adds another check; if include guard is
missing, the header will fail to build due to redefinition of something.

Some headers must be excluded from the test-coverage for now. I will
let them in after they are fixed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 3 ++-
 usr/include/Makefile   | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0d434d0afc0b..b024b108055b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -294,8 +294,9 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # header test (header-test-y, header-test-m target)
 # ---------------------------------------------------------------------------
 
+# include the header twice to catch missing header include guard.
 quiet_cmd_cc_s_h = CC      $@
-      cmd_cc_s_h = $(CC) $(c_flags) -S -o $@ -x c /dev/null -include $<
+      cmd_cc_s_h = $(CC) $(c_flags) -S -o $@ -x c /dev/null -include $< -include $<
 
 $(obj)/%.h.s: $(src)/%.h FORCE
 	$(call if_changed_dep,cc_s_h)
diff --git a/usr/include/Makefile b/usr/include/Makefile
index 1fb6abe29b2f..ee945819c9d8 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -28,8 +28,11 @@ header-test- += linux/android/binder.h
 header-test- += linux/android/binderfs.h
 header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
 header-test-$(CONFIG_CPU_LITTLE_ENDIAN) += linux/byteorder/little_endian.h
+header-test- += linux/chio.h		# missing include guard
+header-test- += linux/cryptouser.h	# missing include guard
 header-test- += linux/coda.h
 header-test- += linux/coda_psdev.h
+header-test- += linux/coff.h		# missing include guard
 header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
 header-test- += linux/fsmap.h
@@ -38,6 +41,7 @@ header-test- += linux/ivtv.h
 header-test- += linux/jffs2.h
 header-test- += linux/kexec.h
 header-test- += linux/matroxfb.h
+header-test- += linux/netfilter/xt_connlabel.h	# missing include guard
 header-test- += linux/netfilter_bridge/ebtables.h
 header-test- += linux/netfilter_ipv4/ipt_LOG.h
 header-test- += linux/netfilter_ipv6/ip6t_LOG.h
@@ -45,7 +49,9 @@ header-test- += linux/nfc.h
 header-test- += linux/omap3isp.h
 header-test- += linux/omapfb.h
 header-test- += linux/patchkey.h
+header-test- += linux/pg.h		# missing include guard
 header-test- += linux/phonet.h
+header-test- += linux/ppdev.h		# missing include guard
 header-test- += linux/reiserfs_xattr.h
 header-test- += linux/scc.h
 header-test- += linux/sctp.h
-- 
2.17.1
