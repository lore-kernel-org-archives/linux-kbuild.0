Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:58788 "EHLO
	conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433AbcEGGtD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 7 May 2016 02:49:03 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: fix if_change and friends to consider argument order
Date: Sat,  7 May 2016 15:48:26 +0900
Message-Id: <1462603706-6324-1-git-send-email-yamada.masahiro@socionext.com>
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
order of drivers.  So, built-in.o should be rebuilt when the order
of objects is changed.

This commit fixes arg-check to compare the old/current commands
including the argument order.

Of course, this change has a side effect; Kbuild will react to the
change of compile option order.  For example, "-DFOO -DBAR" and
"-DBAR -DFOO" should give no difference to the build result, but
false positive should be better than false negative.

I am moving space_escape to the top of Kbuild.include just for a
matter of preference.  In practical terms, space_escape can be
defined after arg-check because arg-check uses "=" flavor, not ":=".
Having said that, collecting convenient variables in one place makes
sense from the point of readability.

Chaining "%%%SPACE%%%" to "_-_SPACE_-_" is also a matter of taste
at this point.  Actually, it can be arbitrary as long as it is an
unlikely used string.  The only problem I see in "%%%SPACE%%%" is
that "%" is a special character in "$(patsubst ...)" context.  This
commit just uses "$(subst ...)" for arg-check, but I am fixing it now
in case we might want to use it in $(patsubst ...) context in the
future.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - V1 did not work.  Change the approach.

 scripts/Kbuild.include | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index b2ab2a9..c4467e2 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -7,6 +7,7 @@ quote   := "
 squote  := '
 empty   :=
 space   := $(empty) $(empty)
+space_escape := _-_SPACE_-_
 
 ###
 # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
@@ -226,10 +227,10 @@ objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
 # See Documentation/kbuild/makefiles.txt for more info
 
 ifneq ($(KBUILD_NOCMDDEP),1)
-# Check if both arguments has same arguments. Result is empty string if equal.
-# User may override this check using make KBUILD_NOCMDDEP=1
-arg-check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
-                    $(filter-out $(cmd_$@),   $(cmd_$(1))) )
+# Check if both arguments are the same including their order. Result is empty
+# string if equal. User may override this check using make KBUILD_NOCMDDEP=1
+arg-check = $(filter-out $(subst $(space),$(space_escape),$(strip $(cmd_$@))), \
+                         $(subst $(space),$(space_escape),$(strip $(cmd_$1))))
 else
 arg-check = $(if $(strip $(cmd_$@)),,1)
 endif
@@ -341,8 +342,6 @@ endif
 #
 ###############################################################################
 #
-space_escape := %%%SPACE%%%
-#
 define config_filename
 ifneq ($$(CONFIG_$(1)),"")
 $(1)_FILENAME := $$(subst \\,\,$$(subst \$$(quote),$$(quote),$$(subst $$(space_escape),\$$(space),$$(patsubst "%",%,$$(subst $$(space),$$(space_escape),$$(CONFIG_$(1)))))))
-- 
1.9.1

