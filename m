Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44026 "EHLO
	conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528AbcEEHon (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2016 03:44:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix if_change and friends to consider argument order
Date: Thu,  5 May 2016 16:45:12 +0900
Message-Id: <1462434312-19422-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, David Howells <dhowells@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>, linux-kernel@vger.kernel.org

Currently, arg-check is implemented as follows:

  arg-check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
                      $(filter-out $(cmd_$@),   $(cmd_$(1))) )

This does not care about the order of arguments that appear in
$(cmd_$(1)) and $(cmd_$@).  So, if_changed and friends never rebuild
the target if only the argument order is changed.  This is a problem
when the link order is changed.

Apparently,

  obj-y += foo.o
  obj-y += bar.o

and

  obj-y += bar.o
  obj-y += foo.o

should be distinguished because the link order determines the probe
order of drivers.  So, built-in.o should be rebuilt if the order of
objects is changed.

This commit fixes arg-check to compare two strings as a whole.
$(strip ...) is important because we want to ignore the difference
that comes from white-spaces.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index b2ab2a9..2d03480 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -228,8 +228,8 @@ objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
 ifneq ($(KBUILD_NOCMDDEP),1)
 # Check if both arguments has same arguments. Result is empty string if equal.
 # User may override this check using make KBUILD_NOCMDDEP=1
-arg-check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
-                    $(filter-out $(cmd_$@),   $(cmd_$(1))) )
+arg-check = $(filter-out $(quote)$(strip $(cmd_$1))$(quote), \
+                         $(quote)$(strip $(cmd_$@))$(quote))
 else
 arg-check = $(if $(strip $(cmd_$@)),,1)
 endif
-- 
1.9.1

