Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:64769 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfKNRmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:37 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/6] modpost: do not set ->preloaded for symbols from Module.symvers
Date: Fri, 15 Nov 2019 02:42:25 +0900
Message-Id: <20191114174226.7201-5-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now that there is no overwrap between symbols from ELF files and
ones from Module.symvers.

So, the 'exported twice' warning should be reported irrespective
of where the symbol in question came from.

The exceptional case is external module; in some cases, we build
an external module to provide a different version/variant of the
corresponding in-kernel module, overriding the same set of exported
symbols.

You can see this use-case in upstream; tools/testing/nvdimm/libnvdimm.ko
replaces drivers/nvdimm/libnvdimm.ko in order to link it against mocked
version of core kernel symbols.

So, let's relax the 'exported twice' warning when building external
modules. The multiple export from external modules is warned only
when the previous one is from vmlinux or itself.

With this refactoring, the ugly preloading goes away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 73bdf27c41fe..06086105011f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -169,7 +169,6 @@ struct symbol {
 	unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
 	unsigned int kernel:1;     /* 1 if symbol is from kernel
 				    *  (only for external modules) **/
-	unsigned int preloaded:1;  /* 1 if symbol from Module.symvers */
 	unsigned int is_static:1;  /* 1 if symbol is not global */
 	enum export  export;       /* Type of export */
 	char name[0];
@@ -394,7 +393,8 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	if (!s) {
 		s = new_symbol(name, mod, export);
 	} else {
-		if (!s->preloaded) {
+		if (!external_module || is_vmlinux(s->module->name) ||
+		    s->module == mod) {
 			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
 			     mod->name, name, s->module->name,
 			     is_vmlinux(s->module->name) ? "" : ".ko");
@@ -403,7 +403,6 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 			s->module = mod;
 		}
 	}
-	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
 	s->export    = export;
@@ -2480,7 +2479,6 @@ static void read_dump(const char *fname, unsigned int kernel)
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
 		s->kernel    = kernel;
-		s->preloaded = 1;
 		s->is_static = 0;
 		sym_set_crc(symname, mod, crc);
 		sym_update_namespace(symname, namespace);
-- 
2.17.1
