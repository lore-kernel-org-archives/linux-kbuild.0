Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60323 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754383AbeFRE4D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 00:56:03 -0400
From: NeilBrown <neilb@suse.com>
Date: Mon, 18 Jun 2018 14:55:20 +1000
Subject: [PATCH 1/5] kbuild: detect directories in components of a module.
Message-ID: <152929772039.17463.15099887779014761901.stgit@noble>
In-Reply-To: <152929708853.17463.17302660556961083137.stgit@noble>
References: <152929708853.17463.17302660556961083137.stgit@noble>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

This is a first step in a larger change and so can
only be fully understood in the larger context.

This patch changes the code for extracting directories
from a list of objects to extract them from real-obj-X
instead of obj-X.
This should not cause any change in behaviour yet
as listing directories as components of an object is
not currently supported and will cause an error.
A future patch will give a useful meaning to directories
listed in componsite objects.

A consequence of this change is that any subsequent use of obj-y or
obj-m will still have directories listed in it.
There are no subsequent uses of obj-y and only 2 of obj-m.

1/ obj-m is included as a dependency of __build.  subdir-ym, which
  contains all the directories mentioned in obj-m, is also a
  dependency, so this won't change the set of final dependencies.

2/ Any rule that builds a directory listed in obj-m will find that
   quite_modtag has the value '[M]'.  As quiet_modtag is not used
   when descending into directories, this is of no consequence.

Signed-off-by: NeilBrown <neilb@suse.com>
---
 scripts/Makefile.lib |   38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1bb594fcfe12..ddfdd5cf47cd 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -25,36 +25,36 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # and -m subdirs.  Just put -y's first.
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
 
+# if $(foo-objs), $(foo-y), or $(foo-m) exists, foo.o is a composite object
+multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
+multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
+multi-used   := $(multi-used-y) $(multi-used-m)
+single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
+
+# Replace multi-part objects by their individual parts,
+# including built-in.a from subdirectories
+real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
+real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
+
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
-# o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
+# o if we encounter foo/ in $(real-obj-y), replace it by foo/built-in.a
 #   and add the directory to the list of dirs to descend into: $(subdir-y)
-# o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
+# o if we encounter foo/ in $(real-obj-m), remove it from $(real-obj-m)
 #   and add the directory to the list of dirs to descend into: $(subdir-m)
-__subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
+__subdir-y	:= $(patsubst %/,%,$(filter %/, $(real-obj-y)))
 subdir-y	+= $(__subdir-y)
-__subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
+__subdir-m	:= $(patsubst %/,%,$(filter %/, $(real-obj-m)))
 subdir-m	+= $(__subdir-m)
-obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
-obj-m		:= $(filter-out %/, $(obj-m))
+real-obj-y	:= $(patsubst %/, %/built-in.a, $(real-obj-y))
+real-obj-m	:= $(filter-out %/, $(real-obj-m))
 
 # Subdirectories we need to descend into
 subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
 
-# if $(foo-objs), $(foo-y), or $(foo-m) exists, foo.o is a composite object
-multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
-multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
-multi-used   := $(multi-used-y) $(multi-used-m)
-single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
-
-# $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
+# $(subdir-obj-y) is the list of objects in $(real-obj-y) which uses dir/ to
 # tell kbuild to descend
-subdir-obj-y := $(filter %/built-in.a, $(obj-y))
-
-# Replace multi-part objects by their individual parts,
-# including built-in.a from subdirectories
-real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
-real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
+subdir-obj-y := $(filter %/built-in.a, $(real-obj-y))
 
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built


