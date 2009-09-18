Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:54448 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753439AbZIRT5B (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2009 15:57:01 -0400
Message-Id: <200909181949.n8IJnT0D019100@imap1.linux-foundation.org>
Subject: [patch 10/18] kbuild: rebuild fix for Makefile.modbuiltin
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:49:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, JBeulich@novell.com, mmarek@suse.cz

From: Jan Beulich <JBeulich@novell.com>

This patch addresses an issue with rebuilds failing to re-generate
modules.builtin files after altering config options.

Signed-off-by: Jan Beulich <JBeulich@novell.com>
Signed-off-by: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/Makefile.modbuiltin |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff -puN scripts/Makefile.modbuiltin~kbuild-rebuild-fix-for-makefilemodbuiltin scripts/Makefile.modbuiltin
--- a/scripts/Makefile.modbuiltin~kbuild-rebuild-fix-for-makefilemodbuiltin
+++ a/scripts/Makefile.modbuiltin
@@ -31,9 +31,13 @@ modbuiltin-cmds =						\
 	for m in $(modbuiltin-mods); do echo kernel/$$m; done;	\
 	cat /dev/null $(modbuiltin-subdirs);
 
-$(modbuiltin-target): $(subdir-ym)
+$(modbuiltin-target): $(subdir-ym) FORCE
 	$(Q)($(modbuiltin-cmds)) > $@
 
+PHONY += FORCE
+
+FORCE:
+
 # Descending
 # ---------------------------------------------------------------------------
 
_
