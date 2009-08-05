Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:42939 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752745AbZHEVv3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Aug 2009 17:51:29 -0400
From: Andi Kleen <andi@firstfloor.org>
References: <200908051151.557035535@firstfloor.org>
In-Reply-To: <200908051151.557035535@firstfloor.org>
Subject: [PATCH] [3/5] kbuild: Echo the record_mcount command
Message-Id: <20090805215129.B82A7B15D8@basil.firstfloor.org>
Date: Wed,  5 Aug 2009 23:51:29 +0200 (CEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


I had some problems with record_mcount in the Makefile and it was hard
to track down. Echo it by default to make it easier to diagnose.

Signed-off-by: Andi Kleen <ak@linux.intel.com>

---
 scripts/Makefile.build |    1 +
 1 file changed, 1 insertion(+)

Index: linux-2.6.31-rc1-ak/scripts/Makefile.build
===================================================================
--- linux-2.6.31-rc1-ak.orig/scripts/Makefile.build
+++ linux-2.6.31-rc1-ak/scripts/Makefile.build
@@ -216,6 +216,7 @@ define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
 	$(call echo-cmd,cc_o_c) $(cmd_cc_o_c);				  \
 	$(cmd_modversions)						  \
+	$(call echo-cmd,record_mcount)					  \
 	$(cmd_record_mcount)						  \
 	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
 	                                              $(dot-target).tmp;  \
