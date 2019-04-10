Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:8874 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387507AbfDJPvR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Apr 2019 11:51:17 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH v3 8/9] documentation: Update on livepatch elf format
Date: Wed, 10 Apr 2019 11:50:57 -0400
Message-Id: <20190410155058.9437-9-joe.lawrence@redhat.com>
In-Reply-To: <20190410155058.9437-1-joe.lawrence@redhat.com>
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Miroslav Benes <mbenes@suse.cz>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

From: Joao Moreira <jmoreira@suse.de>

Add a section to Documentation/livepatch/module-elf-format.txt
describing how klp-convert works for fixing relocations.

Signed-off-by: Joao Moreira <jmoreira@suse.de>
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 Documentation/livepatch/livepatch.txt         |  3 ++
 Documentation/livepatch/module-elf-format.txt | 50 ++++++++++++++++---
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/livepatch/livepatch.txt b/Documentation/livepatch/livepatch.txt
index 4627b41ff02e..873c11aee038 100644
--- a/Documentation/livepatch/livepatch.txt
+++ b/Documentation/livepatch/livepatch.txt
@@ -274,6 +274,9 @@ into three levels:
     absolute position in the database, but rather the order it has been found
     only for a particular object ( vmlinux or a kernel module ). Note that
     kallsyms allows for searching symbols according to the object name.
+    Uniquely named symbols may use a symbol position of 0.  Non-unique
+    symbols need to specify their object / kallsyms position, starting
+    at position 1.
 
   + struct klp_object defines an array of patched functions (struct
     klp_func) in the same object. Where the object is either vmlinux
diff --git a/Documentation/livepatch/module-elf-format.txt b/Documentation/livepatch/module-elf-format.txt
index f21a5289a09c..7bef8432352a 100644
--- a/Documentation/livepatch/module-elf-format.txt
+++ b/Documentation/livepatch/module-elf-format.txt
@@ -2,7 +2,8 @@
 Livepatch module Elf format
 ===========================
 
-This document outlines the Elf format requirements that livepatch modules must follow.
+This document outlines the Elf format requirements that livepatch modules must
+follow.
 
 -----------------
 Table of Contents
@@ -25,8 +26,9 @@ Table of Contents
        3.3.2 Required name format
        3.3.3 Example livepatch symbol names
        3.3.4 Example `readelf --symbols` output
-4. Architecture-specific sections
-5. Symbol table and Elf section access
+4. Automatic conversion of unresolved relocations
+5. Architecture-specific sections
+6. Symbol table and Elf section access
 
 ----------------------------
 0. Background and motivation
@@ -270,7 +272,8 @@ Livepatch symbol names must conform to the following format:
 [D] The position of the symbol in the object (as according to kallsyms)
     This is used to differentiate duplicate symbols within the same
     object. The symbol position is expressed numerically (0, 1, 2...).
-    The symbol position of a unique symbol is 0.
+    The symbol position of a unique symbol is 0.  The symbol position of
+    the first non-unique symbol is 1, the second is 2, etc.
 
 3.3.3 Example livepatch symbol names:
 -------------------------------------
@@ -293,8 +296,43 @@ Symbol table '.symtab' contains 127 entries:
 [*] Note that the 'Ndx' (Section index) for these symbols is SHN_LIVEPATCH (0xff20).
     "OS" means OS-specific.
 
+--------------------------------------------------
+4.  Automatic conversion of unresolved relocations
+--------------------------------------------------
+Sometimes livepatches may operate on symbols which are not self-contained nor
+exported. When this happens, these symbols remain unresolved in the elf object
+and will trigger an error during the livepatch instantiation.
+
+Whenever possible, the kernel building infrastructure solves this problem
+automatically. First, a symbol database containing information on all compiled
+objects is built. Second, this database - a file named Symbols.list, placed in
+the kernel source root directory - is used to identify targets for unresolved
+relocations, converting them in the livepatch elf accordingly to the
+specifications above-described. While the first stage is fully handled by the
+building system, the second is done by a tool called klp-convert, which can be
+found in "scripts/livepatch".
+
+When an unresolved relocation has as target a symbol whose name is also used by
+different symbols throughout the kernel, the relocation cannot be resolved
+automatically. In these cases, the livepatch developer must add annotations to
+the livepatch, making it possible for the system to identify which is the
+correct target amongst multiple homonymous symbols. Such annotations must be
+done through a data structure as follows:
+
+struct KLP_MODULE_RELOC(object) data_structure_name[] = {
+	KLP_SYMPOS(symbol, pos)
+};
+
+In the above example, object refers to the object file which contains the
+symbol, being vmlinux or a module; symbol refers to the symbol name that will
+be relocated and pos is its position in the object.
+
+When a data structure like this is added to the livepatch, the resulting elf
+will hold symbols that will be identified by klp-convert and used to solve name
+ambiguities.
+
 ---------------------------------
-4. Architecture-specific sections
+5. Architecture-specific sections
 ---------------------------------
 Architectures may override arch_klp_init_object_loaded() to perform
 additional arch-specific tasks when a target module loads, such as applying
@@ -305,7 +343,7 @@ be easily identified when iterating through a patch module's Elf sections
 (See arch/x86/kernel/livepatch.c for a complete example).
 
 --------------------------------------
-5. Symbol table and Elf section access
+6. Symbol table and Elf section access
 --------------------------------------
 A livepatch module's symbol table is accessible through module->symtab.
 
-- 
2.20.1
