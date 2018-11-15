Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:50789 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbeKOSf1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 13:35:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/8] kbuild: change if_changed_rule to accept multi-line recipe
Date: Thu, 15 Nov 2018 17:27:12 +0900
Message-Id: <1542270435-11181-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

GNU Make supports 'define' ... 'endef' directive, which can describe
a recipe that consists of multiple lines.

For example,

    all:
            @echo hello
            @echo world

... can be written as:

    define greeting
            @echo hello
            @echo world
    endif

    all:
            $(greeting)

This is useful to confine a series of shell commands into a single
macro, keeping readability.

However, if_changed_rule cannot accept multi-line recipe. As you see
rule_cc_o_c and rule_as_o_S in scripts/Makefile.build, it must be
written like this:

  define rule_cc_o_c
          @[action1] ; \
          [action2] ; \
          [action3]
  endef

This does not actually exploit the benefits of 'define' ... 'endef'
form. All shell commands must be concatenated with '; \' so that it
looks like a single command from the Makefile point of view. '@' can
only appear before the first action.

The root cause of this misfortune is the '@set -e;' in if_changed_rule.
It is easily solvable by moving '@set -e' to the 'cmd' macro.

The combo of $(call echo-cmd,*) $(cmd_*) in rule_cc_o_c and rule_as_o_S
were replaced with $(call cmd,*). The tailing back-slashes went away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include |  6 ++----
 scripts/Makefile.build | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 1eafc85..5e47bf6 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -215,7 +215,7 @@ echo-cmd = $(if $($(quiet)cmd_$(1)),\
 	echo '  $(call escsq,$($(quiet)cmd_$(1)))$(echo-why)';)
 
 # printing commands
-cmd = @$(echo-cmd) $(cmd_$(1))
+cmd = @set -e; $(echo-cmd) $(cmd_$(1))
 
 # Add $(obj)/ for paths that are not absolute
 objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
@@ -269,9 +269,7 @@ cmd_and_fixdep =                                                             \
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
-if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \
-	@set -e;                                                             \
-	$(rule_$(1)), @:)
+if_changed_rule = $(if $(strip $(any-prereq) $(arg-check)), $(rule_$(1)), @:)
 
 ###
 # why - tell why a target got built
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e5ba9b1..5528a6a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -263,20 +263,20 @@ cmd_gen_ksymdeps = \
 endif
 
 define rule_cc_o_c
-	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
-	$(call cmd_and_fixdep,cc_o_c)					  \
-	$(cmd_gen_ksymdeps)						  \
-	$(cmd_checkdoc)							  \
-	$(call echo-cmd,objtool) $(cmd_objtool)				  \
-	$(cmd_modversions_c)						  \
-	$(call echo-cmd,record_mcount) $(cmd_record_mcount)
+	$(call cmd,checksrc)
+	@$(call cmd_and_fixdep,cc_o_c)
+	$(call cmd,gen_ksymdeps)
+	$(call cmd,checkdoc)
+	$(call cmd,objtool)
+	$(call cmd,modversions_c)
+	$(call cmd,record_mcount)
 endef
 
 define rule_as_o_S
-	$(call cmd_and_fixdep,as_o_S)					  \
-	$(cmd_gen_ksymdeps)						  \
-	$(call echo-cmd,objtool) $(cmd_objtool)				  \
-	$(cmd_modversions_S)
+	@$(call cmd_and_fixdep,as_o_S)
+	$(call cmd,gen_ksymdeps)
+	$(call cmd,objtool)
+	$(call cmd,modversions_S)
 endef
 
 # List module undefined symbols (or empty line if not enabled)
-- 
2.7.4
