Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:33927 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJ2Min (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 08:38:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] modpost: do not invoke extra modpost for nsdeps
Date: Tue, 29 Oct 2019 21:38:06 +0900
Message-Id: <20191029123809.29301-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191029123809.29301-1-yamada.masahiro@socionext.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

'make nsdeps' invokes the modpost three times at most; before linking
vmlinux, before building modules, and finally for generating .ns_deps
files. Running the modpost again and again is annoying.

The last two can be unified. When the -d option is given, the modpost
still does the usual job, and in addition, generates .ns_deps files.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                 | 5 ++---
 scripts/Makefile.modpost | 8 +++-----
 scripts/mod/modpost.c    | 9 ++-------
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 4f4d8979bfce..0ef897fd9cfd 100644
--- a/Makefile
+++ b/Makefile
@@ -1682,10 +1682,9 @@ tags TAGS cscope gtags: FORCE
 # ---------------------------------------------------------------------------
 
 PHONY += nsdeps
-
+nsdeps: export KBUILD_NSDEPS=1
 nsdeps: modules
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost nsdeps
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/$@
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
 
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 01c0a992d293..c9757b20b048 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -53,8 +53,7 @@ MODPOST = scripts/mod/modpost						\
 	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))	\
 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))			\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)			\
-	$(if $(KBUILD_MODPOST_WARN),-w)					\
-	$(if $(filter nsdeps,$(MAKECMDGOALS)),-d)
+	$(if $(KBUILD_MODPOST_WARN),-w)
 
 ifdef MODPOST_VMLINUX
 
@@ -66,7 +65,8 @@ __modpost:
 
 else
 
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T -
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
+	$(if $(KBUILD_NSDEPS),-d)
 
 ifeq ($(KBUILD_EXTMOD),)
 MODPOST += $(wildcard vmlinux)
@@ -97,8 +97,6 @@ ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
 endif
 
-nsdeps: __modpost
-
 endif
 
 .PHONY: $(PHONY)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 26ba97245576..dcd90d563ce8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2221,8 +2221,7 @@ static int check_exports(struct module *mod)
 			add_namespace(&mod->required_namespaces,
 				      exp->namespace);
 
-			if (!write_namespace_deps &&
-			    !module_imports_namespace(mod, exp->namespace)) {
+			if (!module_imports_namespace(mod, exp->namespace)) {
 				warn("module %s uses symbol %s from namespace %s, but does not import it.\n",
 				     basename, exp->name, exp->namespace);
 			}
@@ -2641,8 +2640,6 @@ int main(int argc, char **argv)
 
 		err |= check_modname_len(mod);
 		err |= check_exports(mod);
-		if (write_namespace_deps)
-			continue;
 
 		add_header(&buf, mod);
 		add_intree_flag(&buf, !external_module);
@@ -2657,10 +2654,8 @@ int main(int argc, char **argv)
 		write_if_changed(&buf, fname);
 	}
 
-	if (write_namespace_deps) {
+	if (write_namespace_deps)
 		write_namespace_deps_files();
-		return 0;
-	}
 
 	if (dump_write)
 		write_dump(dump_write);
-- 
2.17.1
