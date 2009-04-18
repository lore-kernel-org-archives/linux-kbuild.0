Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:45875 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753081AbZDRB2V (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Apr 2009 21:28:21 -0400
Date: Fri, 17 Apr 2009 18:28:55 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] docs: also clean index.html
Message-Id: <20090417182855.145021dd.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-doc@vger.kernel.org, samr <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Missed index.html in "make cleandocs", so add it.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 Documentation/DocBook/Makefile |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- lnx-2630-rc2.orig/Documentation/DocBook/Makefile
+++ lnx-2630-rc2/Documentation/DocBook/Makefile
@@ -143,7 +143,8 @@ quiet_cmd_db2pdf = PDF     $@
 	$(call cmd,db2pdf)
 
 
-main_idx = Documentation/DocBook/index.html
+index = index.html
+main_idx = Documentation/DocBook/$(index)
 build_main_index = rm -rf $(main_idx) && \
 		   echo '<h1>Linux Kernel HTML Documentation</h1>' >> $(main_idx) && \
 		   echo '<h2>Kernel Version: $(KERNELVERSION)</h2>' >> $(main_idx) && \
@@ -232,7 +233,7 @@ clean-files := $(DOCBOOKS) \
 	$(patsubst %.xml, %.pdf,  $(DOCBOOKS)) \
 	$(patsubst %.xml, %.html, $(DOCBOOKS)) \
 	$(patsubst %.xml, %.9,    $(DOCBOOKS)) \
-	$(C-procfs-example)
+	$(C-procfs-example) $(index)
 
 clean-dirs := $(patsubst %.xml,%,$(DOCBOOKS)) man
 
