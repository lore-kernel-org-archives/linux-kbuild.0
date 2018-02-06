Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40211 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752412AbeBFAiH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:38:07 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 03/14] kconfig: show '?' prompt even if no help text is available
Date: Tue,  6 Feb 2018 09:34:43 +0900
Message-Id: <1517877294-4826-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Marc Herbert <marc.herbert@intel.com>

'make config', 'make oldconfig', etc. always receive '?' as a valid
input and show useful information even if no help text is available.

------------------------>8------------------------
foo (FOO) [N/y] (NEW) ?

There is no help available for this option.
Symbol: FOO [=n]
Type  : bool
Prompt: foo
  Defined at Kconfig:1
------------------------>8------------------------

However, '?' is not shown in the prompt if its help text is missing.
Let's show '?' all the time so that the prompt and the behavior match.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 90a76aa2..d346642 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -201,9 +201,7 @@ static int conf_sym(struct menu *menu)
 			printf("/m");
 		if (oldval != yes && sym_tristate_within_range(sym, yes))
 			printf("/y");
-		if (menu_has_help(menu))
-			printf("/?");
-		printf("] ");
+		printf("/?] ");
 		if (!conf_askvalue(sym, sym_get_string_value(sym)))
 			return 0;
 		strip(line);
@@ -305,10 +303,7 @@ static int conf_choice(struct menu *menu)
 			printf("[1]: 1\n");
 			goto conf_childs;
 		}
-		printf("[1-%d", cnt);
-		if (menu_has_help(menu))
-			printf("?");
-		printf("]: ");
+		printf("[1-%d?]: ", cnt);
 		switch (input_mode) {
 		case oldconfig:
 		case silentoldconfig:
-- 
2.7.4

