Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:48960 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869AbaEYQr5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 25 May 2014 12:47:57 -0400
Subject: [PATCH] kconfig: plug false-positive warning in get_prompt_str()
 seen with gcc-4.9
From: Konstantin Khlebnikov <koct9i@gmail.com>
Date: Sun, 25 May 2014 20:47:51 +0400
Message-ID: <20140525164751.28577.74072.stgit@zurg>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

scripts/kconfig/menu.c: In function ‘get_symbol_str’:
scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used uninitialized in this function [-Wmaybe-uninitialized]
     jump->offset = strlen(r->s);
                  ^
scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
  struct jump_key *jump;
                   ^

Signed-off-by: Konstantin Khlebnikov <koct9i@gmail.com>
---
 scripts/kconfig/menu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 3ac2c9c..5cd0f5e 100644
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

