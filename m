Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:26877 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753918AbcB2DsZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Feb 2016 22:48:25 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v4 5/8] kbuild: add fine grained build dependencies for
 exported symbols
Date: Sun, 28 Feb 2016 22:48:08 -0500
Message-id: <1456717691-28298-6-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Like with kconfig options, we now have the ability to compile in and
out individual EXPORT_SYMBOL() declarations based on the content of
include/generated/autoksyms.h.  However we don't want the entire
world to be rebuilt whenever that file is touched.

Let's apply the same build dependency trick used for CONFIG_* symbols
where the time stamp of empty files whose paths matching those symbols
is used to trigger fine grained rebuilds. In our case the key is the
symbol name passed to EXPORT_SYMBOL().

However, unlike config options, we cannot just use fixdep to parse
the source code for EXPORT_SYMBOL(ksym) because several variants exist
and parsing them all in a separate tool, and keeping it in synch, is
not trivially maintainable.  Furthermore, there are variants such as

	EXPORT_SYMBOL_GPL(pci_user_read_config_##size);

that are instanciated via a macro for which we can't easily determine
the actual exported symbol name(s) short of actually running the
preprocessor on them.

Storing the symbol name string in a special ELF section doesn't work
for targets that output assembly or preprocessed source.

So the best way is really to leverage the preprocessor by having it emit
a warning for each EXPORT_SYMBOL() instance and filtering those apart
from stderr by the build system. Then the list of symbols is simply fed
to fixdep to be merged with the other dependencies.

Because of the lowercasing performed by fixdep, there might be name
collisions triggering spurious rebuilds for similar symbols. But this
shouldn't be a big issue in practice. (This is the case for CONFIG_*
symbols and I didn't want to be different here, whatever the original
reason for doing so.)

To avoid needless build overhead, the exported symbol name gathering is
performed only when CONFIG_TRIM_UNUSED_KSYMS is selected.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Acked-by: Rusty Russell <rusty@rustcorp.com.au>
---
 include/linux/export.h | 16 ++++++++++++++--
 scripts/Kbuild.include | 28 ++++++++++++++++++++++++++++
 scripts/basic/fixdep.c |  1 +
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 77afdb2a25..794392102d 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -76,8 +76,20 @@ extern struct module __this_module;
 	___cond_export_sym(sym, sec, conf)
 #define ___cond_export_sym(sym, sec, enabled)			\
 	__cond_export_sym_##enabled(sym, sec)
-#define __cond_export_sym_1(sym, sec) ___EXPORT_SYMBOL(sym, sec)
-#define __cond_export_sym_0(sym, sec) /* nothing */
+#define __cond_export_sym_1(sym, sec)				\
+	__KSYM_DEP(sym) ___EXPORT_SYMBOL(sym, sec)
+#define __cond_export_sym_0(sym, sec)				\
+	__KSYM_DEP(sym) /* nothing */
+
+/*
+ * For fine grained build dependencies, we want to tell the build system
+ * about each possible exported symbol even if they're not actually exported.
+ * This is accomplished with a preprocessor warning that gets captured by
+ * the make rule (see ksym_dep_filter in scripts/Kbuild.include).
+ */
+#define __KSYM_DEP(sym) __pragma_string( KBUILD_AUTOKSYM_DEP: sym )
+#define __pragma_string(x) __emit_pragma( GCC warning #x )
+#define __emit_pragma(x) _Pragma(#x)
 
 #else
 #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8a257fa663..0b69479310 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -258,12 +258,40 @@ if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
 	@set -e;                                                             \
 	$(cmd_and_fixdep))
 
+ifndef CONFIG_TRIM_UNUSED_KSYMS
+
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
 	rm -f $(depfile);                                                    \
 	mv -f $(dot-target).tmp $(dot-target).cmd;
 
+else
+
+# Filter out exported kernel symbol names advertised as warning pragmas
+# by the preprocessor and write them to $(1). We must consider continuation
+# lines as well: they start with a blank, or the preceeding line ends with
+# a ':'. Anything else is passed through as is.
+# See also __KSYM_DEP() in include/linux/export.h.
+ksym_dep_filter = sed -n \
+	-e '1 {x; $$!d}' \
+	-e '/^ / {H; $$!d}' \
+	-e 'x; /:$$/ {x; H; $$!d; s/^/ /; x}' \
+	-e ':filter; /^.*KBUILD_AUTOKSYM_DEP: /! {p; b next}' \
+	-e 's//KSYM_/; s/\n.*//; w $(1)' \
+	-e ':next; $$!d' \
+	-e '1 q; s/^/ /; x; /^ /! b filter'
+
+cmd_and_fixdep =                                                             \
+	$(echo-cmd)                                                          \
+	$(cmd_$(1)) 2>&1 | $(call ksym_dep_filter,$(dot-target).ksym.tmp) >&2;\
+	scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'                  \
+	    < $(dot-target).ksym.tmp > $(dot-target).tmp;	             \
+	rm -f $(dot-target).ksym.tmp $(depfile);                             \
+	mv -f $(dot-target).tmp $(dot-target).cmd;
+
+endif
+
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index d984deb120..2dc6bf754a 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -354,6 +354,7 @@ static void parse_dep_file(void *map, size_t len)
 
 			/* Ignore certain dependencies */
 			if (strrcmp(s, "include/generated/autoconf.h") &&
+			    strrcmp(s, "include/generated/autoksyms.h") &&
 			    strrcmp(s, "arch/um/include/uml-config.h") &&
 			    strrcmp(s, "include/linux/kconfig.h") &&
 			    strrcmp(s, ".ver")) {
-- 
2.5.0

