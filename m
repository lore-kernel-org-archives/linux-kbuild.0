Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46515 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755548Ab1HaNba (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 09:31:30 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] staging/cxt1e1: Header cleanup
Date: Wed, 31 Aug 2011 15:31:01 +0200
Message-Id: <1314797461-29837-1-git-send-email-mmarek@suse.cz>
In-Reply-To: <4E5E26B8.5030606@suse.cz>
References: <4E5E26B8.5030606@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: devel@driverdev.osuosl.org, Arnaud Lacombe <lacombar@gmail.com>, s.koylux@gmail.com, linux-kbuild@vger.kernel.org, Bob Beers <bob.beers@gmail.com>

Remove dead and unused code in sbecom_inline_linux.h. This also fixes a
build failure under Turkish locale, where include/config/modversions.h
is incorrectly named as modversIons.h (an unrelated kbuild bug) and the
driver tries to needlessly include the empty file.

Reported-by: Serdar KÖYLÜ <s.koylux@gmail.com>
Cc: Bob Beers <bob.beers@gmail.com>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/staging/cxt1e1/sbecom_inline_linux.h |   64 --------------------------
 1 files changed, 0 insertions(+), 64 deletions(-)

diff --git a/drivers/staging/cxt1e1/sbecom_inline_linux.h b/drivers/staging/cxt1e1/sbecom_inline_linux.h
index c0563e6..9ea2c0c 100644
--- a/drivers/staging/cxt1e1/sbecom_inline_linux.h
+++ b/drivers/staging/cxt1e1/sbecom_inline_linux.h
@@ -43,81 +43,17 @@
  */
 
 
-#if defined (__FreeBSD__) || defined (__NetBSD__)
-#include <sys/types.h>
-#else
 #include <linux/types.h>
-#if defined(CONFIG_SMP) && ! defined(__SMP__)
-#define __SMP__
-#endif
-#if defined(CONFIG_MODVERSIONS) && defined(MODULE) && ! defined(MODVERSIONS)
-#define MODVERSIONS
-#endif
-
-#ifdef MODULE
-#ifdef MODVERSIONS
-#include <config/modversions.h>
-#endif
 #include <linux/module.h>
-#endif
-#endif
-
 #include <linux/kernel.h>       /* resolves kmalloc references */
 #include <linux/skbuff.h>       /* resolves skb references */
 #include <linux/netdevice.h>    /* resolves dev_kree_skb_any */
 #include <asm/byteorder.h>      /* resolves cpu_to_le32 */
 
-#if 0
-
-/*** PORT POINT WARNING
- ***
- *** Under Linux 2.6 it has been found that compiler is re-ordering
- *** in-lined pci_write_32() functions to the detrement of correct
- *** hardware setup.  Therefore, inlining of PCI accesses has been
- *** de-implemented, and subroutine calls have been implemented.
- ***/
-
-static inline u_int32_t
-pci_read_32 (u_int32_t *p)
-{
-#ifdef FLOW_DEBUG
-    u_int32_t   v;
-
-    FLUSH_PCI_READ ();
-    v = le32_to_cpu (*p);
-    if (cxt1e1_log_level >= LOG_DEBUG)
-        pr_info("pci_read : %x = %x\n", (u_int32_t) p, v);
-    return v;
-#else
-                FLUSH_PCI_READ ();      /* */
-    return le32_to_cpu (*p);
-#endif
-}
-
-static inline void
-pci_write_32 (u_int32_t *p, u_int32_t v)
-{
-#ifdef FLOW_DEBUG
-    if (cxt1e1_log_level >= LOG_DEBUG)
-        pr_info("pci_write: %x = %x\n", (u_int32_t) p, v);
-#endif
-    *p = cpu_to_le32 (v);
-    FLUSH_PCI_WRITE ();             /* This routine is called from routines
-                                     * which do multiple register writes
-                                     * which themselves need flushing between
-                                     * writes in order to guarantee write
-                                     * ordering.  It is less code-cumbersome
-                                     * to flush here-in then to investigate
-                                     * and code the many other register
-                                     * writing routines. */
-}
-#else
 /* forward reference */
 u_int32_t   pci_read_32 (u_int32_t *p);
 void        pci_write_32 (u_int32_t *p, u_int32_t v);
 
-#endif
-
 
 /*
  * system dependent callbacks
-- 
1.7.6

