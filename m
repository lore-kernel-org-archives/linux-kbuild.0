Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35208 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750971AbcK0QaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Nov 2016 11:30:24 -0500
From: Cheah Kok Cheong <thrust73@gmail.com>
Subject: [PATCH] Scripts: kconfig: nconf: fix _GNU_SOURCE redefined warning
Date: Mon, 28 Nov 2016 00:28:26 +0800
Message-Id: <1480264106-29881-1-git-send-email-thrust73@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, mmarek@suse.cz, thrust73@gmail.com

Fix below warning when make nconfig is run initially
or after make clean.

  HOSTCC  scripts/kconfig/nconf.o
scripts/kconfig/nconf.c:8:0: warning: "_GNU_SOURCE" redefined
 #define _GNU_SOURCE
 ^
<command-line>:0:0: note: this is the location of the previous definition

Signed-off-by: Cheah Kok Cheong <thrust73@gmail.com>
---
 scripts/kconfig/nconf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index d42d534..a9bc533 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -5,7 +5,9 @@
  * Derived from menuconfig.
  *
  */
+#ifndef _GNU_SOURCE
 #define _GNU_SOURCE
+#endif
 #include <string.h>
 #include <stdlib.h>
 
-- 
2.7.4

