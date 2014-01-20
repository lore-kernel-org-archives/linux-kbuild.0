Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:40943 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbaATFLC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jan 2014 00:11:02 -0500
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile11) with ESMTP id s0K5B0Zc006254
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:11:00 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili16) with ESMTP id s0K5B0M23755
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:11:00 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: docbook: use $(obj) and $(src) rather than specific path
Date: Mon, 20 Jan 2014 14:10:59 +0900
Message-Id: <1390194659-15155-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Documentation/DocBook/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index bc3d9f8..6ea50a3 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -16,7 +16,7 @@ DOCBOOKS := z8530book.xml device-drivers.xml \
 	    alsa-driver-api.xml writing-an-alsa-driver.xml \
 	    tracepoint.xml drm.xml media_api.xml
 
-include $(srctree)/Documentation/DocBook/media/Makefile
+include $(srctree)/$(src)/media/Makefile
 
 ###
 # The build process is as follows (targets):
@@ -57,14 +57,14 @@ mandocs: $(MAN)
 
 installmandocs: mandocs
 	mkdir -p /usr/local/man/man9/
-	install Documentation/DocBook/man/*.9.gz /usr/local/man/man9/
+	install $(obj)/man/*.9.gz /usr/local/man/man9/
 
 ###
 #External programs used
 KERNELDOC = $(srctree)/scripts/kernel-doc
 DOCPROC   = $(objtree)/scripts/docproc
 
-XMLTOFLAGS = -m $(srctree)/Documentation/DocBook/stylesheet.xsl
+XMLTOFLAGS = -m $(srctree)/$(src)/stylesheet.xsl
 XMLTOFLAGS += --skip-validation
 
 ###
@@ -138,7 +138,7 @@ quiet_cmd_db2pdf = PDF     $@
 
 
 index = index.html
-main_idx = Documentation/DocBook/$(index)
+main_idx = $(obj)/$(index)
 build_main_index = rm -rf $(main_idx); \
 		   echo '<h1>Linux Kernel HTML Documentation</h1>' >> $(main_idx) && \
 		   echo '<h2>Kernel Version: $(KERNELVERSION)</h2>' >> $(main_idx) && \
@@ -147,7 +147,7 @@ build_main_index = rm -rf $(main_idx); \
 quiet_cmd_db2html = HTML    $@
       cmd_db2html = xmlto xhtml $(XMLTOFLAGS) -o $(patsubst %.html,%,$@) $< && \
 		echo '<a HREF="$(patsubst %.html,%,$(notdir $@))/index.html"> \
-        $(patsubst %.html,%,$(notdir $@))</a><p>' > $@
+		$(patsubst %.html,%,$(notdir $@))</a><p>' > $@
 
 %.html:	%.xml
 	@(which xmlto > /dev/null 2>&1) || \
-- 
1.8.3.2

