Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44788 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751765AbeC0FcE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 05/21] kconfig: remove string expansion in file_lookup()
Date: Tue, 27 Mar 2018 14:29:19 +0900
Message-Id: <1522128575-5326-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

There are two callers of file_lookup().

[1] zconf_initscan()
    This is used to open the first Kconfig.  However, it cannot
    contain environments in the file path because zconf_fopen() is
    called before file_lookup().  By swapping the call order,
    KBUILD_KCONFIG would be able to contain environments, but I do
    not see practical benefits to support it.

[2] zconf_nextfile()
    This is used to open the next file from 'source' statement like
        source "arch/$SRCARCH/Kconfig"
    but this has already been expanded in the lexer phase.

So, file_lookup() does not need to expand the given path.

By the way, file_lookup() was already buggy; it expanded a given path,
but it used the path before expansion for look-up:
        if (!strcmp(name, file->name)) {

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Simplify the patch.  Just remove text expansion.

 scripts/kconfig/util.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 136e497..3d27c49 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -58,18 +58,16 @@ char *expand_string_value(const char *in)
 struct file *file_lookup(const char *name)
 {
 	struct file *file;
-	char *file_name = expand_string_value(name);
 
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

