Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:48057 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944Ab1CVOjU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Mar 2011 10:39:20 -0400
Date: Tue, 22 Mar 2011 22:38:43 +0800
From: Harry Wei <jiaweiwei.xiyou@gmail.com>
Subject: [PATCH]Clean up CodingStyle for scripts/kconfig/gconf.c
Message-ID: <20110322143839.GA10291@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: greg@kroah.com, joe@perches.com, akpm@linux-foundation.org

Hi us,
   	Clean up CodingStyle for scripts/kconfig/gconf.c.

Thanks.
Best Regards.
Harry Wei.

Signed-off-by: Harry Wei <harryxiyou@gmail.com>
---
 scripts/kconfig/gconf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 4558961..56da945 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -7,7 +7,7 @@
  */
 
 #ifdef HAVE_CONFIG_H
-#  include <config.h>
+#include <config.h>
 #endif
 
 #include "lkc.h"
-- 
1.7.0.4

