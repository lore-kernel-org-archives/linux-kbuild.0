Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpoutwbe06.prod.mesa1.secureserver.net ([208.109.78.208]:47752
	"HELO smtpoutwbe06.prod.mesa1.secureserver.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1762974AbZLQAf7 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 19:35:59 -0500
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Message-Id: <20091216173556.0b50c25debf12a9aa545bf810459b532.9761f5fd4a.wbe@email.secureserver.net>
From: "Jiafu He" <jay@goldhive.com>
Subject: [PATCH] Kconfig: default m doesn't work for menuconfig/xconfig/gconfig even
 if =?UTF-8?Q?CONFIG=5FMODULES=3Dy?=
Date: Wed, 16 Dec 2009 17:35:56 -0700
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>

menuconfig/xconfig/gconfig all fails to set tristate CONFIG_ options to
m even if CONFIG_MODULES=y has been set. The "config" target works,
though.

Signed-off-by: Jiafu He <jay@goldhive.com>
-----
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index b55e72f..9ff712b 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -170,8 +170,11 @@ int conf_read_simple(const char *name, int def)
                if (in)
                        goto load;
                sym_add_change_count(1);
-               if (!sym_defconfig_list)
+               if (!sym_defconfig_list) {
+                       if (modules_sym)
+                               sym_calc_value(modules_sym);
                        return 1;
+               }
 
                for_all_defaults(sym_defconfig_list, prop) {
                        if (expr_calc_value(prop->visible.expr) == no ||
-----

