Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:35352 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756573AbdJLJcL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 05:32:11 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: shrink Makefile cache when it exceeds 1000 lines
Date: Thu, 12 Oct 2017 18:29:29 +0900
Message-Id: <1507800569-30134-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

The cache files are only cleaned away by "make clean".  If you continue
incremental builds, the cache files will grow up little by little.
It is not a big deal in general use cases because $(call cc-option,...)
in not added/deleted quite often.

However, if you do build-test for various architectures, compilers, and
kernel configurations, you will end up with huge cache files soon.

The simple idea is to cut down the cache when it exceeds a certain
limit.  I wrote a simple method to check if nr_cache >= 1000.
If it is, shrink it by "tail -500".  This is not LRU strategy, but I
hope it will work well enough.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

If you have a better idea, please suggest it!


 scripts/Kbuild.include | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 4203fff..db81df3 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -99,9 +99,30 @@ cc-cross-prefix =  \
 
 # Include values from last time
 make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cache.mk
-$(make-cache): ;
 -include $(make-cache)
 
+nr_cache := $(words $(filter __cached_%, $(.VARIABLES)))
+
+# Strip the last digit.  Covert as follows:
+#    0   ->
+#    123 -> 12
+strip_last_digit = $(filter-out $1,$(firstword \
+		$(sort $(foreach i,0 1 2 3 4 5 6 7 8 9,$(patsubst %$i,%,$1)))))
+
+# If cache exceeds 1000 lines, shrink it down to 500.  The Least Recently Added
+# lines are deleted. (not Least Recently Used, unfortunately)
+#
+# Evalucate [ ${nr_cache} -ge 1000 ] without relying on external tools.
+# Check if nr_cache is not empty even after the last three digits are stripped.
+ifneq ($(call strip_last_digit,$(call strip_last_digit,$(call strip_last_digit,$(nr_cache)))),)
+.PHONY: $(make-cache)
+$(make-cache):
+	tail -500 $@ > $@.tmp
+	mv $@.tmp $@
+else
+$(make-cache): ;
+endif
+
 # Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
 #
 # Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
-- 
2.7.4

