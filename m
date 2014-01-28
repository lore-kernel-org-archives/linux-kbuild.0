Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43905 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751121AbaA1Bst (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jan 2014 20:48:49 -0500
Message-ID: <1390873727.5027.56.camel@smoke>
Subject: [PATCH V2 3/3] mn10300: Remove redundant debugging info flag
From: Geoff Levand <geoff@infradead.org>
Date: Mon, 27 Jan 2014 17:48:47 -0800
In-Reply-To: <52E6CAD7.2020208@suse.cz>
References: <cover.1386804405.git.geoff@infradead.org>
	 <e9d530c5b8b1c9a8510d9c8db8663aedc393de8f.1386804405.git.geoff@infradead.org>
	 <52E6CAD7.2020208@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

The generic makefile now sets '-Wa,--gdwarf2' in KBUILD_AFLAGS, so
this setting is no longer needed in arch makefiles.

Also remove a commented out addition of a -O1 to KBUILD_CFLAGS, and
comment text relating to these removed lines.

Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Geoff Levand <geoff@infradead.org> for Huawei, Linaro
---
v2: Removed unused CONFIG_DEBUG_INFO conditional and related text comment.

 arch/mn10300/Makefile | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mn10300/Makefile b/arch/mn10300/Makefile
index a3d0fef..3f1ea5d 100644
--- a/arch/mn10300/Makefile
+++ b/arch/mn10300/Makefile
@@ -92,14 +92,6 @@ define archhelp
   echo  '* zImage        - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
 endef
 
-# If you make sure the .S files get compiled with debug info,
-# uncomment the following to disable optimisations
-# that are unhelpful whilst debugging.
-ifdef CONFIG_DEBUG_INFO
-#KBUILD_CFLAGS	+= -O1
-KBUILD_AFLAGS	+= -Wa,--gdwarf2
-endif
-
 #
 # include the appropriate processor- and unit-specific headers
 #
-- 
1.8.1.2



