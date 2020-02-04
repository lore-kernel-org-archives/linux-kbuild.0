Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www262.sakura.ne.jp ([202.181.97.72]:51114 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgBDEJH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 23:09:07 -0500
Message-Id: <202002040408.01448ioc013868@www262.sakura.ne.jp>
Subject: [PATCH] kconfig: Invalidate all symbols after changing to y or m.
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
MIME-Version: 1.0
Date: Tue, 04 Feb 2020 13:08:44 +0900
References: <ced8ab1c-9c35-c7b0-6b9e-bcee7ffdf469@i-love.sakura.ne.jp> <CAK7LNATNY1oP5XgFH3+fuUU=Z7pEz7Sqz0vKCzvhM4Kem7RkOg@mail.gmail.com>
In-Reply-To: <CAK7LNATNY1oP5XgFH3+fuUU=Z7pEz7Sqz0vKCzvhM4Kem7RkOg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>

Since commit 89b9060987d98833 ("kconfig: Add yes2modconfig and
mod2yesconfig targets.") forgot to clear SYMBOL_VALID bit after
changing to y or m, these targets did not save the changes.
Call sym_clear_all_valid() so that all symbols are revalidated.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 scripts/kconfig/confdata.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 11f6c72c2eee..aa70360f27c1 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1331,9 +1331,8 @@ void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
 
 	for_all_symbols(i, sym) {
 		if (sym_get_type(sym) == S_TRISTATE &&
-		    sym->def[S_DEF_USER].tri == old_val) {
+		    sym->def[S_DEF_USER].tri == old_val)
 			sym->def[S_DEF_USER].tri = new_val;
-			sym_add_change_count(1);
-		}
 	}
+	sym_clear_all_valid();
 }
-- 
2.11.0
