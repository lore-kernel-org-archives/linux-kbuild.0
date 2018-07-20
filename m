Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28448 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbeGTIe6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:34:58 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 08/11] kbuild: add .DELETE_ON_ERROR special target
Date: Fri, 20 Jul 2018 16:46:33 +0900
Message-Id: <1532072796-7947-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

If Make gets a fatal signal while a shell is executing, it may delete
the target file that the recipe was supposed to update.  This is needed
to make sure that it is remade from scratch when Make is next run; if
Make is interrupted after the recipe has begun to write the target file,
it results in an incomplete file whose time stamp is newer than that
of the prerequisites files.  Make automatically deletes the incomplete
file on interrupt unless the target is marked .PRECIOUS.

The situation is just the same as when the shell fails for some reasons.
Usually when a recipe line fails, if it has changed the target file at
all, the file is corrupted, or at least it is not completely updated.
Yet the file’s time stamp says that it is now up to date, so the next
time Make runs, it will not try to update that file.

However, Make does not cater to delete the incomplete target file in
this case.  We need to add .DELETE_ON_ERROR somewhere in the Makefile
to request it.

scripts/Kbuild.include seems a suitable place to add it because it is
included from almost all sub-makes.

Please note .DELETE_ON_ERROR is not effective for phony targets.

The external module building should never ever touch the kernel tree.
The following recipe fails if include/generated/autoconf.h is missing.
However, include/config/auto.conf is not deleted since it is a phony
target.

 PHONY += include/config/auto.conf

 include/config/auto.conf:
         $(Q)test -e include/generated/autoconf.h -a -e $@ || (          \
         echo >&2;                                                       \
         echo >&2 "  ERROR: Kernel configuration is invalid.";           \
         echo >&2 "         include/generated/autoconf.h or $@ are missing.";\
         echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to fix it."; \
         echo >&2 ;                                                      \
         /bin/false)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None

 scripts/Kbuild.include | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 3d14d0e..7f4b1db 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -400,3 +400,6 @@ endif
 endef
 #
 ###############################################################################
+
+# delete partially updated (i.e. corrupted) files on error
+.DELETE_ON_ERROR:
-- 
2.7.4

