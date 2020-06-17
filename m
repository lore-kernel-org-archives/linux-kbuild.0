Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0231.hostedemail.com ([216.40.44.231]:52636 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725814AbgFQEoK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jun 2020 00:44:10 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id A37FE18008256
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2020 04:36:45 +0000 (UTC)
Message-ID: <b1eef508475f2ad501a153bb9d90d64a5128ecdd.camel@perches.com>
Subject: Re: [PATCH 2/2] Revert "checkpatch: kconfig: prefer 'help' over
 '---help---'"
From: Joe Perches <joe@perches.com>
Date: Tue, 16 Jun 2020 21:36:42 -0700
In-Reply-To: <20200617030220.34733-2-masahiroy@kernel.org>
References: <20200617030220.34733-1-masahiroy@kernel.org>
         <20200617030220.34733-2-masahiroy@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org

On Wed, 2020-06-17 at 12:02 +0900, Masahiro Yamada wrote:
> This reverts commit 84af7a6194e493fae312a2b7fa5a3b51f76d9282.

Also: https://lore.kernel.org/patchwork/patch/1255848/
---
 scripts/checkkconfigsymbols.py | 2 +-
 scripts/checkpatch.pl          | 6 +-----
 scripts/kconfig/lexer.l        | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 00a10a293f4f..1548f9ce4682 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -34,7 +34,7 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
 REGEX_KCONFIG_DEF = re.compile(DEF)
 REGEX_KCONFIG_EXPR = re.compile(EXPR)
 REGEX_KCONFIG_STMT = re.compile(STMT)
-REGEX_KCONFIG_HELP = re.compile(r"^\s+(help|---help---)\s*$")
+REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
 REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 REGEX_QUOTES = re.compile("(\"(.*?)\")")
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 524df88f9364..738bb3fcf202 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3044,11 +3044,7 @@ sub process {
 
 				if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
 					$is_start = 1;
-				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
-					if ($lines[$ln - 1] =~ "---help---") {
-						WARN("CONFIG_DESCRIPTION",
-						     "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
-					}
+				} elsif ($lines[$ln - 1] =~ /^\+\s*help\s*$/) {
 					$length = -1;
 				}
 
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 6354c905b006..4b7339ff4c8b 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -105,7 +105,7 @@ n	[A-Za-z0-9_-]
 "endchoice"		return T_ENDCHOICE;
 "endif"			return T_ENDIF;
 "endmenu"		return T_ENDMENU;
-"help"|"---help---"	return T_HELP;
+"help"			return T_HELP;
 "hex"			return T_HEX;
 "if"			return T_IF;
 "imply"			return T_IMPLY;
