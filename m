Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37437 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756640AbYAXWEE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:04 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 41/77] kconfig: use C89 random functions in conf.c
Date: Thu, 24 Jan 2008 23:03:22 +0100
Message-Id: <1201212238-4369-41-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ladislav Michl <ladis@linux-mips.org>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: Ladislav Michl <ladis@linux-mips.org>

rand and srand functions conform also to C89 in addition to POSIX.1-2001,
which makes them a bit more portable (work also on MinGW host). Linux man
page also says:
"The versions of rand() and srand() in the Linux C Library use the same
random number generator as random() and srandom()".

* Use C89 conformant functions rand() and srand()

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/conf.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index a3d2d0b..01c2f35 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -375,7 +375,7 @@ static int conf_choice(struct menu *menu)
 			break;
 		case set_random:
 			if (is_new)
-				def = (random() % cnt) + 1;
+				def = (rand() % cnt) + 1;
 		case set_default:
 		case set_yes:
 		case set_mod:
@@ -526,7 +526,7 @@ int main(int ac, char **av)
 			break;
 		case 'r':
 			input_mode = set_random;
-			srandom(time(NULL));
+			srand(time(NULL));
 			break;
 		case 'h':
 			printf("See README for usage info\n");
-- 
1.5.4.rc3.14.g44397

