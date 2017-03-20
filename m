Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vmicros1.altlinux.org ([194.107.17.57]:34846 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755015AbdCTRRH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 13:17:07 -0400
Date: Mon, 20 Mar 2017 20:15:53 +0300
From: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Subject: [PING PATCH v2] jump label: fix passing kbuild_cflags when checking
 for asm goto support
Message-ID: <20170320171553.GB23333@glebfm.cloud.tilaa.com>
References: <20170310162411.GA18175@glebfm.cloud.tilaa.com>
 <20170310120422.14e19269@gandalf.local.home>
 <20170310173952.GW27556@glebfm.cloud.tilaa.com>
 <20170310124210.5f52305f@gandalf.local.home>
 <20170310175536.GX27556@glebfm.cloud.tilaa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170310175536.GX27556@glebfm.cloud.tilaa.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: David Lin <dtwlin@google.com>, "Anton V. Boyarshinov" <boyarsh@altlinux.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

The latest change of asm goto support check added passing of KBUILD_CFLAGS
to compiler.  When these flags reference gcc plugins that are not built yet,
the check fails.

When one runs "make bzImage" followed by "make modules", the kernel is always
built with HAVE_JUMP_LABEL disabled, while the modules are built depending on
CONFIG_JUMP_LABEL.  If HAVE_JUMP_LABEL macro happens to be different, modules
are built with undefined references, e.g.:

ERROR: "static_key_slow_inc" [net/netfilter/xt_TEE.ko] undefined!
ERROR: "static_key_slow_dec" [net/netfilter/xt_TEE.ko] undefined!
ERROR: "static_key_slow_dec" [net/netfilter/nft_meta.ko] undefined!
ERROR: "static_key_slow_inc" [net/netfilter/nft_meta.ko] undefined!
ERROR: "nf_hooks_needed" [net/netfilter/ipvs/ip_vs.ko] undefined!
ERROR: "nf_hooks_needed" [net/ipv6/ipv6.ko] undefined!
ERROR: "static_key_count" [net/ipv6/ipv6.ko] undefined!
ERROR: "static_key_slow_inc" [net/ipv6/ipv6.ko] undefined!

This change moves the check before all these references are added
to KBUILD_CFLAGS.  This is correct because subsequent KBUILD_CFLAGS
modifications are not relevant to this check.

Reported-by: Anton V. Boyarshinov <boyarsh@altlinux.org>
Fixes: 35f860f9ba6a ("jump label: pass kbuild_cflags when checking for asm goto support")
Cc: stable@vger.kernel.org	# v4.10
Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Acked-by: David Lin <dtwlin@google.com>
---
v2: update description of the problem fixed by this patch

 Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 165cf97..7e3aade 100644
--- a/Makefile
+++ b/Makefile
@@ -653,6 +653,12 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
 
+# check for 'asm goto'
+ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
+	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
+	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
+endif
+
 include scripts/Makefile.gcc-plugins
 
 ifdef CONFIG_READABLE_ASM
@@ -798,12 +804,6 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 # use the deterministic mode of AR if available
 KBUILD_ARFLAGS := $(call ar-option,D)
 
-# check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
-	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
-	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
-endif
-
 include scripts/Makefile.kasan
 include scripts/Makefile.extrawarn
 include scripts/Makefile.ubsan

-- 
glebfm
