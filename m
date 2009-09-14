Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:40984 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756251AbZINVtf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:35 -0400
Message-Id: <200909142149.n8ELnHUx018940@imap1.linux-foundation.org>
Subject: [patch 16/18] kbuild: echo the record_mcount command
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, andi@firstfloor.org, ak@linux.intel.com

From: Andi Kleen <andi@firstfloor.org>

I had some problems with record_mcount in the Makefile and it was hard
to track down. Echo it by default to make it easier to diagnose.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/Makefile.build |    1 +
 1 file changed, 1 insertion(+)

diff -puN scripts/Makefile.build~kbuild-echo-the-record_mcount-command scripts/Makefile.build
--- a/scripts/Makefile.build~kbuild-echo-the-record_mcount-command
+++ a/scripts/Makefile.build
@@ -216,6 +216,7 @@ define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
 	$(call echo-cmd,cc_o_c) $(cmd_cc_o_c);				  \
 	$(cmd_modversions)						  \
+	$(call echo-cmd,record_mcount)					  \
 	$(cmd_record_mcount)						  \
 	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
 	                                              $(dot-target).tmp;  \
_
