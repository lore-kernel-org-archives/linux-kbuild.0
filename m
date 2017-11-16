Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:37479 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933477AbdKPHsa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 02:48:30 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: define KBUILD_MODNAME even if multiple modules share objects
Date: Thu, 16 Nov 2017 16:46:36 +0900
Message-Id: <1510818396-17443-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Cao jin <caoj.fnst@cn.fujitsu.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Currently, KBUILD_MODNAME is defined only when $(modname) contains
just one word.  If an object is shared between multiple modules,
undefined KBUILD_MODNAME causes a build error.

A simple test case is as follows:

  obj-m += foo.o
  obj-m += bar.o
  foo-objs := foo-bar-common.o foo-main.o
  bar-objs := foo-bar-common.o bar-main.o

In this case, we do not know what to define for KBUILD_MODNAME when
compiling foo-bar-common.o ("foo" or "bar" ?), so one reasonable
solution is let it fall back to $(basetarget) (= "foo-bar-common").

It would be better to avoid such a design where possible, but we
already have such a case, for example,
drivers/net/ethernet/cavium/liquidio/Makefile

I slightly refactored implementation; we can check $(word 2, $(modname))
instead of $(filter 1,$(words $(modname))).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5fbc46d..9f9a7df 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -86,8 +86,7 @@ subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 #       differ in different configs.
 name-fix = $(squote)$(quote)$(subst $(comma),_,$(subst -,_,$1))$(quote)$(squote)
 basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
-modname_flags  = $(if $(filter 1,$(words $(modname))),\
-                 -DKBUILD_MODNAME=$(call name-fix,$(modname)))
+modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(if $(word 2,$(modname)),$(basetarget),$(modname)))
 
 orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
                  $(ccflags-y) $(CFLAGS_$(basetarget).o)
-- 
2.7.4

