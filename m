Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:23901 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750740AbdKIPm4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 10:42:56 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] kbuild: create directory for make cache only when necessary
Date: Fri, 10 Nov 2017 00:41:14 +0900
Message-Id: <1510242077-8122-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Currently, the existence of $(dir $(make-cache)) is always checked,
and created if it is missing.

We can avoid unnecessary system calls by some tricks.

[1] If KBUILD_SRC is unset, we are building in the source tree.
    The output directory checks can be entirely skipped.
[2] If at least one cache data is found, it means the cache file
    was included.  Obiously its directory exists.  Skip "mkdir -p".
[3] If Makefile does not contain any call of __run-and-store, it will
    not create a cache file.  No need to create its directory.
[4] The "mkdir -p" should be only invoked by the first call of
    __run-and-store

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index be1c9d6..4fb1be1 100644
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
 
+cache-dir := $(if $(KBUILD_SRC),$(if $(cache-data),,$(dir $(make-cache))))
+
 # Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
 #
 # Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
@@ -136,6 +137,10 @@ __sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$
 define __run-and-store
 ifeq ($(origin $(1)),undefined)
   $$(eval $(1) := $$(shell $$(2)))
+ifneq ($(cache-dir),)
+  $$(shell mkdir -p $(cache-dir))
+  $$(eval cache-dir :=)
+endif
   $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
 endif
 endef
-- 
2.7.4

