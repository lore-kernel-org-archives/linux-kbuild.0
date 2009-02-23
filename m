Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.184]:26146 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753733AbZBWPKT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2009 10:10:19 -0500
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 1/6] [KBUILD] add symbol value to help find the real depend
Date: Mon, 23 Feb 2009 23:09:59 +0800
Message-Id: <1235401804-8136-2-git-send-email-crquan@gmail.com>
In-Reply-To: <1235401804-8136-1-git-send-email-crquan@gmail.com>
References: <1235401804-8136-1-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, cr_quan@163.com

kbuild-menuconfig-display-depend-value.patch

Sometimes when configuring need to disable some unused item, but the item is
selected by many other items, it's hard to find the real dependency which
selected it, This patch add every symbol's value accompanied to make it
possible to find the real dependency easily.

An example is CONFIG_RFKILL,

  ---------------------- RF switch subsystem support ----------------------
  | CONFIG_RFKILL:                                                        |
  |                                                                       |
  | Say Y here if you want to have control over RF switches               |
  | found on many WiFi and Bluetooth cards.                               |
  |                                                                       |
  | To compile this driver as a module, choose M here: the                |
  | module will be called rfkill.                                         |
  |                                                                       |
  | Symbol: RFKILL [=m]                                                   |
  | Prompt: RF switch subsystem support                                   |
  |   Defined at net/rfkill/Kconfig:4                                     |
  |   Depends on: NET [=y]                                                |
  |   Location:                                                           |
  |     -> Networking support (NET [=y])                                  |
  |   Selected by: IWLCORE [=n] && NETDEVICES [=y] && !S390 [=S390] && PC |
  |                                                                       |
  ----------------------------------------------------------------( 99%)---

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/expr.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 579ece4..cd8a2f0 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1098,6 +1098,8 @@ void expr_fprint(struct expr *e, FILE *out)
 static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *str)
 {
 	str_append((struct gstr*)data, str);
+	if (sym)
+		str_printf((struct gstr*)data, " [=%s]", sym_get_string_value(sym));
 }
 
 void expr_gstr_print(struct expr *e, struct gstr *gs)
-- 
1.6.0.6

