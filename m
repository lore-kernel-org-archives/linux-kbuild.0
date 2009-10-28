Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:35075 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668AbZJ1XED (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2009 19:04:03 -0400
Received: by mail-bw0-f219.google.com with SMTP id 19so1587508bwz.28
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Oct 2009 16:04:07 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
Subject: [remarks 4/4] make config / oldconfig: allow editing of remarks for config symbols
Date: Wed, 28 Oct 2009 23:53:50 +0100
Message-Id: <4ae8cde7.0d1abc0a.0bd6.3d22@mx.google.com>
In-Reply-To: <57715d006f612817fa5bc38146560ecd84605a05.1256767265.git.aragorn@Anduril.(none)>
References: <cover.1256767265.git.aragorn@Anduril.(none)>
 <b106dec1237ab723ae6a2404d42601bf20704bf3.1256767265.git.aragorn@Anduril.(none)>
 <617c40ae9e206b4f246998fe075644c752bc0bc3.1256767265.git.aragorn@Anduril.(none)>
 <57715d006f612817fa5bc38146560ecd84605a05.1256767265.git.aragorn@Anduril.(none)>
In-Reply-To: <cover.1256767265.git.aragorn@Anduril.(none)>
References: <cover.1256767265.git.aragorn@Anduril.(none)>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Bernhard Kaindl <bernhard.kaindl@gmx.net>

In conf_sym(), which is used for ask for all bool/tristate symbols,
print sym->remark (if one exists) befor prompting for the option and
analogous to help (triggered by an input beginning with '?'), when the
user enters a line starting with '<', allow the user to enter a remark
or update it.

This extension does not cover the configuration of string, integer or
choice values. I leave this open for follow-up submission in case there
is interest in the config symbol remarks in general and in really
supporting these also fully in make config, oldconfig and (possibly)
silbings.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>

PS:
make gconfig could also be considered for extension, but it does
apparently does not have a great deal of string editing UI yet,
so adding remarks to it would require finding a way to edit string
symbols in it first.
---
 scripts/kconfig/conf.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 9960d1c..dc60a1d 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -158,8 +158,11 @@ static int conf_sym(struct menu *menu)
 	struct symbol *sym = menu->sym;
 	int type;
 	tristate oldval, newval;
+	char *p;
 
 	while (1) {
+		if (sym->remark)
+			printf("Remark: %s\n", sym->remark);
 		printf("%*s%s ", indent - 1, "", _(menu->prompt->text));
 		if (sym->name)
 			printf("(%s) ", sym->name);
@@ -214,6 +217,8 @@ static int conf_sym(struct menu *menu)
 			break;
 		case '?':
 			goto help;
+		case '<':
+			goto remark;
 		default:
 			continue;
 		}
@@ -221,6 +226,20 @@ static int conf_sym(struct menu *menu)
 			return 0;
 help:
 		print_help(menu);
+		continue;
+remark:
+		if (sym->remark)
+			printf("Current Remark: %s\n", sym->remark);
+		printf("    New remark: ");
+		fgets(line, sizeof(line), stdin);
+
+		if ((p = strchr(line, '\n')))
+			*p = '\0';            /* no \n in remark */
+		if (line[0]) {
+			if (sym->remark)
+				free(sym->remark);
+			sym->remark = strdup(line);
+		}
 	}
 }
 
-- 
1.6.0.4

