Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:54457 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750867AbeDMFIP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Apr 2018 01:08:15 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 05/30] kconfig: remove string expansion in file_lookup()
Date: Fri, 13 Apr 2018 14:06:14 +0900
Message-Id: <1523595999-27433-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1523595999-27433-1-git-send-email-yamada.masahiro@socionext.com>
References: <1523595999-27433-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

There are two callers of file_lookup(), but there is no more reason
to expand the given path.

[1] zconf_initscan()
    This is used to open the first Kconfig.  sym_expand_string_value()
    has never been used in a useful way here; before opening the first
    Kconfig file, obviously there is no symbol to expand.  If you use
    expand_string_value() instead, environments in KBUILD_KCONFIG would
    be expanded, but I do not see practical benefits for that.

[2] zconf_nextfile()
    This is used to open the next file from 'source' statement.
    Symbols in the path like "arch/$SRCARCH/Kconfig" needed expanding,
    but it was replaced with the direct environment expansion.  The
    environment has already been expanded before the token is passed
    to the parser.

By the way, file_lookup() was already buggy; it expanded a given path,
but it used the path before expansion for look-up:
        if (!strcmp(name, file->name)) {

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
---

Changes in v3: None
Changes in v2:
  - Simplify the patch.  Just remove text expansion.

 scripts/kconfig/util.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 807147e..790967df 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -14,18 +14,16 @@
 struct file *file_lookup(const char *name)
 {
 	struct file *file;
-	char *file_name = sym_expand_string_value(name);
 
 	for (file = file_list; file; file = file->next) {
 		if (!strcmp(name, file->name)) {
-			free(file_name);
 			return file;
 		}
 	}
 
 	file = xmalloc(sizeof(*file));
 	memset(file, 0, sizeof(*file));
-	file->name = file_name;
+	file->name = xstrdup(name);
 	file->next = file_list;
 	file_list = file;
 	return file;
-- 
2.7.4

