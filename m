Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:35238 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732584AbfHFKDr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:03:47 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kbuild: show hint if subdir-y/m is used to visit module Makefile
Date: Tue,  6 Aug 2019 19:03:23 +0900
Message-Id: <20190806100323.22919-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190806100323.22919-1-yamada.masahiro@socionext.com>
References: <20190806100323.22919-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

Since commit ff9b45c55b26 ("kbuild: modpost: read modules.order instead
of $(MODVERDIR)/*.mod"), a module is no longer built in the following
pattern:

  [Makefile]
  subdir-y := some-module

  [some-module/Makefile]
  obj-m := some-module.o

You cannot write Makefile this way in upstream because modules.order is
not correctly generated. subdir-y is used to descend to a sub-directory
that builds tools, device trees, etc.

For external modules, the modules order does not matter. So, the
Makefile above was known to work.

I believe the Makefile should be re-written as follows:

  [Makefile]
  obj-m := some-module/

  [some-module/Makefile]
  obj-m := some-module.o

However, people will have no idea if their Makefile suddenly stops
working. In fact, I received questions from multiple people.

Show a warning if obj-m is specified in a Makefile visited by subdir-y
or subdir-m.

Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 37a1d2cd49d4..4a26c7ed9198 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -52,6 +52,13 @@ ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
 
+ifeq ($(need-modorder),)
+ifneq ($(obj-m),)
+$(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
+$(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
+endif
+endif
+
 # ===========================================================================
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
-- 
2.17.1
