Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:57438 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751319AbeD2B4x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Apr 2018 21:56:53 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [RFC patch] Documenation: don't build media .rst files when not
 building Documentation/media/
Message-ID: <10b4346b-d9ac-b7d1-4187-0a227ae53cf4@infradead.org>
Date: Sat, 28 Apr 2018 18:56:51 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>


Don't build media .rst files from header files when Documentation/media/
is not in the target SPHINXDIRS.

It looks like the dependencies in Documentation/media/Makefile should
take care of running parse-headers.pl to generated .rst files from the
header files, but it's not happening and I don't see why not.

---
 Documentation/Makefile |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-next-20180426.orig/Documentation/Makefile
+++ linux-next-20180426/Documentation/Makefile
@@ -52,8 +52,7 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || ex
 #    e.g. "media" for the linux-tv book-set at ./Documentation/media
 
 quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
-      cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media $2 && \
-	PYTHONDONTWRITEBYTECODE=1 \
+      cmd_sphinx = PYTHONDONTWRITEBYTECODE=1 \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
 	$(SPHINXBUILD) \
 	-b $2 \

