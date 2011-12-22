Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:11720 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273Ab1LVPw5 convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Thu, 22 Dec 2011 10:52:57 -0500
Message-Id: <4EF3609D0200007800069A30@nat28.tlf.novell.com>
Date: Thu, 22 Dec 2011 15:53:49 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] consolidate WARN_...ONCE() static variables
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Due to the alignment of following variables, these typically consume
more than just the single byte that 'bool' requires, and as there are
a few hundred instances, the cache pollution (not so much the waste of
memory) sums op. Put these variables into their own section, outside
of half way frequently used memory range.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

---
 include/asm-generic/bug.h         |    6 +++---
 include/asm-generic/vmlinux.lds.h |    1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

--- 3.2-rc6/include/asm-generic/bug.h
+++ 3.2-rc6-warn-once-flag-cold/include/asm-generic/bug.h
@@ -134,7 +134,7 @@ extern void warn_slowpath_null(const cha
 #endif
 
 #define WARN_ON_ONCE(condition)	({				\
-	static bool __warned;					\
+	static bool __section(.data.unlikely) __warned;		\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once))				\
@@ -144,7 +144,7 @@ extern void warn_slowpath_null(const cha
 })
 
 #define WARN_ONCE(condition, format...)	({			\
-	static bool __warned;					\
+	static bool __section(.data.unlikely) __warned;		\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once))				\
@@ -154,7 +154,7 @@ extern void warn_slowpath_null(const cha
 })
 
 #define WARN_TAINT_ONCE(condition, taint, format...)	({	\
-	static bool __warned;					\
+	static bool __section(.data.unlikely) __warned;		\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once))				\
--- 3.2-rc6/include/asm-generic/vmlinux.lds.h
+++ 3.2-rc6-warn-once-flag-cold/include/asm-generic/vmlinux.lds.h
@@ -167,6 +167,7 @@
 	CPU_KEEP(exit.data)						\
 	MEM_KEEP(init.data)						\
 	MEM_KEEP(exit.data)						\
+	*(.data.unlikely)						\
 	STRUCT_ALIGN();							\
 	*(__tracepoints)						\
 	/* implement dynamic printk debug */				\



