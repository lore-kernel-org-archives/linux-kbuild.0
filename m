Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4CFD1B34020000780002625B@vpn.id2.novell.com>
Date: Mon, 06 Dec 2010 16:19:48 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] allow exception table to be put in .rodata
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

... and actually do so for x86.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 arch/x86/kernel/vmlinux.lds.S     |    5 +++--
 include/asm-generic/vmlinux.lds.h |    5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

--- linux-2.6.37-rc4/arch/x86/kernel/vmlinux.lds.S
+++ 2.6.37-rc4-extable-in-rodata/arch/x86/kernel/vmlinux.lds.S
@@ -20,6 +20,8 @@
 #define LOAD_OFFSET __START_KERNEL_map
 #endif
 
+#define EXCEPTION_TABLE_RO EXCEPTION_TABLE(16)
+
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/asm-offsets.h>
 #include <asm/thread_info.h>
@@ -113,8 +115,7 @@ SECTIONS
 	} :text = 0x9090
 
 	NOTES :text :note
-
-	EXCEPTION_TABLE(16) :text = 0x9090
+	text_continues : {} :text /* switch back to regular text... */
 
 	X64_ALIGN_DEBUG_RODATA_BEGIN
 	RO_DATA(PAGE_SIZE)
--- linux-2.6.37-rc4/include/asm-generic/vmlinux.lds.h
+++ 2.6.37-rc4-extable-in-rodata/include/asm-generic/vmlinux.lds.h
@@ -219,6 +219,7 @@
 		*(.rodata1)						\
 	}								\
 									\
+	EXCEPTION_TABLE_RO						\
 	BUG_TABLE							\
 									\
 	JUMP_TABLE							\
@@ -439,6 +440,10 @@
 		VMLINUX_SYMBOL(__stop___ex_table) = .;			\
 	}
 
+#ifndef EXCEPTION_TABLE_RO
+#define EXCEPTION_TABLE_RO
+#endif
+
 /*
  * Init task
  */



