Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:21982 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGZCSK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 22:18:10 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: clean-up subdir-ym computation
Date: Fri, 26 Jul 2019 11:17:47 +0900
Message-Id: <20190726021747.5021-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The intermediate variables __subdir-{y,m} are unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 41c50f9461e5..444574963cb5 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -20,27 +20,20 @@ obj-m := $(filter-out $(obj-y),$(obj-m))
 # Filter out objects already built-in
 lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 
+# Subdirectories we need to descend into
+subdir-ym := $(sort $(subdir-y) $(subdir-m) $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-m))))
+
 # Determine modorder.
 # Unfortunately, we don't have information about ordering between -y
 # and -m subdirs.  Just put -y's first.
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
 
 # Handle objects in subdirs
-# ---------------------------------------------------------------------------
-# o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
-#   and add the directory to the list of dirs to descend into: $(subdir-y)
-# o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
-#   and add the directory to the list of dirs to descend into: $(subdir-m)
-__subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
-subdir-y	+= $(__subdir-y)
-__subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
-subdir-m	+= $(__subdir-m)
+# When we encounter foo/ in $(obj-y), link foo/built-in.a into vmlinux,
+# but we do not do that for $(obj-m)
 obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
 obj-m		:= $(filter-out %/, $(obj-m))
 
-# Subdirectories we need to descend into
-subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
-
 # if $(foo-objs), $(foo-y), or $(foo-m) exists, foo.o is a composite object
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
-- 
2.17.1
