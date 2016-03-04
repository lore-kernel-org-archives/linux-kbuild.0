Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt22.smtp-out.videotron.ca ([70.80.0.73]:52187 "EHLO
	alt22.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751914AbcCDFz6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Mar 2016 00:55:58 -0500
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v5 5/8] kbuild: add fine grained build dependencies for exported symbols
Date: Fri,  4 Mar 2016 00:40:47 -0500
Message-Id: <1457070050-1564-6-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org>
References: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org>
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

So the best way is really to leverage the preprocessor by having it
output actual symbol names anchored by a special sequence that can be
easily filtered out. Then the list of symbols is simply fed to fixdep
to be merged with the other dependencies.

That implies the preprocessor is executed twice for each source file.
A previous attempt relied on a warning pragma for each EXPORT_SYMBOL()
instance that was filtered apart from stderr by the build system with
a sed script during the actual compilation pass. Unfortunately the
preprocessor/compiler diagnostic output isn't stable between versions
and this solution, although more efficient, was deemed too fragile.

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
 include/linux/export.h | 13 ++++++++++++-
 scripts/Kbuild.include | 24 ++++++++++++++++++++++++
 scripts/basic/fixdep.c |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 77afdb2a25..2f9ccbe6a6 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -65,7 +65,18 @@ extern struct module __this_module;
 	__attribute__((section("___ksymtab" sec "+" #sym), unused))	\
 	= { (unsigned long)&sym, __kstrtab_##sym }
 
-#ifdef CONFIG_TRIM_UNUSED_KSYMS
+#if defined(__KSYM_DEPS__)
+
+/*
+ * For fine grained build dependencies, we want to tell the build system
+ * about each possible exported symbol even if they're not actually exported.
+ * We use a string pattern that is unlikely to be valid code that the build
+ * system filters out from the preprocessor output (see ksym_dep_filter
+ * in scripts/Kbuild.include).
+ */
+#define __EXPORT_SYMBOL(sym, sec)	=== __KSYM_##sym ===
+
+#elif defined(CONFIG_TRIM_UNUSED_KSYMS)
 
 #include <linux/kconfig.h>
 #include <generated/autoksyms.h>
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8a257fa663..0be7e09ba3 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -258,12 +258,36 @@ if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
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
+# Filter out exported kernel symbol names from the preprocessor output.
+# See also __KSYM_DEPS__ in include/linux/export.h.
+ksym_dep_filter =                                                            \
+	case "$(1)" in                                                       \
+	cc_*_c) $(CPP) $(c_flags) -D__KSYM_DEPS__ $< ;;                      \
+	as_*_S) $(CPP) $(a_flags) -D__KSYM_DEPS__ $< ;;                      \
+	cpp_lds_S) : ;;                                                      \
+	*) echo "Don't know how to preprocess $(1)"; false ;;                \
+	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
+	
+cmd_and_fixdep =                                                             \
+	$(echo-cmd) $(cmd_$(1));                                             \
+	$(ksym_dep_filter) |                                                 \
+		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
+			> $(dot-target).tmp;	                             \
+	rm -f $(depfile);                                                    \
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

