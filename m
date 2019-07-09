Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:42175 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfGIEZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:42 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 01/11] kbuild: do not create empty modules.order in the prepare stage
Date: Tue,  9 Jul 2019 13:24:05 +0900
Message-Id: <20190709042416.27554-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Currently, $(objtree)/modules.order is touched in two places.

In the 'prepare0' rule, scripts/Makefile.build creates an empty
modules.order while processing 'obj=.'

In the 'modules' rule, the top-level Makefile overwrites it with
the correct list of modules.

It might be a good side-effect that modules.order is made empty
every time (probably this is not intended functionality), but I
personally do not like this behavior.

Kbuild descends into some directories in the preparation stage,
where created modules.order files may be broken.

Export 'preparing' while running the 'prepare' target, and when it
is defined, do not touch modules.order at all.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile               | 1 +
 scripts/Makefile.build | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 5c75ea7177f6..a31b672d512b 100644
--- a/Makefile
+++ b/Makefile
@@ -1000,6 +1000,7 @@ ifdef CONFIG_STACK_VALIDATION
 endif
 
 PHONY += prepare0
+prepare: export preparing=1
 
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 776842b7e6a3..93c20664bcbb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -64,8 +64,10 @@ builtin-target := $(obj)/built-in.a
 endif
 
 ifdef CONFIG_MODULES
+ifndef preparing
 modorder-target := $(obj)/modules.order
 endif
+endif
 
 # We keep a list of all modules in $(MODVERDIR)
 
-- 
2.17.1
