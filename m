Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:54275 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423106AbcFMVTb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Jun 2016 17:19:31 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/3] Kbuild: don't add ../../ to include path
Date: Mon, 13 Jun 2016 23:19:44 +0200
Message-Id: <1465852786-3559357-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

When we build with O=objdir and objdir is directly below the source tree,
$(srctree) becomes '..'.

When a Makefile adds a CFLAGS option like -Ipath/to/headers and
we are building with a separate object directory, Kbuild tries to
add two -I options, one for the source tree and one for the object
tree. An absolute path is treated as a special case, and don't add
this one twice. This also normally catches -I$(srctree)/$(src)
as $(srctree) usually is an absolute directory like /home/arnd/linux/.

The combination of the two behaviors however results in an invalid
path name to be included: we get both ../$(src) and ../../$(src),
the latter one pointing outside of the source tree, usually to a
nonexisting directory. Building with 'make W=1' makes this obvious:

cc1: error: ../../arch/arm/mach-s3c24xx/include: No such file or directory [-Werror=missing-include-dirs]

This adds another special case, treating path names starting with ../
like those starting with / so we don't try to prefix that with
$(srctree).

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Kbuild.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0f82314621f2..f8b45eb47ed3 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -202,7 +202,7 @@ hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
 # Prefix -I with $(srctree) if it is not an absolute path.
 # skip if -I has no parameter
 addtree = $(if $(patsubst -I%,%,$(1)), \
-$(if $(filter-out -I/%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1))) $(1))
+$(if $(filter-out -I/% -I../%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1))) $(1))
 
 # Find all -I options and call addtree
 flags = $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))
-- 
2.7.0

