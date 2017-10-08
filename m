Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:52608 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753740AbdJHRMV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:12:21 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 5/6] kconfig: Don't leak help strings during parsing
Date: Sun,  8 Oct 2017 19:11:22 +0200
Message-Id: <1507482683-22651-6-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

This is just for completeness to get rid of the last memory leak
currently generated during parsing for ARCH=x86. The symbol
DVB_NETUP_UNIDVB in drivers/media/pci/netup_unidvb/Kconfig currently has
two help strings, and we leak the first one.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 344,440 bytes in 14,350 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 344,376 bytes in 14,349 blocks
	   ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.y | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 468ab03..3c9f436 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -435,6 +435,9 @@ help_start: T_HELP T_EOL
 
 help: help_start T_HELPTEXT
 {
+	if (current_entry->help)
+		/* Weird menu node with two help strings */
+		free(current_entry->help);
 	current_entry->help = $2;
 };
 
-- 
2.7.4

