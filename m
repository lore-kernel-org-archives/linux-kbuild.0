Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34065 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732058AbeKTLdO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Nov 2018 06:33:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 6/9] kbuild: change if_changed_rule for multi-line recipe
Date: Tue, 20 Nov 2018 10:05:27 +0900
Message-Id: <1542675930-21114-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The 'define' ... 'endef' directive can describe a recipe that consists
of multiple lines. For example,

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
macro without losing readability.

However, rule_cc_o_c and rule_as_o_S in scripts/Makefile.build are
written like this (with a trailing semicolon in each cmd_*):

  define rule_cc_o_c
          [action1] ; \
          [action2] ; \
          [action3] ;
  endef

All shell commands are concatenated with '; \' so that it looks like
a single command from the Makefile point of view. This does not
exploit the benefits of 'define' ... 'endef' form because a single
shell command can be simply written, like this:

  rule_cc_o_c = \
          [action1] ; \
          [action2] ; \
          [action3] ;

I guess the intention for the command concatenation was to let the
'@set -e' in if_changed_rule cover all the commands.

We can improve the readability by moving '@set -e' to the 'cmd' macro.
The combo of $(call echo-cmd,*) $(cmd_*) in rule_cc_o_c and rule_as_o_S
have been replaced with $(call cmd,*). The trailing back-slashes have
been removed.

Here is a note about the performance: the commands in rule_cc_o_c and
rule_as_o_S were previously executed all together in a single subshell,
but now each line in a separate subshell. This means Make will spawn
extra subshells [1]. I measured the build performance for
  x86_64_defconfig + CONFIG_MODVERSIONS + CONFIG_TRIM_UNUSED_KSYMS
and I saw slight performance regression, but I believe code readability
and maintainability wins.

[1] Precisely, GNU Make may optimize this by executing the command
    directly instead of forking a subshell, if no shell special
    characters are found in the command line and omitting the subshell
    will not change the behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Rewrite commit message more precisely, and mention about the
    build performance

 scripts/Kbuild.include |  6 ++----
 scripts/Makefile.build | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 4b943f4..978d72b 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -215,7 +215,7 @@ echo-cmd = $(if $($(quiet)cmd_$(1)),\
 	echo '  $(call escsq,$($(quiet)cmd_$(1)))$(echo-why)';)
 
 # printing commands
-cmd = @$(echo-cmd) $(cmd_$(1))
+cmd = @set -e; $(echo-cmd) $(cmd_$(1))
 
 # Add $(obj)/ for paths that are not absolute
 objectify = $(foreach o,$(1),$(if $(filter /%,$(o)),$(o),$(obj)/$(o)))
@@ -268,9 +268,7 @@ cmd_and_fixdep =                                                             \
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
index c23ee45..e445b3e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -260,20 +260,20 @@ cmd_gen_ksymdeps = \
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
