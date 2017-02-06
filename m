Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:16728 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751164AbdBFHsy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 02:48:54 -0500
From: changbin.du@intel.com
Subject: [PATCH 1/2] kconfig/mconf: add jumping tip in title of search result textbox
Date: Mon,  6 Feb 2017 15:46:47 +0800
Message-Id: <20170206074648.23896-2-changbin.du@intel.com>
In-Reply-To: <20170206074648.23896-1-changbin.du@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, corbet@lwn.net
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Changbin Du <changbin.du@intel.com>

From: Changbin Du <changbin.du@intel.com>

Prompt user how to quickly jump to the item he/she is interested in.

Signed-off-by: Changbin Du <changbin.du@intel.com>
---
 scripts/kconfig/mconf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 315ce2c..23d5681 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -443,10 +443,10 @@ static void search_conf(void)
 
 		res = get_relations_str(sym_arr, &head);
 		set_subtitle();
-		dres = show_textbox_ext(_("Search Results"), (char *)
-					str_get(&res), 0, 0, keys, &vscroll,
-					&hscroll, &update_text, (void *)
-					&data);
+		dres = show_textbox_ext(
+				_("Search Results (type the number to jump)"),
+				(char *)str_get(&res), 0, 0, keys, &vscroll,
+				&hscroll, &update_text, (void *)&data);
 		again = false;
 		for (i = 0; i < JUMP_NB && keys[i]; i++)
 			if (dres == keys[i]) {
-- 
2.7.4

