Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:18802 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727433AbfLRQEq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 11:04:46 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: do not create orphan built-in.a or obj-y objects
Date: Thu, 19 Dec 2019 01:04:28 +0900
Message-Id: <20191218160428.27934-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Both 'obj-y += foo/' and 'obj-m += foo/' request Kbuild to visit the
sub-directory foo/, but the difference is that only the former combines
foo/built-in.a into the built-in.a of the current directory because
everything in sub-directories visited by obj-m is supposed to be modular.

So, it makes sense to create built-in.a only if that sub-directory is
reachable by the chain of obj-y. Otherwise, built-in.a will not be
linked into vmlinux anyway. For the same reason, it is pointless to
compile obj-y objects in the directory visited by obj-m.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b734ac8a654e..e46b4ee9a120 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -66,7 +66,7 @@ lib-target := $(obj)/lib.a
 real-obj-y += $(obj)/lib-ksyms.o
 endif
 
-ifneq ($(strip $(real-obj-y) $(need-builtin)),)
+ifdef need-builtin
 builtin-target := $(obj)/built-in.a
 endif
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index b51144f271f2..ee930e09d198 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -35,7 +35,11 @@ __subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
 subdir-y	+= $(__subdir-y)
 __subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
 subdir-m	+= $(__subdir-m)
+ifdef need-builtin
 obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
+else
+obj-y		:= $(filter-out %/, $(obj-y))
+endif
 obj-m		:= $(filter-out %/, $(obj-m))
 
 # Subdirectories we need to descend into
-- 
2.17.1
