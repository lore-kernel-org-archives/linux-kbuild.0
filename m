Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:47611 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751823AbdJHRMT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:12:19 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 3/6] kconfig: Don't leak 'option' arguments during parsing
Date: Sun,  8 Oct 2017 19:11:20 +0200
Message-Id: <1507482683-22651-4-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

The following strings would leak before this change:

	- option env="LEAKED"
	- option defconfig_list="LEAKED"

These come in the form of T_WORD tokens and are always allocated on the
heap in zconf.l. Free them.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 344,616 bytes in 14,355 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 344,568 bytes in 14,352 blocks
	   ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.y | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index a770117..ea6ae16 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -236,8 +236,10 @@ symbol_option_list:
 	| symbol_option_list T_WORD symbol_option_arg
 {
 	const struct kconf_id *id = kconf_id_lookup($2, strlen($2));
-	if (id && id->flags & TF_OPTION)
+	if (id && id->flags & TF_OPTION) {
 		menu_add_option(id->token, $3);
+		free($3);
+	}
 	else
 		zconfprint("warning: ignoring unknown option %s", $2);
 	free($2);
-- 
2.7.4

