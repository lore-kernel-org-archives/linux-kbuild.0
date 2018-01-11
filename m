Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:21222 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751607AbeAKNj4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:39:56 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kconfig: make xfgets() really static
Date: Thu, 11 Jan 2018 22:39:40 +0900
Message-Id: <1515677981-21952-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515677981-21952-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515677981-21952-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Sparse reports:
  warning: symbol 'xfgets' was not declared. Should it be static?

It is declared as static, but it is missing in the definition part.
Move the definition up and remove the forward declaration.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 31c09c6..01ed336 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -20,7 +20,6 @@
 
 static void conf(struct menu *menu);
 static void check_conf(struct menu *menu);
-static void xfgets(char *str, int size, FILE *in);
 
 enum input_mode {
 	oldaskconfig,
@@ -83,6 +82,13 @@ static void check_stdin(void)
 	}
 }
 
+/* Helper function to facilitate fgets() by Jean Sacren. */
+static void xfgets(char *str, int size, FILE *in)
+{
+	if (!fgets(str, size, in))
+		fprintf(stderr, "\nError in reading or end of file.\n");
+}
+
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	enum symbol_type type = sym_get_type(sym);
@@ -705,12 +711,3 @@ int main(int ac, char **av)
 	}
 	return 0;
 }
-
-/*
- * Helper function to facilitate fgets() by Jean Sacren.
- */
-void xfgets(char *str, int size, FILE *in)
-{
-	if (fgets(str, size, in) == NULL)
-		fprintf(stderr, "\nError in reading or end of file.\n");
-}
-- 
2.7.4

