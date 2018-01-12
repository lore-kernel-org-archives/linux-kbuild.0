Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40278 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932489AbeALGsJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 01:48:09 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Warn if there is more than one help text
Date: Fri, 12 Jan 2018 07:47:47 +0100
Message-Id: <20180112064747.22854-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Avoids mistakes like in the following real-world example, where only the
final help string ("Say Y...") was used. This particular example was
fixed in commit 561b29e4ec8d ("media: fix media Kconfig help syntax
issues").

  config DVB_NETUP_UNIDVB
  	...
	select DVB_CXD2841ER if MEDIA_SUBDRV_AUTOSELECT
  	---help---
  	  Support for NetUP PCI express Universal DVB card.
       help
  	Say Y when you want to support NetUP Dual Universal DVB card
        ...

This now prints the following warning:

  drivers/media/pci/netup_unidvb:13: warning: 'DVB_NETUP_UNIDVB' defined with more than one help text -- only the last one will be used

Also free() any extra help strings.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.y | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index c1e4e82f56b5..06ef304ee325 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -435,6 +435,11 @@ help_start: T_HELP T_EOL
 
 help: help_start T_HELPTEXT
 {
+	if (current_entry->help) {
+		free(current_entry->help);
+		zconfprint("warning: '%s' defined with more than one help text -- only the last one will be used",
+			   current_entry->sym->name ?: "<choice>");
+	}
 	current_entry->help = $2;
 };
 
-- 
2.14.1

