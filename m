Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:53033 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752714AbdBHDMh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Feb 2017 22:12:37 -0500
From: changbin.du@intel.com
Subject: [PATCH v2 1/2] kconfig/mconf: add jumping tip in title of search result textbox
Date: Wed,  8 Feb 2017 11:09:38 +0800
Message-Id: <20170208030939.10146-2-changbin.du@intel.com>
In-Reply-To: <20170208030939.10146-1-changbin.du@intel.com>
References: <20170208030939.10146-1-changbin.du@intel.com>
In-Reply-To: <20170206074648.23896-1-changbin.du@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, corbet@lwn.net
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jim.epost@gmail.com, jani.nikula@linux.intel.com, Changbin Du <changbin.du@intel.com>

From: Changbin Du <changbin.du@intel.com>

Prompt user how to quickly jump to the item he/she is interested in.

Signed-off-by: Changbin Du <changbin.du@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@linux.intel.com>
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

