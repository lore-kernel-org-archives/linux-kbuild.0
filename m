Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45081 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387476AbfDJPvH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Apr 2019 11:51:07 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH v3 1/9] livepatch: Create and include UAPI headers
Date: Wed, 10 Apr 2019 11:50:50 -0400
Message-Id: <20190410155058.9437-2-joe.lawrence@redhat.com>
In-Reply-To: <20190410155058.9437-1-joe.lawrence@redhat.com>
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

From: Josh Poimboeuf <jpoimboe@redhat.com>

Define klp prefixes in include/uapi/linux/livepatch.h, and use them for
replacing hard-coded values in kernel/livepatch/core.c.

Update MAINTAINERS.

Note: Add defines to uapi as these are also to be used by a newly
introduced klp-convert script.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Joao Moreira <jmoreira@suse.de>
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 MAINTAINERS                    |  1 +
 include/linux/livepatch.h      |  1 +
 include/uapi/linux/livepatch.h | 17 +++++++++++++++++
 kernel/livepatch/core.c        |  4 ++--
 4 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/linux/livepatch.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2359e12e4c41..65b4e8f481f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9017,6 +9017,7 @@ R:	Joe Lawrence <joe.lawrence@redhat.com>
 S:	Maintained
 F:	kernel/livepatch/
 F:	include/linux/livepatch.h
+F:	include/uapi/linux/livepatch.h
 F:	arch/x86/include/asm/livepatch.h
 F:	arch/x86/kernel/livepatch.c
 F:	Documentation/livepatch/
diff --git a/include/linux/livepatch.h b/include/linux/livepatch.h
index 53551f470722..16b48e8b29a2 100644
--- a/include/linux/livepatch.h
+++ b/include/linux/livepatch.h
@@ -25,6 +25,7 @@
 #include <linux/ftrace.h>
 #include <linux/completion.h>
 #include <linux/list.h>
+#include <uapi/linux/livepatch.h>
 
 #if IS_ENABLED(CONFIG_LIVEPATCH)
 
diff --git a/include/uapi/linux/livepatch.h b/include/uapi/linux/livepatch.h
new file mode 100644
index 000000000000..bb86243de805
--- /dev/null
+++ b/include/uapi/linux/livepatch.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * livepatch.h - Kernel Live Patching Core
+ *
+ * Copyright (C) 2016 Josh Poimboeuf <jpoimboe@redhat.com>
+ */
+
+#ifndef _UAPI_LIVEPATCH_H
+#define _UAPI_LIVEPATCH_H
+
+#include <linux/types.h>
+
+#define KLP_RELA_PREFIX		".klp.rela."
+#define KLP_SYM_PREFIX		".klp.sym."
+
+#endif /* _UAPI_LIVEPATCH_H */
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index eb0ee10a1981..3d9ed895b252 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -235,7 +235,7 @@ static int klp_resolve_symbols(Elf_Shdr *relasec, struct module *pmod)
 
 		/* Format: .klp.sym.objname.symname,sympos */
 		cnt = sscanf(strtab + sym->st_name,
-			     ".klp.sym.%55[^.].%127[^,],%lu",
+			     KLP_SYM_PREFIX "%55[^.].%127[^,],%lu",
 			     objname, symname, &sympos);
 		if (cnt != 3) {
 			pr_err("symbol %s has an incorrectly formatted name\n",
@@ -281,7 +281,7 @@ static int klp_write_object_relocations(struct module *pmod,
 		 * See comment in klp_resolve_symbols() for an explanation
 		 * of the selected field width value.
 		 */
-		cnt = sscanf(secname, ".klp.rela.%55[^.]", sec_objname);
+		cnt = sscanf(secname, KLP_RELA_PREFIX "%55[^.]", sec_objname);
 		if (cnt != 1) {
 			pr_err("section %s has an incorrectly formatted name\n",
 			       secname);
-- 
2.20.1
