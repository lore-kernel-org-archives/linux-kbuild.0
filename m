Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:55073 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfFVQHM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 12:07:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: save $(strip ...) for calling any-prepreq
Date: Sun, 23 Jun 2019 01:07:04 +0900
Message-Id: <20190622160705.17071-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190622160705.17071-1-yamada.masahiro@socionext.com>
References: <20190622160705.17071-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The string returned by $(filter-out ...) does not contain any leading
or trailing spaces.

So, only the space that matters is the one between

  $(filter-out $(PHONY),$?)

and

  $(filter-out $(PHONY) $(wildcard $^),$^)

By removing it from the code, we can save $(strip ...) evaluation.
This refactoring is possible because $(any-prereq) is only passed to
the first argument of $(if ...), so we are only interested in whether
it is empty or not.

This is also the prerequisite for the next commit.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 4bec04c89750..0fa93f6de0b0 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -231,7 +231,7 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 
 # Find any prerequisites that is newer than target or that does not exist.
 # PHONY targets skipped in both cases.
-any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
+any-prereq = $(filter-out $(PHONY),$?)$(filter-out $(PHONY) $(wildcard $^),$^)
 
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed = $(if $(strip $(any-prereq) $(cmd-check)),                       \
@@ -274,7 +274,7 @@ ifeq ($(KBUILD_VERBOSE),2)
 why =                                                                        \
     $(if $(filter $@, $(PHONY)),- due to target is PHONY,                    \
         $(if $(wildcard $@),                                                 \
-            $(if $(strip $(any-prereq)),- due to: $(any-prereq),             \
+            $(if $(any-prereq),- due to: $(any-prereq),                      \
                 $(if $(cmd-check),                                           \
                     $(if $(cmd_$@),- due to command line change,             \
                         $(if $(filter $@, $(targets)),                       \
-- 
2.17.1
