Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:20858 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756973AbdKOJTG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 04:19:06 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: package: use --transform option to prefix paths in tar
Date: Wed, 15 Nov 2017 18:17:07 +0900
Message-Id: <1510737427-12510-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

For rpm-pkg and deb-pkg, a source tar file is created.  All paths in
the archive must be prefixed with the base name of the tar.  That
means, everything is contained in the directory when you extract it.

Currently, scripts/package/Makefile uses a symlink for that, and
removes it after the tar is created.

If you terminate the build during the tar creation, the symlink is
left over.  Then, at the next package build, you will see a warning
like follows:

  ln: '.' and 'kernel-4.14.0+/.' are the same file

It is possible to fix it by adding -n (--no-dereference) option to
the "ln" command, but a cleaner way is to use --transform option
of "tar" command.  This option is GNU extension, but it should not
hurt to use it in the Linux build system.

The 'S' flag is needed to exclude symlinks from the path fixup.
Without it, symlinks in the kernel are broken.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 9ed96aef..c30bcf8 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -39,10 +39,9 @@ if test "$(objtree)" != "$(srctree)"; then \
 	false; \
 fi ; \
 $(srctree)/scripts/setlocalversion --save-scmversion; \
-ln -sf $(srctree) $(2); \
 tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
-	$(addprefix $(2)/,$(TAR_CONTENT) $(3)); \
-rm -f $(2) $(objtree)/.scmversion
+	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
+rm -f $(objtree)/.scmversion
 
 # rpm-pkg
 # ---------------------------------------------------------------------------
-- 
2.7.4

