Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ik-out-1112.google.com ([66.249.90.179]:8286 "EHLO
	ik-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbYGaMMO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Jul 2008 08:12:14 -0400
Received: by ik-out-1112.google.com with SMTP id c28so511818ika.5
        for <linux-kbuild@vger.kernel.org>; Thu, 31 Jul 2008 05:12:12 -0700 (PDT)
Date: Thu, 31 Jul 2008 13:10:28 +0100
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: [Patch] UML build: fix missing posix_types.h
Message-ID: <20080731121028.GA23636@hack.voiplan.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: jdike@addtoit.com, sam@ravnborg.org, linux-kbuild@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, Andrew Morton <akpm@osdl.org>


When building UML with 'O=foo' specified, I got:

CC      kernel/bounds.s
  In file included from
/home/wangcong/Projects/linux-2.6/include/linux/types.h:11,
                 from
/home/wangcong/Projects/linux-2.6/include/linux/page-flags.h:8,
                 from
/home/wangcong/Projects/linux-2.6/kernel/bounds.c:9:
/home/wangcong/Projects/linux-2.6/include/linux/posix_types.h:47:29:
error: asm/posix_types.h: No such file or directory
In file included from
/home/wangcong/Projects/linux-2.6/include/linux/page-flags.h:8,
                 from
/home/wangcong/Projects/linux-2.6/kernel/bounds.c:9:
/home/wangcong/Projects/linux-2.6/include/linux/types.h:12:23: error:
asm/types.h: No such file or directory
In file included from
/home/wangcong/Projects/linux-2.6/include/linux/page-flags.h:8,

Below patch fixed it, note, it is only tested for x86 and um.

Signed-off-by: WANG Cong <wangcong@zeuux.org>
Cc: sam@ravnborg.org
Cc: jdike@addtoit.com

---
diff --git a/Makefile b/Makefile
index aa527a4..39130d1 100644
--- a/Makefile
+++ b/Makefile
@@ -930,7 +930,8 @@ ifneq ($(KBUILD_SRC),)
 		/bin/false; \
 	fi;
 	$(Q)if [ ! -d include2 ]; then mkdir -p include2; fi;
-	$(Q)if [ -e $(srctree)/include/asm-$(SRCARCH)/system.h ]; then  \
+	$(Q)if [ -e $(srctree)/include/asm-$(SRCARCH)/system.h -o \
+		 -e $(objtree)/include/asm-$(SRCARCH)/system.h ] ; then \
 	    ln -fsn $(srctree)/include/asm-$(SRCARCH) include2/asm;     \
 	    fi
 endif


