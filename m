Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gproxy9-pub.mail.unifiedlayer.com ([69.89.20.122]:42801 "HELO
	gproxy9-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750781AbaKTFvZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Nov 2014 00:51:25 -0500
Date: Wed, 19 Nov 2014 22:44:37 -0700
From: Eddie Kovsky <ewk@edkovsky.org>
Subject: [PATCH] kconfig: Fix compiler warning
Message-ID: <20141120054437.GA30162@athena>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org

Fixes gcc warning when building linux-next:

In file included from scripts/kconfig/zconf.tab.c:2537:0:
scripts/kconfig/menu.c: In function ‘get_symbol_str’:
scripts/kconfig/menu.c:590:18: warning: ‘jump’ may be used uninitialized in this function [-Wmaybe-uninitialized]
     jump->offset = strlen(r->s);
                  ^
scripts/kconfig/menu.c:551:19: note: ‘jump’ was declared here
  struct jump_key *jump;
                   ^
  HOSTLD  scripts/kconfig/conf

Moved the initialization of struct jump_key *jump outside the first
'if' branch so it can be available throughout the function.

Also uses the preferred pointer syntax for passing the size of a struct.

Tested on next-20141119.

Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
---
 scripts/kconfig/menu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index a26cc5d2a9b0..a728d23949e7 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -559,8 +559,8 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		if (location == NULL && accessible)
 			location = menu;
 	}
+	jump = xmalloc(sizeof(*jump));
 	if (head && location) {
-		jump = xmalloc(sizeof(struct jump_key));
 
 		if (menu_is_visible(prop->menu)) {
 			/*
-- 
2.1.0

