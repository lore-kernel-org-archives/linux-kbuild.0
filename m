Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.190]:20729 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618AbZBRH5e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Feb 2009 02:57:34 -0500
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH] [KBUILD] add symbol value to help find the real depend
Date: Wed, 18 Feb 2009 15:57:31 +0800
Message-Id: <1234943851-10155-1-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Cheng Renquan <chengrq@uit.com.cn>

From: Cheng Renquan <chengrq@uit.com.cn>

kbuild-menuconfig-display-depend-value.patch

  ©°©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤ RF switch subsystem support ©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©´   
  ©¦ CONFIG_RFKILL:                                                        ©¦   
  ©¦                                                                       ©¦   
  ©¦ Say Y here if you want to have control over RF switches               ©¦   
  ©¦ found on many WiFi and Bluetooth cards.                               ©¦   
  ©¦                                                                       ©¦   
  ©¦ To compile this driver as a module, choose M here: the                ©¦   
  ©¦ module will be called rfkill.                                         ©¦   
  ©¦                                                                       ©¦   
  ©¦ Symbol: RFKILL [=m]                                                   ©¦   
  ©¦ Prompt: RF switch subsystem support                                   ©¦   
  ©¦   Defined at net/rfkill/Kconfig:4                                     ©¦   
  ©¦   Depends on: NET [=y]                                                ©¦   
  ©¦   Location:                                                           ©¦   
  ©¦     -> Networking support (NET [=y])                                  ©¦   
  ©¦   Selected by: IWLCORE [=n] && NETDEVICES [=y] && !S390 [=S390] && PC ©¦   
  ©¦                                                                       ©¦   
  ©À©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤( 99%)©¤©¤©È   
  ©¦                               < Exit >                                ©¦   
  ©¸©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¼   

Signed-off-by: Cheng Renquan <chengrq@uit.com.cn>

---

Index: linux-2.6.29-rc5-lio/scripts/kconfig/expr.c
===================================================================
--- linux-2.6.29-rc5-lio.orig/scripts/kconfig/expr.c
+++ linux-2.6.29-rc5-lio/scripts/kconfig/expr.c
@@ -1098,6 +1098,8 @@ void expr_fprint(struct expr *e, FILE *o
 static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *str)
 {
 	str_append((struct gstr*)data, str);
+	if (sym)
+		str_printf((struct gstr*)data, " [=%s]", sym_get_string_value(sym));
 }
 
 void expr_gstr_print(struct expr *e, struct gstr *gs)
