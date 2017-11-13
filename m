Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40628 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752320AbdKMKbf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:31:35 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 1/6] kbuild: create directory for make cache only when necessary
Date: Mon, 13 Nov 2017 19:29:34 +0900
Message-Id: <1510568979-24440-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Currently, the existence of $(dir $(make-cache)) is always checked,
and created if it is missing.

We can avoid unnecessary system calls by some tricks.

[1] If KBUILD_SRC is unset, we are building in the source tree.
    The output directory checks can be entirely skipped.
[2] If at least one cache data is found, it means the cache file
    was included.  Obviously its directory exists.  Skip "mkdir -p".
[3] If Makefile does not contain any call of __run-and-store, it will
    not create a cache file.  No need to create its directory.
[4] The "mkdir -p" should be only invoked by the first call of
    __run-and-store

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
  - Use boolean flag "create-cache-dir" for clarification
  - Fix a typo in git-log:  Obiously -> Obviously

 scripts/Kbuild.include | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index be1c9d6..065324a 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -99,18 +99,19 @@ cc-cross-prefix =  \
 
 # Include values from last time
 make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cache.mk
-ifeq ($(wildcard $(dir $(make-cache))),)
-$(shell mkdir -p '$(dir $(make-cache))')
-endif
 $(make-cache): ;
 -include $(make-cache)
 
+cached-data := $(filter __cached_%, $(.VARIABLES))
+
 # If cache exceeds 1000 lines, shrink it down to 500.
-ifneq ($(word 1000,$(filter __cached_%, $(.VARIABLES))),)
+ifneq ($(word 1000,$(cached-data)),)
 $(shell tail -n 500 $(make-cache) > $(make-cache).tmp; \
 	mv $(make-cache).tmp $(make-cache))
 endif
 
+create-cache-dir := $(if $(KBUILD_SRC),$(if $(cache-data),,1))
+
 # Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
 #
 # Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
@@ -136,6 +137,10 @@ __sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$
 define __run-and-store
 ifeq ($(origin $(1)),undefined)
   $$(eval $(1) := $$(shell $$(2)))
+ifeq ($(create-cache-dir),1)
+  $$(shell mkdir -p $(dir $(make-cache)))
+  $$(eval create-cache-dir :=)
+endif
   $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
 endif
 endef
-- 
2.7.4

