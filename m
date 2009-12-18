Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpoutwbe07.prod.mesa1.secureserver.net ([208.109.78.209]:52726
	"HELO smtpoutwbe07.prod.mesa1.secureserver.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750709AbZLRBWQ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 20:22:16 -0500
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Message-Id: <20091217182213.0b50c25debf12a9aa545bf810459b532.d18e208fbe.wbe@email.secureserver.net>
From: "Jiafu He" <jay@goldhive.com>
Subject: [PATCH 1/2] Makefile.build: Fix linking error built-in.o no such file or
 directory
Date: Thu, 17 Dec 2009 18:22:13 -0700
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Michal wrote:
> 
> Ack on this part, I need to think a bit more about the second part :).
> Could you please send two separate patches, they fix two independent
> issues after all.
> 
Here it the first patch resent. Thanks.

This patch fixes the link error "built-in.o: no such file or directory".
The problem happens if "dirx/Makefile" contains only "obj-m += diry/
dirz/" and the empty "dirx/built-in.o" is missing. Adding $(subdir-m)
into check for builtin-target fixes this error.

Signed-off-by: Jiafu He <jay@goldhive.com>
-----
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 341b589..4926fee 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -82,7 +82,7 @@ ifneq ($(strip $(lib-y) $(lib-m) $(lib-n) $(lib-)),)
 lib-target := $(obj)/lib.a
 endif
 
-ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(lib-target)),)
+ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(subdir-m)
$(lib-target)),)
 builtin-target := $(obj)/built-in.o
 endif
-----

