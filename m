Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133ABC433F5
	for <linux-kbuild@archiver.kernel.org>; Mon, 21 Feb 2022 16:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347602AbiBUQot (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 21 Feb 2022 11:44:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380958AbiBUQor (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Feb 2022 11:44:47 -0500
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA35D21E1B;
        Mon, 21 Feb 2022 08:44:23 -0800 (PST)
Received: from grover.. (133-32-176-37.west.xps.vectant.ne.jp [133.32.176.37]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 21LGhRJV012353;
        Tue, 22 Feb 2022 01:43:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 21LGhRJV012353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1645461808;
        bh=0lpOuou+kcNVbG8u1/xvN0fu2ccE7lmgZvdRKN+/V9k=;
        h=From:To:Cc:Subject:Date:From;
        b=rxrmbFhJc0FseiGBjSdBFXfJYXpGU9anCdgbAvJ8HvCHa+s/9l4K1khr+IUvTiAcw
         Qo9aoh5Ng/NzBGs+PJ5MoUPDyxnLkH7964q9lksp2dYq5jiPa5bX2uZfQKtdB3heHB
         bfeiXkoDNi71q75SEaohADJKhYx1Y25D7aW3Vi/Ox/FdnaYCfqYGx/AxtTzgKt53Vs
         //fnQVojGCMfceoIAF5F+6M00zWp6Pxg9CUEGDPn8C7ChIFj33qep/y8NurfTb4Prv
         QpVVWWejmbiqq3TdN6kpfOLKSYijXqTS+x6PixgNaXTcIUvopK1sjz03zcRNkg8khB
         8hS8vvC8j7HPA==
X-Nifty-SrcIP: [133.32.176.37]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     David Laight <David.Laight@ACULAB.COM>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] fixdep: use fflush() and ferror() to ensure successful write to files
Date:   Tue, 22 Feb 2022 01:43:15 +0900
Message-Id: <20220221164316.113489-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Checking the return value of (v)printf does not ensure the successful
write to the .cmd file.

Call fflush() and ferror() to make sure that everything has been
written to the file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/basic/fixdep.c | 44 ++++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 44e887cff49b..fad6f29373a9 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -105,25 +105,6 @@ static void usage(void)
 	exit(1);
 }
 
-/*
- * In the intended usage of this program, the stdout is redirected to .*.cmd
- * files. The return value of printf() must be checked to catch any error,
- * e.g. "No space left on device".
- */
-static void xprintf(const char *format, ...)
-{
-	va_list ap;
-	int ret;
-
-	va_start(ap, format);
-	ret = vprintf(format, ap);
-	if (ret < 0) {
-		perror("fixdep");
-		exit(1);
-	}
-	va_end(ap);
-}
-
 struct item {
 	struct item	*next;
 	unsigned int	len;
@@ -189,7 +170,7 @@ static void use_config(const char *m, int slen)
 
 	define_config(m, slen, hash);
 	/* Print out a dependency path from a symbol name. */
-	xprintf("    $(wildcard include/config/%.*s) \\\n", slen, m);
+	printf("    $(wildcard include/config/%.*s) \\\n", slen, m);
 }
 
 /* test if s ends in sub */
@@ -318,13 +299,13 @@ static void parse_dep_file(char *m, const char *target)
 				 */
 				if (!saw_any_target) {
 					saw_any_target = 1;
-					xprintf("source_%s := %s\n\n",
-						target, m);
-					xprintf("deps_%s := \\\n", target);
+					printf("source_%s := %s\n\n",
+					       target, m);
+					printf("deps_%s := \\\n", target);
 				}
 				is_first_dep = 0;
 			} else {
-				xprintf("  %s \\\n", m);
+				printf("  %s \\\n", m);
 			}
 
 			buf = read_file(m);
@@ -347,8 +328,8 @@ static void parse_dep_file(char *m, const char *target)
 		exit(1);
 	}
 
-	xprintf("\n%s: $(deps_%s)\n\n", target, target);
-	xprintf("$(deps_%s):\n", target);
+	printf("\n%s: $(deps_%s)\n\n", target, target);
+	printf("$(deps_%s):\n", target);
 }
 
 int main(int argc, char *argv[])
@@ -363,11 +344,20 @@ int main(int argc, char *argv[])
 	target = argv[2];
 	cmdline = argv[3];
 
-	xprintf("cmd_%s := %s\n\n", target, cmdline);
+	printf("cmd_%s := %s\n\n", target, cmdline);
 
 	buf = read_file(depfile);
 	parse_dep_file(buf, target);
 	free(buf);
 
+	fflush(stdout);
+
+	/*
+	 * In the intended usage, the stdout is redirected to .*.cmd files.
+	 * Call ferror() to catch errors such as "No space left on device".
+	 */
+	if (ferror(stdout))
+		exit(1);
+
 	return 0;
 }
-- 
2.32.0

