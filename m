Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36641 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeLKLBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:42 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 08/27] kconfig: warn no new line at end of file
Date: Tue, 11 Dec 2018 20:00:51 +0900
Message-Id: <1544526070-16690-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

It would be nice to warn if a new line is missing at end of file.

We could do this by checkpatch.pl for arbitrary files, but new line
is rather essential as a statement terminator in Kconfig.

The warning message looks like this:

  kernel/Kconfig.preempt:60:warning: no new line at end of file

Currently, kernel/Kconfig.preempt is the only file with no new line
at end of file. Fix it.

I know there are some false negative cases. For example, no warning
is displayed when the last line contains some whitespaces/comments,
but no new line. Yet, this commit works well for most cases.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/Kconfig.preempt  |  2 +-
 scripts/kconfig/zconf.l | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index cd16551..0fee5fe 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -57,4 +57,4 @@ config PREEMPT
 endchoice
 
 config PREEMPT_COUNT
-       bool
\ No newline at end of file
+       bool
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 9038e97..5046d3c 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -78,6 +78,13 @@ static void warn_ignored_character(char chr)
 	        "%s:%d:warning: ignoring unsupported character '%c'\n",
 	        current_file->name, yylineno, chr);
 }
+
+static void warn_no_newline(void)
+{
+	fprintf(stderr, "%s:%d:warning: no new line at end of file\n",
+	        current_file->name, yylineno);
+}
+
 %}
 
 n	[A-Za-z0-9_-]
@@ -261,6 +268,9 @@ n	[A-Za-z0-9_-]
 <<EOF>>	{
 	BEGIN(INITIAL);
 
+	if (prev_token != T_EOL && prev_token != T_HELPTEXT)
+		warn_no_newline();
+
 	if (current_file) {
 		zconf_endfile();
 		return T_EOL;
-- 
2.7.4
