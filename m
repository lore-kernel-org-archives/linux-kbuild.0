Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:47922 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965495Ab3E2MTA convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Wed, 29 May 2013 08:19:00 -0400
Message-Id: <51A60E5002000078000D9978@nat28.tlf.novell.com>
Date: Wed, 29 May 2013 13:18:56 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] improve modalias building
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: schwab@linux-m68k.org, linux-kbuild@vger.kernel.org

For one, there's no point in the respective pieces to be rebuilt
unconditionally on each and every rebuild.

Second there's no need to invent a custom rule for generating the .s
file from the .c source - we can simply use the generic rule here.

And finally, $(obj) should be used to refer to files in the build tree
(rather than spelling out the subdirectory).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

---
 scripts/mod/Makefile |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

--- 3.10-rc3/scripts/mod/Makefile
+++ 3.10-rc3-file2alias-rebuild/scripts/mod/Makefile
@@ -29,15 +29,10 @@ define cmd_offsets
 	 echo "#endif" ) > $@
 endef
 
-# We use internal kbuild rules to avoid the "is up to date" message from make
-scripts/mod/devicetable-offsets.s: scripts/mod/devicetable-offsets.c FORCE
-	$(Q)mkdir -p $(dir $@)
-	$(call if_changed_dep,cc_s_c)
+$(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s
+	$(call if_changed,offsets)
 
-$(obj)/$(devicetable-offsets-file): scripts/mod/devicetable-offsets.s
-	$(call cmd,offsets)
-
-targets += $(devicetable-offsets-file)
+targets += $(devicetable-offsets-file) devicetable-offsets.s
 
 # dependencies on generated files need to be listed explicitly
 



