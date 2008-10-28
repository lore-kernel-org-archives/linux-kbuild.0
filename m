Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from queueout01-winn.ispmail.ntl.com ([81.103.221.31]:10979 "EHLO
	queueout01-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752120AbYJ1N4m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Oct 2008 09:56:42 -0400
From: Ian Campbell <ijc@hellion.org.uk>
Content-Type: text/plain
Date: Tue, 28 Oct 2008 13:36:25 +0000
Message-Id: <1225200985.12607.186.camel@zakaz.uk.xensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: KBUILD: do not include arch/<ARCH>/include/asm in find-sources
	twice.
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Architectures which have moved their includes to arch/<ARCH>/include
now list the headers twice in the source listing used by "make
cscope" and friends, causing those tools to list symbols twice.

Skipping these files in the ALLSOURCE_ARCHS pass rather than removing
the ALLINCLUDE_ARCHS pass preserves the semantics of the later.

Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

diff -r a613b893f5b5 Makefile
--- a/Makefile	Mon Oct 27 10:29:49 2008 +0000
+++ b/Makefile	Tue Oct 28 13:33:04 2008 +0000
@@ -1435,7 +1435,8 @@
 define find-sources
         ( for arch in $(ALLSOURCE_ARCHS) ; do \
 	       find $(__srctree)arch/$${arch} $(RCS_FIND_IGNORE) \
-	            -name $1 -print; \
+		    -wholename $(__srctree)arch/$${arch}/include/asm -type d -prune \
+	            -o -name $1 -print; \
 	  done ; \
 	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
 	       -name $1 -print; \

-- 
Ian Campbell
Current Noise: Exodus - The Garden Of Bleeding

Whatever you want to do, you have to do something else first.

