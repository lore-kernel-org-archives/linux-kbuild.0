Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34996 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgBRKA7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 05:00:59 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] fixdep: remove redundant null character check
Date: Tue, 18 Feb 2020 19:00:31 +0900
Message-Id: <20200218100031.10018-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

If *q is '\0', the condition (isalnum(*q) || *q == '_') is false anyway.

Ensuring non-zero *q is redundant.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index ad2041817985..877ca2c88246 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -246,7 +246,7 @@ static void parse_config_file(const char *p)
 		}
 		p += 7;
 		q = p;
-		while (*q && (isalnum(*q) || *q == '_'))
+		while (isalnum(*q) || *q == '_')
 			q++;
 		if (str_ends_with(p, q - p, "_MODULE"))
 			r = q - 7;
-- 
2.17.1
