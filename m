Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:35454 "EHLO
	mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945AbbLJQea (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 11:34:30 -0500
Date: Fri, 11 Dec 2015 00:33:29 +0800
From: Wang YanQing <udknight@gmail.com>
Subject: [PATCH] kbuild: support make dir/file.i for *.S
Message-ID: <20151210163329.GA18947@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This feature could reduce a little time to expand all
the macros in *.S for reading.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Makefile               | 2 ++
 scripts/Makefile.build | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 7558c9c..d7e2060 100644
--- a/Makefile
+++ b/Makefile
@@ -1552,6 +1552,8 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.s: %.S prepare scripts FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+%.i: %.S prepare scripts FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.o: %.S prepare scripts FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.symtypes: %.c prepare scripts FORCE
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2c47f9c..2a51d49 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -287,6 +287,12 @@ cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $<
 $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,as_s_S)
 
+quiet_cmd_cc_i_S = CPP $(quiet_modtag) $@
+cmd_cc_i_S       = $(CPP) $(a_flags)   -o $@ $<
+
+$(obj)/%.i: $(src)/%.S FORCE
+	$(call if_changed_dep,cc_i_S)
+
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
 cmd_as_o_S       = $(CC) $(a_flags) -c -o $@ $<
 
-- 
1.8.5.6.2.g3d8a54e.dirty
