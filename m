Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.redfish-solutions.com ([66.232.79.143]:36488 "EHLO
        mail.redfish-solutions.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750746AbeAVFDa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jan 2018 00:03:30 -0500
From: "Philip Prindeville" <philipp@redfish-solutions.com>
Subject: [PATCH v1 1/1] kconfig: double up dollar signs in strings
Date: Sun, 21 Jan 2018 21:58:21 -0700
Message-Id: <1516597101-30637-1-git-send-email-philipp@redfish-solutions.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Philip Prindeville <philipp@redfish-solutions.com>

From: Philip Prindeville <philipp@redfish-solutions.com>

Since kconfig reads and writes makefiles, reflect that dollars need
to be doubled up in make syntax so that they're not interpolated.

Example: if we have a CONFIG_VAR of type string that we want to have
the value of "abc$def" then it must be written to the file .config
file as:

CONFIG_VAR="abc$$def"

to avoid the $d from being interpolated as the $(d).

Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
---
 scripts/kconfig/confdata.c | 6 +++++-
 scripts/kconfig/symbol.c   | 9 ++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 87f723804079ed3b6c1fbb0d1470f717582c4a28..e45f23dd04a7ceede2533d80d3ec8fc993685112 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -155,11 +155,15 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 	case S_STRING:
 		if (*p++ != '"')
 			break;
-		for (p2 = p; (p2 = strpbrk(p2, "\"\\")); p2++) {
+		for (p2 = p; (p2 = strpbrk(p2, "\"\\$")); p2++) {
 			if (*p2 == '"') {
 				*p2 = 0;
 				break;
 			}
+			else if (*p2 == '$' && p2[1] != '$') {
+				conf_warning("invalid string found");
+				break;
+			}
 			memmove(p2, p2 + 1, strlen(p2));
 		}
 		if (!p2) {
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7caabdb51c647e12e35b500bdebd262ba1545eb0..2458da4e2b203e5213e4ea0cb380f8f88af566ab 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -923,7 +923,7 @@ const char *sym_escape_string_value(const char *in)
 
 	p = in;
 	for (;;) {
-		l = strcspn(p, "\"\\");
+		l = strcspn(p, "\"\\$");
 		p += l;
 
 		if (p[0] == '\0')
@@ -940,14 +940,17 @@ const char *sym_escape_string_value(const char *in)
 
 	p = in;
 	for (;;) {
-		l = strcspn(p, "\"\\");
+		l = strcspn(p, "\"\\$");
 		strncat(res, p, l);
 		p += l;
 
 		if (p[0] == '\0')
 			break;
 
-		strcat(res, "\\");
+		if (p[0] == '$')
+			strcat(res, "$");
+		else
+			strcat(res, "\\");
 		strncat(res, p++, 1);
 	}
 
-- 
2.7.4

