Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:29566 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388500AbfGYPHk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 11:07:40 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [FWIW PATCH] kbuild: create modules.order in sub-directories visited by subdir-y,m
Date: Fri, 26 Jul 2019 00:06:00 +0900
Message-Id: <20190725150600.27007-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Jan Kiszka reported a module build regression; since commit ff9b45c55b26
("kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod"),
a module is no longer built in the following pattern:

  [Makefile]
  subdir-y := some-module

  [some-module/Makefile]
  obj-m := some-module.o

You can make it work by writing like this:

  [Makefile]
  obj-m := some-module/

  [some-module/Makefile]
  obj-m := some-module.o

None of upstream Makefiles is written like the former. In fact, the
former is a bug in upstream since modules.order is not correctly
generated.

For external modules, it was at least known to work, and being used
by some people.

This commit gets it back working, but I do not to want to encourage it
for the upstream code, so I surrounded it by ifeq ($(KBUILD_EXTMOD),).

Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I just wrote a fix-up patch, but I am still wondering if it is correct
to build modules under subdir-y.


 scripts/Makefile.lib | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5241d0751eb0..9568888c97ca 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -25,6 +25,11 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # and -m subdirs.  Just put -y's first.
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
 
+ifeq ($(KBUILD_EXTMOD),)
+# External modules may generate modules under subdir-y or subdir-m.
+modorder += $(addsuffix /modules.order, $(subdir-y) $(subdir-m))
+endif
+
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
 # o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
-- 
2.17.1
