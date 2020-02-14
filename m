Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390632AbgBNQIj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Feb 2020 11:08:39 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 319/459] kbuild: remove *.tmp file when filechk fails
Date: Fri, 14 Feb 2020 10:59:29 -0500
Message-Id: <20200214160149.11681-319-sashal@kernel.org>
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 88fe89a47153facd8cb2d06d5c8727f7224c43c2 ]

Bartosz Golaszewski reports that when "make {menu,n,g,x}config" fails
due to missing packages, a temporary file is left over, which is not
ignored by git.

For example, if GTK+ is not installed:

  $ make gconfig
  *
  * Unable to find the GTK+ installation. Please make sure that
  * the GTK+ 2.0 development package is correctly installed.
  * You need gtk+-2.0 gmodule-2.0 libglade-2.0
  *
  scripts/kconfig/Makefile:208: recipe for target 'scripts/kconfig/gconf-cfg' failed
  make[1]: *** [scripts/kconfig/gconf-cfg] Error 1
  Makefile:567: recipe for target 'gconfig' failed
  make: *** [gconfig] Error 2
  $ git status
  HEAD detached at v5.4
  Untracked files:
    (use "git add <file>..." to include in what will be committed)

          scripts/kconfig/gconf-cfg.tmp

  nothing added to commit but untracked files present (use "git add" to track)

This is because the check scripts are run with filechk, which misses
to clean up the temporary file on failure.

When the line

  { $(filechk_$(1)); } > $@.tmp;

... fails, it exits immediately due to the 'set -e'. Use trap to make
sure to delete the temporary file on exit.

For extra safety, I replaced $@.tmp with $(dot-target).tmp to make it
a hidden file.

Reported-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/Kbuild.include | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 10ba926ae2924..d1dd4a6b6adb6 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -55,14 +55,13 @@ kecho := $($(quiet)kecho)
 # - stdin is piped in from the first prerequisite ($<) so one has
 #   to specify a valid file as first prerequisite (often the kbuild file)
 define filechk
-	$(Q)set -e;				\
-	mkdir -p $(dir $@);			\
-	{ $(filechk_$(1)); } > $@.tmp;		\
-	if [ -r $@ ] && cmp -s $@ $@.tmp; then	\
-		rm -f $@.tmp;			\
-	else					\
-		$(kecho) '  UPD     $@';	\
-		mv -f $@.tmp $@;		\
+	$(Q)set -e;						\
+	mkdir -p $(dir $@);					\
+	trap "rm -f $(dot-target).tmp" EXIT;			\
+	{ $(filechk_$(1)); } > $(dot-target).tmp;		\
+	if [ ! -r $@ ] || ! cmp -s $@ $(dot-target).tmp; then	\
+		$(kecho) '  UPD     $@';			\
+		mv -f $(dot-target).tmp $@;			\
 	fi
 endef
 
-- 
2.20.1
