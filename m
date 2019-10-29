Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:33928 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfJ2Min (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 08:38:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/4] mospost: remove unneeded local variable in contains_namespace()
Date: Tue, 29 Oct 2019 21:38:09 +0900
Message-Id: <20191029123809.29301-5-yamada.masahiro@socionext.com>
In-Reply-To: <20191029123809.29301-1-yamada.masahiro@socionext.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The local variable, ns_entry, is unneeded.

While I was here, I also cleaned up the comparison with NULL or 0.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f7425f5d4ab0..f70b924f379f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -239,10 +239,8 @@ static struct symbol *find_symbol(const char *name)
 static bool contains_namespace(struct namespace_list *list,
 			       const char *namespace)
 {
-	struct namespace_list *ns_entry;
-
-	for (ns_entry = list; ns_entry != NULL; ns_entry = ns_entry->next)
-		if (strcmp(ns_entry->namespace, namespace) == 0)
+	for (; list; list = list->next)
+		if (!strcmp(list->namespace, namespace))
 			return true;
 
 	return false;
-- 
2.17.1
