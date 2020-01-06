Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:59011 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgAFHYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:24:40 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/2] kbuild: get rid of duplication in the first line of *.mod files
Date: Mon,  6 Jan 2020 16:23:54 +0900
Message-Id: <20200106072355.32178-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Fumiya Shigemitsu <shfy1014@gmail.com>, Yongxin Liu <yongxin.liu@windriver.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The first line of *.mod lists the object files that consist of the
module. This may contain duplication if the same object is added
multiple times, like this:

  obj-m := foo.o
  foo-$(CONFIG_FOO1_X) += foo1.o
  foo-$(CONFIG_FOO1_Y) += foo1.o
  foo-$(CONFIG_FOO2_X) += foo2.o
  foo-$(CONFIG_FOO2_Y) += foo2.o

This is probably not a big deal. As far as I know, the only small
problem is scripts/mod/sumversion.c parses the same file over again.
This can be avoided by adding $(sort ...). It has a side-effect that
sorts the objects alphabetically, but it is not a big deal, either.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 scripts/Makefile.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b734ac8a654e..d8445b696d5b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -265,8 +265,10 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
+multi-m-prereqs = $(sort $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)))
+
 cmd_mod = { \
-	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
+	echo $(if $(multi-m-prereqs), $(multi-m-prereqs), $(@:.mod=.o)); \
 	$(cmd_undef_syms); \
 	} > $@
 
-- 
2.17.1
