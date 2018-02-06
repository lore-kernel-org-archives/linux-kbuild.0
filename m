Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39669 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751829AbeBFAhw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:37:52 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 04/14] kconfig: print additional new line for choice for redirection
Date: Tue,  6 Feb 2018 09:34:44 +0900
Message-Id: <1517877294-4826-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Marc Herbert <marc.herbert@intel.com>

If stdout is redirected to a file, prompts look differently due to
missing new lines.

Currently, conf_askvalue() takes care of this by putting additional
new line, but conf_choice() does not.  Do likewise so that prompts
after 'choice' look properly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index d346642..6ce06c8 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -317,6 +317,8 @@ static int conf_choice(struct menu *menu)
 		case oldaskconfig:
 			fflush(stdout);
 			xfgets(line, sizeof(line), stdin);
+			if (!tty_stdio)
+				printf("\n");
 			strip(line);
 			if (line[0] == '?') {
 				print_help(menu);
-- 
2.7.4

