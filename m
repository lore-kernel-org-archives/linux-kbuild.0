Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:31975 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751480AbdJML1l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Oct 2017 07:27:41 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: shrink .cache.mk when it exceeds 1000 lines
Date: Fri, 13 Oct 2017 20:25:29 +0900
Message-Id: <1507893929-32573-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

The cache files are only cleaned away by "make clean".  If you continue
incremental builds, the cache files will grow up little by little.
It is not a big deal in general use cases because compiler flags do not
change quite often.

However, if you do build-test for various architectures, compilers, and
kernel configurations, you will end up with huge cache files soon.

When the cache file exceeds 1000 lines, shrink it down to 500 by "tail".
The Least Recently Added lines are cut. (not Least Recently Used)
I hope it will work well enough.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Simplify code per Douglas Anderson

 scripts/Kbuild.include | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 4203fff..d939490 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -102,6 +102,12 @@ make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cach
 $(make-cache): ;
 -include $(make-cache)
 
+# If cache exceeds 1000 lines, shrink it down to 500.
+ifneq ($(word 1000,$(filter __cached_%, $(.VARIABLES))),)
+$(shell tail -n 500 $(make-cache) > $(make-cache).tmp; \
+	mv $(make-cache).tmp $(make-cache))
+endif
+
 # Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
 #
 # Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
-- 
2.7.4

