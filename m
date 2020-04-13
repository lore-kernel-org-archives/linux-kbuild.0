Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:50089 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgDMPdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 11:33:47 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: do not use OR-assignment for zero-cleared structure
Date: Tue, 14 Apr 2020 00:33:20 +0900
Message-Id: <20200413153320.93316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

The simple assignment is enough because memset() three lines above
has zero-cleared the structure.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 3dc81397d003..9363e37b8870 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -831,7 +831,7 @@ struct symbol *sym_lookup(const char *name, int flags)
 	memset(symbol, 0, sizeof(*symbol));
 	symbol->name = new_name;
 	symbol->type = S_UNKNOWN;
-	symbol->flags |= flags;
+	symbol->flags = flags;
 
 	symbol->next = symbol_hash[hash];
 	symbol_hash[hash] = symbol;
-- 
2.25.1
