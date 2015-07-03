Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:51857 "EHLO
	faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755289AbbGCMzp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 08:55:45 -0400
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
Subject: [PATCH 1/2] kconfig: also warn of unhandled characters in statements
Date: Fri,  3 Jul 2015 14:46:38 +0200
Message-Id: <a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de>
In-Reply-To: <cover.1435927467.git.andreas.ruprecht@fau.de>
References: <cover.1435927467.git.andreas.ruprecht@fau.de>
In-Reply-To: <cover.1435927467.git.andreas.ruprecht@fau.de>
References: <cover.1435927467.git.andreas.ruprecht@fau.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>, Andreas Ruprecht <andreas.ruprecht@fau.de>

While commit 2e0d737fc76f ("kconfig: don't silently ignore unhandled
characters") introduced a warning for unsupported characters inside
parameters, it does not cover situations where a statement
has additional characters around it.

This change introduces a warning if superfluous characters are found
around statements. As the 'help' statement sometimes is written as
'---help---', the '-' character would now also be regarded as
unhandled, this change also adds a special rule for this case.

Reported-by: Valentin Rothberg <valentinrothberg@gmail.com>
Signed-off-by: Andreas Ruprecht <andreas.ruprecht@fau.de>
---
 scripts/kconfig/zconf.l | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 200a3fe..84a5d05 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -106,7 +106,15 @@ n	[A-Za-z0-9_]
 		zconflval.string = text;
 		return T_WORD;
 	}
-	.
+	"---help---"	{
+		/* Support old syntax for help statement */
+		return T_HELP;
+	}
+	.	{
+		fprintf(stderr,
+		        "%s:%d:warning: ignoring unsupported character '%c'\n",
+		        zconf_curname(), zconf_lineno(), *yytext);
+	}
 	\n	{
 		BEGIN(INITIAL);
 		current_file->lineno++;
@@ -132,7 +140,6 @@ n	[A-Za-z0-9_]
 		BEGIN(STRING);
 	}
 	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
-	---	/* ignore */
 	({n}|[-/.])+	{
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
-- 
1.9.1

