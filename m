Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu1sys200aog115.obsmtp.com ([207.126.144.139]:37777 "EHLO
	eu1sys200aog115.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755040Ab1HBTER (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2011 15:04:17 -0400
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52FCBBD
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Aug 2011 19:04:15 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E311C272B
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Aug 2011 19:04:14 +0000 (GMT)
From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: [PATCH kernel-3.0] kbuild: Fix help text not displayed in choice option.
Date: Tue,  2 Aug 2011 20:03:18 +0100
Message-Id: <1312311798-27851-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: stuart.menefy@st.com, Srinivas Kandagatla <srinivas.kandagatla@st.com>

From: Srinivas Kandagatla <srinivas.kandagatla@st.com>

Help text under choice menu is never displayed because it does not have
symbol name associated with it, however many kconfigs have help text
under choice, assuming that it will be displayed when user selects help.

This patch changes the logic in menu_get_ext_help to display help for
cases which dont have symbol names like choice..

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
Reviewed-by: Stuart Menefy <stuart.menefy@st.com>
---

To see this bug in action, go to "PCI access mode" under PCI support, and hit the
help button. You will see no help text displayed. However in  arch/x86/Kconfig under 
"PCI access mode" there is help section.

Help text under choice menu is never displayed because it does not have symbol name 
associated with it, however many kconfigs have help text under choice, assuming 
that it will be displayed when user selects help.

This patch changes the logic in menu_get_ext_help to display help for cases which 
dont have symbol names like choice.


 scripts/kconfig/menu.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d660086..beeb92e 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -597,11 +597,10 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 	struct symbol *sym = menu->sym;
 
 	if (menu_has_help(menu)) {
-		if (sym->name) {
+		if (sym->name)
 			str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
-			str_append(help, _(menu_get_help(menu)));
-			str_append(help, "\n");
-		}
+		str_append(help, _(menu_get_help(menu)));
+		str_append(help, "\n");
 	} else {
 		str_append(help, nohelp_text);
 	}
-- 
1.6.3.3

