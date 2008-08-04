Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:24178 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763504AbYHDVD1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Aug 2008 17:03:27 -0400
Date: Mon, 4 Aug 2008 23:01:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [GIT PULL] kbuild fixes
Message-ID: <20080804210153.GA29773@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, Adrian Bunk <bunk@kernel.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>

Hi Linus.

Please pull the following two kconfig related fixes.

	Sam


The following changes since commit 48a61569bb5396415c5dad0e81e1cfeb87c0aca3:
  Adrian Bunk (1):
        kbuild: scripts/ver_linux: don't set PATH

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sam/kbuild-fixes.git master

Sam Ravnborg (2):
      kconfig: always write out .config
      kconfig: drop the ""trying to assign nonexistent symbol" warning

 scripts/kconfig/conf.c     |    2 +-
 scripts/kconfig/confdata.c |    8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)


diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 9fba838..36b5eed 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -596,7 +596,7 @@ int main(int ac, char **av)
 		break;
 	}
 
-	if (conf_get_changed() && conf_write(NULL)) {
+	if (conf_write(NULL)) {
 		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
 		exit(1);
 	}
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0759761..df6a188 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -222,10 +222,8 @@ load:
 				continue;
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 9);
-				if (!sym) {
-					conf_warning("trying to assign nonexistent symbol %s", line + 9);
+				if (!sym)
 					break;
-				}
 			} else {
 				sym = sym_lookup(line + 9, 0);
 				if (sym->type == S_UNKNOWN)
@@ -261,10 +259,8 @@ load:
 			}
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 7);
-				if (!sym) {
-					conf_warning("trying to assign nonexistent symbol %s", line + 7);
+				if (!sym)
 					break;
-				}
 			} else {
 				sym = sym_lookup(line + 7, 0);
 				if (sym->type == S_UNKNOWN)
