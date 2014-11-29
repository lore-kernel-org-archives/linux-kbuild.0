Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from a8-82.smtp-out.amazonses.com ([54.240.8.82]:35183 "EHLO
	a8-82.smtp-out.amazonses.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751043AbaK2Rc2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 29 Nov 2014 12:32:28 -0500
From: Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] kconfig: fix build warning
Date: Sat, 29 Nov 2014 17:23:31 +0000
Message-ID: <00000149fc943418-9754cb63-3a60-4a20-be0a-73081913356c-000000@email.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, Luka Perkov <luka.perkov@sartura.hr>

Patch fixes following build warning:

In file included from scripts/kconfig/zconf.tab.c:2537:0:
scripts/kconfig/menu.c: In function ‘get_symbol_str’:
scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used uninitialized in this function [-Wmaybe-uninitialized]
     jump->offset = strlen(r->s);
                  ^
scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
  struct jump_key *jump;

Signed-off-by: Luka Perkov <luka.perkov@sartura.hr>
---
 scripts/kconfig/menu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index a26cc5d..584e0fc 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -548,7 +548,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 {
 	int i, j;
 	struct menu *submenu[8], *menu, *location = NULL;
-	struct jump_key *jump;
+	struct jump_key *jump = NULL;
 
 	str_printf(r, _("Prompt: %s\n"), _(prop->text));
 	menu = prop->menu->parent;
-- 
2.1.3

