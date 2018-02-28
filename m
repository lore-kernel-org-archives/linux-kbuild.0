Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:51923 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933349AbeB1TSQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 14:18:16 -0500
Received: by mail-wm0-f67.google.com with SMTP id h21so7146771wmd.1
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2018 11:18:15 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 2/3] fixdep: remove some false CONFIG_ matches
Date: Wed, 28 Feb 2018 20:17:36 +0100
Message-Id: <20180228191805.20094-2-linux@rasmusvillemoes.dk>
In-Reply-To: <20180228191805.20094-1-linux@rasmusvillemoes.dk>
References: <CA+55aFz_ww8ohU68Jz34pg_x7gpGpJ+FC-dmS_Rm_VvY01GGpg@mail.gmail.com>
 <20180228191805.20094-1-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The string CONFIG_ quite often appears after other alphanumerics,
meaning that that instance cannot be referencing a Kconfig
symbol. Omitting these means make has fewer files to stat() when
deciding what needs to be rebuilt - for a defconfig build, this seems to
remove about 2% of the (wildcard ...) lines from the .o.cmd files.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/basic/fixdep.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index d7fbe545dd5d..1b21870d6e7f 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -225,8 +225,13 @@ static int str_ends_with(const char *s, int slen, const char *sub)
 static void parse_config_file(const char *p)
 {
 	const char *q, *r;
+	const char *start = p;
 
 	while ((p = strstr(p, "CONFIG_"))) {
+		if (p > start && (isalnum(p[-1]) || p[-1] == '_')) {
+			p += 7;
+			continue;
+		}
 		p += 7;
 		q = p;
 		while (*q && (isalnum(*q) || *q == '_'))
-- 
2.15.1

