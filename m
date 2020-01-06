Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:59020 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbgAFHYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:24:40 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 2/2] kbuild: allow modules to link *.a archives
Date: Mon,  6 Jan 2020 16:23:55 +0900
Message-Id: <20200106072355.32178-2-masahiroy@kernel.org>
In-Reply-To: <20200106072355.32178-1-masahiroy@kernel.org>
References: <20200106072355.32178-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Fumiya Shigemitsu <shfy1014@gmail.com>, Yongxin Liu <yongxin.liu@windriver.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit 69ea912fda74 ("kbuild: remove unneeded link_multi_deps"),
modules cannot link *.a archives.

I do not see such a usecase in the upstream code, but multiple people
reported this issue, so it seems to be a desired feature for external
modules.

For example, libfoo.a is not linked in the following test case:

    obj-m := foo.o
    foo-objs := foo1.o libfoo.a

I used $(filter $(multi-m-prereqs), $^) to avoid linking the same object
multiple times in case Makefile is written as follows:

    obj-m := foo.o
    foo-$(CONFIG_FOO1_X) += foo1.o
    foo-$(CONFIG_FOO1_Y) += foo1.o
    foo-y += libfoo.a

Reported-by: Fumiya Shigemitsu <shfy1014@gmail.com>
Reported-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - add $(filter ..., $^) to avoid build errors caused by multiple linking

 scripts/Makefile.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d8445b696d5b..9ffb9300705e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -429,13 +429,13 @@ targets += $(obj)/lib-ksyms.o
 endif
 
 # NOTE:
-# Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
-# module is turned into a multi object module, $^ will contain header file
-# dependencies recorded in the .*.cmd file.
+# Do not replace $(filter $(multi-m-prereqs), $^) with $(real-prereqs).
+# When a single object module is turned into a multi object module,
+# $^ will contain header file dependencies recorded in the .*.cmd file.
 quiet_cmd_link_multi-m = LD [M]  $@
-      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
+      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter $(multi-m-prereqs), $^)
 
-$(multi-used-m): FORCE
+$(multi-used-m): $(obj)/%.o: FORCE
 	$(call if_changed,link_multi-m)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
-- 
2.17.1
