Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:38856 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfCEFvN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 00:51:13 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] tools: move initial declarations out of 'for' loop
Date: Tue,  5 Mar 2019 14:48:14 +0900
Message-Id: <1551764896-8453-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Robin Meijboom <robin@meijboom.info>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

When I was trying to compile this code for hostprogs-y notation of
Kbuild, I was hit by the following error.

  error: ‘for’ loop initial declarations are only allowed in C99 or C11 mode

This is because KBUILD_HOSTCFLAGS specifies -std=gnu89 whereas the tools
Makefile compiles it with -std=gnu99.

Of course, it would be possible to pass -std=gnu99 per file, but it
shouldn't hurt to fix the C code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 tools/lib/subcmd/parse-options.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/lib/subcmd/parse-options.c b/tools/lib/subcmd/parse-options.c
index dbb9efb..1bd858a2 100644
--- a/tools/lib/subcmd/parse-options.c
+++ b/tools/lib/subcmd/parse-options.c
@@ -630,6 +630,7 @@ int parse_options_subcommand(int argc, const char **argv, const struct option *o
 			const char *const subcommands[], const char *usagestr[], int flags)
 {
 	struct parse_opt_ctx_t ctx;
+	int i;
 
 	/* build usage string if it's not provided */
 	if (subcommands && !usagestr[0]) {
@@ -637,7 +638,7 @@ int parse_options_subcommand(int argc, const char **argv, const struct option *o
 
 		astrcatf(&buf, "%s %s [<options>] {", subcmd_config.exec_name, argv[0]);
 
-		for (int i = 0; subcommands[i]; i++) {
+		for (i = 0; subcommands[i]; i++) {
 			if (i)
 				astrcat(&buf, "|");
 			astrcat(&buf, subcommands[i]);
@@ -663,7 +664,7 @@ int parse_options_subcommand(int argc, const char **argv, const struct option *o
 		exit(130);
 	case PARSE_OPT_LIST_SUBCMDS:
 		if (subcommands) {
-			for (int i = 0; subcommands[i]; i++)
+			for (i = 0; subcommands[i]; i++)
 				printf("%s ", subcommands[i]);
 		}
 		putchar('\n');
-- 
2.7.4
