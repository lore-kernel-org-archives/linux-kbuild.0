Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:65164 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756214AbZIKUAc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Sep 2009 16:00:32 -0400
Message-Id: <20090911200034.904723927@goodmis.org>
References: <20090911195849.451244684@goodmis.org>
Date: Fri, 11 Sep 2009 15:58:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 09/15] kconfig: keep config.gz around even if CONFIG_IKCONFIG_PROC is not set
Content-Disposition: inline; filename=0009-kconfig-keep-config.gz-around-even-if-CONFIG_IKCONFI.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Dick Streefland <dick@streefland.net>, Stephen Rothwell <sfr@canb.auug.org.au>

From: Steven Rostedt <srostedt@redhat.com>

If CONFIG_IKCONFIG is set but CONFIG_IKCONFIG_PROC is not, then
gcc will optimize the config.gz out, because nobody uses it.

This patch adds "__used" to the config.gz data to keep it around so that
code like extract-ikconfig can still find it.

[ Impact: allow extract-ikconfig to find config.gz ]

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/Makefile b/kernel/Makefile
index 2093a69..d0c84e6 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -119,7 +119,7 @@ $(obj)/config_data.gz: .config FORCE
 	$(call if_changed,gzip)
 
 quiet_cmd_ikconfiggz = IKCFG   $@
-      cmd_ikconfiggz = (echo "static const char kernel_config_data[] = MAGIC_START"; cat $< | scripts/bin2c; echo "MAGIC_END;") > $@
+      cmd_ikconfiggz = (echo "static const char kernel_config_data[] __used = MAGIC_START"; cat $< | scripts/bin2c; echo "MAGIC_END;") > $@
 targets += config_data.h
 $(obj)/config_data.h: $(obj)/config_data.gz FORCE
 	$(call if_changed,ikconfiggz)
-- 
1.6.3.3

-- 
