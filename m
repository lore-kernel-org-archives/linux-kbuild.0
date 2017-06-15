Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35333 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750777AbdFOIgb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2017 04:36:31 -0400
From: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCH] kbuild: fix header installation under fakechroot environment
Date: Thu, 15 Jun 2017 10:36:22 +0200
Message-Id: <20170615083622.16618-1-richard.genoud@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Russell King <rmk+kernel@armlinux.org.uk>, Mark Salter <msalter@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>

Since commit fcc8487d477a ("uapi: export all headers under uapi
directories") fakechroot make bindeb-pkg fails, mismatching files for
directories:
touch: cannot touch 'usr/include/video/uvesafb.h/.install': Not a
directory

This due to a bug in fakechroot:
when using the function $(wildcard $(srcdir)/*/.) in a makefile, under a
fakechroot environment, not only directories but also files are
returned.

To circumvent that, we are using the functions:
$(sort $(dir $(wildcard $(srcdir)/*/))))

And thanks to Yamada Masahiro who figured out the right
filter-out/patsubst order !

Fixes: fcc8487d477a ("uapi: export all headers under uapi directories")
Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 scripts/Makefile.headersinst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index ce753a408c56..c583a1e1bd3c 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -14,7 +14,15 @@ __headers:
 include scripts/Kbuild.include
 
 srcdir        := $(srctree)/$(obj)
-subdirs       := $(patsubst $(srcdir)/%/.,%,$(wildcard $(srcdir)/*/.))
+
+# When make is run under a fakechroot environment, the function
+# $(wildcard $(srcdir)/*/.) doesn't only return directories, but also regular
+# files. So, we are using a combination of sort/dir/wildcard which works
+# with fakechroot.
+subdirs       := $(patsubst $(srcdir)/%/,%,\
+		 $(filter-out $(srcdir)/,\
+		 $(sort $(dir $(wildcard $(srcdir)/*/)))))
+
 # caller may set destination dir (when installing to asm/)
 _dst          := $(if $(dst),$(dst),$(obj))
 
