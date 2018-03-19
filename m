Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:49938 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932387AbeCSJCL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Mar 2018 05:02:11 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/5] kbuild: fix modname for composite modules
Date: Mon, 19 Mar 2018 18:01:25 +0900
Message-Id: <1521450087-27291-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1521450087-27291-1-git-send-email-yamada.masahiro@socionext.com>
References: <1521450087-27291-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Commit cf4f21938e13 ("kbuild: Allow to specify composite modules
with modname-m") added modname-m support, but missed to update the
corresponding multi-objs-m & modname-multi definition.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7feb960..35c868f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -50,7 +50,7 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
 # Build list of the parts of our composite objects, our composite
 # objects depend on those (obviously)
 multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
-multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
+multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)))
 
 # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
 # tell kbuild to descend
@@ -173,7 +173,7 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
 # If the object belongs to two or more multi-part objects, all of them are
 # concatenated with a colon separator.
 modname-multi = $(subst $(space),:,$(sort $(foreach m,$(multi-used),\
-		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=)))))
+		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=)))))
 
 # Useful for describing the dependency of composite objects
 # Usage:
-- 
2.7.4

