Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D6BC636CC
	for <linux-kbuild@archiver.kernel.org>; Tue, 31 Jan 2023 10:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjAaKiC (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 31 Jan 2023 05:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjAaKiB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Jan 2023 05:38:01 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3489CA5C8
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Jan 2023 02:37:59 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:fd54:3eff:f16a:8c82])
        by laurent.telenet-ops.be with bizsmtp
        id FNdx290083oGUMV01NdxMr; Tue, 31 Jan 2023 11:37:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pMo1H-007vjy-3t;
        Tue, 31 Jan 2023 11:37:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pMo1V-000Nfx-1O;
        Tue, 31 Jan 2023 11:37:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] compiler-intel: Remove duplicate RELOC_HIDE()
Date:   Tue, 31 Jan 2023 11:37:55 +0100
Message-Id: <35c0fc4ba93b11c4b8a55c2907f736a840cd12a3.1675161286.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The RELOC_HIDE() implementation for the Intel compiler is identical to
the generic version in <linux/compiler.h>, so the former can just be
removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not even compile-tested.
---
 include/linux/compiler-intel.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/compiler-intel.h b/include/linux/compiler-intel.h
index b17f3cd18334df3d..efc8fafb58f595b2 100644
--- a/include/linux/compiler-intel.h
+++ b/include/linux/compiler-intel.h
@@ -16,11 +16,6 @@
 #define barrier() __memory_barrier()
 #define barrier_data(ptr) barrier()
 
-#define RELOC_HIDE(ptr, off)					\
-  ({ unsigned long __ptr;					\
-     __ptr = (unsigned long) (ptr);				\
-    (typeof(ptr)) (__ptr + (off)); })
-
 /* This should act as an optimization barrier on var.
  * Given that this compiler does not have inline assembly, a compiler barrier
  * is the best we can do.
-- 
2.34.1

