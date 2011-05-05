Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:41884 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473Ab1EECDp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:45 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so1462033iwn.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:45 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 8/9] kconfig: regen parser
Date: Wed,  4 May 2011 22:03:23 -0400
Message-Id: <1304561004-2684-9-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/zconf.hash.c_shipped |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/zconf.hash.c_shipped b/scripts/kconfig/zconf.hash.c_shipped
index 96bbec5..40df000 100644
--- a/scripts/kconfig/zconf.hash.c_shipped
+++ b/scripts/kconfig/zconf.hash.c_shipped
@@ -1,5 +1,5 @@
 /* ANSI-C code produced by gperf version 3.0.4 */
-/* Command-line: gperf -t --output-file scripts/kconfig/zconf.hash.c_shipped -L ANSI-C -a -C -E -g -k '1,3,$' -p -t scripts/kconfig/zconf.gperf  */
+/* Command-line: gperf -t --output-file scripts/kconfig/zconf.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/kconfig/zconf.gperf  */
 
 #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-- 
1.7.3.4.574.g608b.dirty

