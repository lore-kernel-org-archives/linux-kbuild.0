Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45855 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753866Ab1EWILE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:04 -0400
Received: by iyb14 with SMTP id 14so4457027iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:04 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 01/13] kbuild: add implicit rules for parser generation
Date: Mon, 23 May 2011 04:10:27 -0400
Message-Id: <1306138239-13440-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, David Gibson <david@gibson.dropbear.id.au>

Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Michal Marek <mmarek@suse.cz>
---
 scripts/Makefile.lib |   33 ++++++++++++++++++++++++++++++++-
 1 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1c702ca..f05270c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -160,15 +160,46 @@ ld_flags       = $(LDFLAGS) $(ldflags-y)
 modname-multi = $(sort $(foreach m,$(multi-used),\
 		$(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=))))
 
+ifdef REGENERATE_PARSERS
+# GPERF
+# ---------------------------------------------------------------------------
+quiet_cmd_gperf = GPERF $@
+      cmd_gperf = gperf -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<
+$(src)/%.hash.c_shipped: $(src)/%.gperf
+	$(call cmd,gperf)
+
+# LEX
+# ---------------------------------------------------------------------------
+quiet_cmd_flex = LEX     $@
+      cmd_flex = flex -o$@ -L $<
+$(src)/%.lex.c_shipped: $(src)/%.l
+	$(call cmd,flex)
+
+# YACC
+# ---------------------------------------------------------------------------
+quiet_cmd_bison = YACC    $@
+      cmd_bison = bison -o$@ -t -l $<
+$(src)/%.tab.c_shipped: $(src)/%.y
+	$(call cmd,bison)
+endif
+
 # Shipped files
 # ===========================================================================
 
 quiet_cmd_shipped = SHIPPED $@
 cmd_shipped = cat $< > $@
 
-$(obj)/%:: $(src)/%_shipped
+$(obj)/%.tab.c: $(src)/%.tab.c_shipped
+	$(call cmd,shipped)
+
+$(obj)/%.lex.c: $(src)/%.lex.c_shipped
 	$(call cmd,shipped)
 
+$(obj)/%.hash.c: $(src)/%.hash.c_shipped
+	$(call cmd,shipped)
+
+$(obj)/%:: $(src)/%_shipped
+
 # Commands useful for building a boot image
 # ===========================================================================
 # 
-- 
1.7.3.4.574.g608b.dirty

