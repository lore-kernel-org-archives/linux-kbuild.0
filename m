Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:39614 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbeGLM7r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 08:59:47 -0400
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: [RFC][PATCH] kconfig: Add "m or y" and "y or m" answers for oldconfig
Date: Thu, 12 Jul 2018 15:50:13 +0300
Message-Id: <20180712125013.14285-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make it possible to answer "m or y" or "y or m" to
oldconfig so that scripted kernel builds can easily
enable new features not present in the existing .config.

The particular use case I have in mind is continuous integration
where you probably want to test build any new features. Currently
you would have to either blindly try both 'y' and 'm' answers
or parse the output to know which one will be accepted.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 scripts/kconfig/conf.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 671ff5364497..8038f9a6b9f4 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -201,15 +201,33 @@ static int conf_sym(struct menu *menu)
 			continue;
 		case 'm':
 		case 'M':
-			newval = mod;
-			if (!line[1])
+			if (!strcmp(line, "m or y") ||
+			    !strcmp(line, "M or Y")) {
+				if (sym_tristate_within_range(sym, mod))
+					newval = mod;
+				else
+					newval = yes;
 				break;
+			} else {
+				newval = mod;
+				if (!line[1])
+					break;
+			}
 			continue;
 		case 'y':
 		case 'Y':
-			newval = yes;
-			if (!line[1] || !strcmp(&line[1], "es"))
+			if (!strcmp(line, "y or m") ||
+			    !strcmp(line, "Y or M")) {
+				if (sym_tristate_within_range(sym, yes))
+					newval = yes;
+				else
+					newval = mod;
 				break;
+			} else {
+				newval = yes;
+				if (!line[1] || !strcmp(&line[1], "es"))
+					break;
+			}
 			continue;
 		case 0:
 			newval = oldval;
-- 
2.16.4

