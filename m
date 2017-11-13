Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:17693 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751759AbdKMKmA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:42:00 -0500
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild: fixes in Makefile.lib
Date: Mon, 13 Nov 2017 18:41:59 +0800
Message-ID: <20171113104159.30409-1-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net

Commit cf4f21938e13 ("kbuild: Allow to specify composite modules
with modname-m") added modname-m support, but missed to update the
corresponding multi-objs-m & modname-multi definition.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
Addressed the all comments of Masahiro-san from RFC version, and TESTed it.

 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 580e605118e4..a9d54b1fa017 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -49,7 +49,7 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
 # Build list of the parts of our composite objects, our composite
 # objects depend on those (obviously)
 multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
-multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
+multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)))
 multi-objs   := $(multi-objs-y) $(multi-objs-m)
 
 # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
@@ -174,7 +174,7 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
 
 # Finds the multi-part object the current object will be linked into
 modname-multi = $(sort $(foreach m,$(multi-used),\
-		$(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=))))
+		$(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))
 
 # Useful for describing the dependency of composite objects
 # Usage:
-- 
2.13.6



