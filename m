Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61982 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473Ab1EECDq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:46 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so1461966iwn.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:46 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 9/9] genksyms: regen parser
Date: Wed,  4 May 2011 22:03:24 -0400
Message-Id: <1304561004-2684-10-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/genksyms/genksyms.hash.c_shipped |    2 +-
 scripts/genksyms/lex.genksyms.c_shipped  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/genksyms.hash.c_shipped b/scripts/genksyms/genksyms.hash.c_shipped
index 04c6524..f17d54d 100644
--- a/scripts/genksyms/genksyms.hash.c_shipped
+++ b/scripts/genksyms/genksyms.hash.c_shipped
@@ -1,5 +1,5 @@
 /* ANSI-C code produced by gperf version 3.0.4 */
-/* Command-line: gperf -t --output-file scripts/genksyms/genksyms.hash.c -a -C -E -g -k '1,3,$' -p -t scripts/genksyms/genksyms.gperf  */
+/* Command-line: gperf -t --output-file scripts/genksyms/genksyms.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/genksyms/genksyms.gperf  */
 
 #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
diff --git a/scripts/genksyms/lex.genksyms.c_shipped b/scripts/genksyms/lex.genksyms.c_shipped
index 9a827a2..ec972bc 100644
--- a/scripts/genksyms/lex.genksyms.c_shipped
+++ b/scripts/genksyms/lex.genksyms.c_shipped
@@ -1,5 +1,5 @@
 
-#line 3 "scripts/genksyms/lex.genksyms.c"
+#line 3 "scripts/genksyms/lex.genksyms.c_shipped"
 
 #define  YY_INT_ALIGNED short int
 
-- 
1.7.3.4.574.g608b.dirty

