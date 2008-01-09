Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex.2n.cz ([213.29.92.11]:22257 "EHLO ex.2n.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752606AbYAIPhT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jan 2008 10:37:19 -0500
Received: from ladis by localhost with local (Exim 3.36 #1 (Debian))	id
 1JCcyZ-0002x9-00	for <linux-kbuild@vger.kernel.org>; Wed, 09 Jan 2008
 16:36:19 +0100
Date: Wed, 9 Jan 2008 16:36:19 +0100
Subject: [PATCH] use C89 random functions in conf.c
Message-ID: <20080109153619.GA11272@michl.2n.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
From: Ladislav Michl <ladis@linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

rand and srand functions conform also to C89 in addition to POSIX.1-2001,
which makes them a bit more portable (work also on MinGW host). Linux man
page also says:
"The versions of rand() and srand() in the Linux C Library use the same
random number generator as random() and srandom()".
Once there, sort includes and remove leading whitespace.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

* Use C89 conformant functions rand() and srand()

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index a38787a..b20018c 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -4,11 +4,11 @@
  */
 
 #include <ctype.h>
-#include <stdlib.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
-#include <unistd.h>
 #include <time.h>
+#include <unistd.h>
 #include <sys/stat.h>
 
 #define LKC_DIRECT_LINK
@@ -160,7 +160,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		}
 	case set_random:
 		do {
-			val = (tristate)(random() % 3);
+			val = (tristate)(rand() % 3);
 		} while (!sym_tristate_within_range(sym, val));
 		switch (val) {
 		case no: line[0] = 'n'; break;
@@ -374,7 +374,7 @@ static int conf_choice(struct menu *menu)
 				continue;
 			break;
 		case set_random:
-			def = (random() % cnt) + 1;
+			def = (rand() % cnt) + 1;
 		case set_default:
 		case set_yes:
 		case set_mod:
@@ -530,7 +530,7 @@ int main(int ac, char **av)
 			break;
 		case 'r':
 			input_mode = set_random;
-			srandom(time(NULL));
+			srand(time(NULL));
 			break;
 		case 'h':
 		case '?':
@@ -538,7 +538,7 @@ int main(int ac, char **av)
 			exit(0);
 		}
 	}
-  	name = av[i];
+	name = av[i];
 	if (!name) {
 		printf(_("%s: Kconfig file missing\n"), av[0]);
 		exit(1);
