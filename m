Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:13447 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750973AbdISLiE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Sep 2017 07:38:04 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild: comments cleanup in Makefile.lib
Date: Tue, 19 Sep 2017 19:36:07 +0800
Message-ID: <1505820967-17302-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com

It has:
1. Move comments close to what it want to comment.
2. Comments cleanup & improvement.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 scripts/Makefile.lib | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 58c05e5..7de9c08 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -4,8 +4,7 @@ ccflags-y  += $(EXTRA_CFLAGS)
 cppflags-y += $(EXTRA_CPPFLAGS)
 ldflags-y  += $(EXTRA_LDFLAGS)
 
-#
-# flags that take effect in sub directories
+# flags that take effect in current and sub directories
 export KBUILD_SUBDIR_ASFLAGS := $(KBUILD_SUBDIR_ASFLAGS) $(subdir-asflags-y)
 export KBUILD_SUBDIR_CCFLAGS := $(KBUILD_SUBDIR_CCFLAGS) $(subdir-ccflags-y)
 
@@ -14,14 +13,16 @@ export KBUILD_SUBDIR_CCFLAGS := $(KBUILD_SUBDIR_CCFLAGS) $(subdir-ccflags-y)
 
 # When an object is listed to be built compiled-in and modular,
 # only build the compiled-in version
-
 obj-m := $(filter-out $(obj-y),$(obj-m))
 
 # Libraries are always collected in one lib file.
 # Filter out objects already built-in
-
 lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 
+# Determine modorder.
+# Unfortunately, we don't have information about ordering between -y
+# and -m subdirs.  Just put -y's first.
+modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
 
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
@@ -29,12 +30,6 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 #   and add the directory to the list of dirs to descend into: $(subdir-y)
 # o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
 #   and add the directory to the list of dirs to descend into: $(subdir-m)
-
-# Determine modorder.
-# Unfortunately, we don't have information about ordering between -y
-# and -m subdirs.  Just put -y's first.
-modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
-
 __subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
 subdir-y	+= $(__subdir-y)
 __subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
@@ -43,10 +38,9 @@ obj-y		:= $(patsubst %/, %/built-in.o, $(obj-y))
 obj-m		:= $(filter-out %/, $(obj-m))
 
 # Subdirectories we need to descend into
-
 subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
 
-# if $(foo-objs) exists, foo.o is a composite object
+# if $(foo-objs) or $(foo-y) or $(foo-m) exists, foo.o is a composite object
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
 multi-used   := $(multi-used-y) $(multi-used-m)
@@ -90,7 +84,6 @@ subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 obj-dirs	:= $(addprefix $(obj)/,$(obj-dirs))
 
 # These flags are needed for modversions and compiling, so we define them here
-# already
 # $(modname_flags) #defines KBUILD_MODNAME as the name of the module it will
 # end up in (or would, if it gets compiled in)
 # Note: Files that end up in two or more modules are compiled without the
-- 
2.1.0



