Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37483 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758962AbYAXWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:53 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 22/77] kbuild: fixup genksyms usage/getopt
Date: Thu, 24 Jan 2008 23:03:03 +0100
Message-Id: <1201212238-4369-22-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Mike Frysinger <vapier.adi@gmail.com>, Mike Frysinger <vapier@gentoo.org>, Sam Ravnborg <sam@ravnborg.org>

From: Mike Frysinger <vapier.adi@gmail.com>

The usage does not mention the "-a,--arch" or "-T,--dump-types" options, so
add them.  The calls to getopt() seem to mention options that no longer exist
(some "k" and "p" thingy) but omits the "h" option which means using '-h'
actually triggers the error code path, so update those as well.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/genksyms/genksyms.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 511023b..dca5e0d 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -440,17 +440,21 @@ void error_with_pos(const char *fmt, ...)
 
 static void genksyms_usage(void)
 {
-	fputs("Usage:\n" "genksyms [-dDwqhV] > /path/to/.tmp_obj.ver\n" "\n"
+	fputs("Usage:\n" "genksyms [-adDTwqhV] > /path/to/.tmp_obj.ver\n" "\n"
 #ifdef __GNU_LIBRARY__
+	      "  -a, --arch            Select architecture\n"
 	      "  -d, --debug           Increment the debug level (repeatable)\n"
 	      "  -D, --dump            Dump expanded symbol defs (for debugging only)\n"
+	      "  -T, --dump-types file Dump expanded types into file (for debugging only)\n"
 	      "  -w, --warnings        Enable warnings\n"
 	      "  -q, --quiet           Disable warnings (default)\n"
 	      "  -h, --help            Print this message\n"
 	      "  -V, --version         Print the release version\n"
 #else				/* __GNU_LIBRARY__ */
+	      "  -a                    Select architecture\n"
 	      "  -d                    Increment the debug level (repeatable)\n"
 	      "  -D                    Dump expanded symbol defs (for debugging only)\n"
+	      "  -T file               Dump expanded types into file (for debugging only)\n"
 	      "  -w                    Enable warnings\n"
 	      "  -q                    Disable warnings (default)\n"
 	      "  -h                    Print this message\n"
@@ -477,10 +481,10 @@ int main(int argc, char **argv)
 		{0, 0, 0, 0}
 	};
 
-	while ((o = getopt_long(argc, argv, "a:dwqVDT:k:p:",
+	while ((o = getopt_long(argc, argv, "a:dwqVDT:h",
 				&long_opts[0], NULL)) != EOF)
 #else				/* __GNU_LIBRARY__ */
-	while ((o = getopt(argc, argv, "a:dwqVDT:k:p:")) != EOF)
+	while ((o = getopt(argc, argv, "a:dwqVDT:h")) != EOF)
 #endif				/* __GNU_LIBRARY__ */
 		switch (o) {
 		case 'a':
-- 
1.5.4.rc3.14.g44397

