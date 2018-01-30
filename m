Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33159 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752167AbeA3STM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 13:19:12 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Warn if help text is blank
Date: Tue, 30 Jan 2018 19:18:53 +0100
Message-Id: <20180130181853.32512-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mcgrof@kernel.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Print a warning if a 'help' token is given but the help text is blank.
Personal pet peeve.

Example warnings:

	net/sched/Kconfig:860: warning: 'NET_IFE_SKBMARK' defined with blank help text
	net/sched/Kconfig:865: warning: 'NET_IFE_SKBPRIO' defined with blank help text
	net/sched/Kconfig:870: warning: 'NET_IFE_SKBTCINDEX' defined with blank help text
	drivers/video/fbdev/Kconfig:1159: warning: 'FB_I810_I2C' defined with blank help text
	drivers/mmc/host/Kconfig:877: warning: 'MMC_TOSHIBA_PCI' defined with blank help text
	drivers/staging/rtl8192u/Kconfig:8: warning: 'RTL8192U' defined with blank help text
	drivers/staging/rtl8192e/rtl8192e/Kconfig:9: warning: 'RTL8192E' defined with blank help text
	lib/Kconfig.debug:354: warning: 'ARCH_WANT_FRAME_POINTERS' defined with blank help text

A separate patchset will be sent to fix all current instances of blank
help texts for all arches. I added the same warning to Kconfiglib.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.y | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 21ce883e5d9e..4be98050b961 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -436,6 +436,12 @@ help: help_start T_HELPTEXT
 		zconfprint("warning: '%s' defined with more than one help text -- only the last one will be used",
 			   current_entry->sym->name ?: "<choice>");
 	}
+
+	/* Is the help text empty or all whitespace? */
+	if ($2[strspn($2, " \f\n\r\t\v")] == '\0')
+		zconfprint("warning: '%s' defined with blank help text",
+			   current_entry->sym->name ?: "<choice>");
+
 	current_entry->help = $2;
 };
 
-- 
2.14.1

