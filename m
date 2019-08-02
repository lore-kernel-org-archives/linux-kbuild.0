Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aibo.runbox.com ([91.220.196.211]:32998 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390153AbfHCAf0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Aug 2019 20:35:26 -0400
Date: Fri, 2 Aug 2019 19:52:43 -0400
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
Subject: Re: [PATCH] kconfig: fix missing choice values in auto.conf
Message-ID: <20190802195243.09a87651@runbox.com>
In-Reply-To: <20190712060709.20609-1-yamada.masahiro@socionext.com>
References: <20190712060709.20609-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, joonas.kylmala@iki.fi, ulfalizer@gmail.com, linux-stable <stable@vger.kernel.org>, linux-kernel@vger.kernel.org

Hello,

> conf_write() must be changed accordingly. Currently, it clears
> SYMBOL_WRITE after the symbol is written into the .config file. This
> is needed to prevent it from writing the same symbol multiple times in
> case the symbol is declared in two or more locations. I added the new
> flag SYMBOL_WRITTEN, to track the symbols that have been written.
[snip]
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index cbb6efa4a5a6..e0972b255aac 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
[snip]
> @@ -903,7 +904,7 @@ int conf_write(const char *name)
>  				fprintf(out, "\n");
>  				need_newline = false;
>  			}
> -			sym->flags &= ~SYMBOL_WRITE;
> +			sym->flags |= SYMBOL_WRITTEN;

The SYMBOL_WRITTEN flag is never cleared after being set in this
function, which unfortunately causes data loss to occur when a user
starts xconfig, gconfig, or nconfig and saves a config file more than
once. Every save operation after the first one causes the saved .config
file to contain only comments.

I am appending a patch that resolves this issue. The patch is a bit
ugly because of the code duplication, but it fixes this bug. (I have
lightly tested the patch.) Even if the patch is not merged, I would
appreciate it if this bug could be fixed.

Thank you,

Vefa

=== 8< === Patch Follows === >8 ===

From: "M. Vefa Bicakci" <m.v.b@runbox.com>
Date: Fri, 2 Aug 2019 17:44:40 -0400
Subject: [PATCH] kconfig: Clear "written" flag to avoid data loss

Prior to this commit, starting nconfig, xconfig or gconfig, and saving
the .config file more than once caused data loss, where a .config file
that contained only comments would be written to disk starting from the
second save operation.

This bug manifests itself because the SYMBOL_WRITTEN flag is never
cleared after the first call to conf_write, and subsequent calls to
conf_write then skip all of the configuration symbols due to the
SYMBOL_WRITTEN flag being set.

This commit resolves this issue by clearing the SYMBOL_WRITTEN flag
from all symbols before conf_write returns.

Fixes: 8e2442a5f86e ("kconfig: fix missing choice values in auto.conf")
Cc: linux-stable <stable@vger.kernel.org> # 4.19+
Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>
---
 scripts/kconfig/confdata.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 1134892599da..24fe0c851e8c 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -840,6 +840,35 @@ int conf_write_defconfig(const char *filename)
 	return 0;
 }
 
+static void conf_clear_written_flag(void)
+{
+	struct menu *menu;
+	struct symbol *sym;
+
+	menu = rootmenu.list;
+	while (menu) {
+		sym = menu->sym;
+		if (sym && (sym->flags & SYMBOL_WRITTEN))
+			sym->flags &= ~SYMBOL_WRITTEN;
+
+		if (menu->list) {
+			menu = menu->list;
+			continue;
+		}
+
+		if (menu->next) {
+			menu = menu->next;
+		} else {
+			while ((menu = menu->parent)) {
+				if (menu->next) {
+					menu = menu->next;
+					break;
+				}
+			}
+		}
+	}
+}
+
 int conf_write(const char *name)
 {
 	FILE *out;
@@ -930,6 +959,8 @@ int conf_write(const char *name)
 	}
 	fclose(out);
 
+	conf_clear_written_flag();
+
 	if (*tmpname) {
 		if (is_same(name, tmpname)) {
 			conf_message("No change to %s", name);
-- 
2.21.0
