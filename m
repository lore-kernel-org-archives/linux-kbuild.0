Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:23808 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754820AbZIDB0U (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Sep 2009 21:26:20 -0400
Date: Thu, 3 Sep 2009 21:25:43 -0400
From: Amerigo Wang <amwang@redhat.com>
Message-Id: <20090904012811.3749.77259.sendpatchset@localhost.localdomain>
In-Reply-To: <20090904012755.3749.69645.sendpatchset@localhost.localdomain>
References: <20090904012755.3749.69645.sendpatchset@localhost.localdomain>
Subject: [Patch 2/5] Makefile: clean .gcov files
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Amerigo Wang <amwang@redhat.com>


Clean *.gcov files when "make clean".

Signed-off-by: WANG Cong <amwang@redhat.com>

---
Index: linux-2.6/Makefile
===================================================================
--- linux-2.6.orig/Makefile
+++ linux-2.6/Makefile
@@ -1218,7 +1218,8 @@ clean: archclean $(clean-dirs)
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
 		-o -name '*.symtypes' -o -name 'modules.order' \
 		-o -name 'Module.markers' -o -name '.tmp_*.o.*' \
-		-o -name '*.gcno' \) -type f -print | xargs rm -f
+		-o -name '*.gcno' -o -name '*.gcov' \) \
+		-type f -print | xargs rm -f
 
 # mrproper - Delete all generated files, including .config
 #
