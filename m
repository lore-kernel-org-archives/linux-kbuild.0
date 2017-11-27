Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:65529 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752849AbdK0Veg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:36 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 06/21] x86/syscalls: Make x86 syscalls use real prototypes
Date: Mon, 27 Nov 2017 13:34:08 -0800
Message-Id: <20171127213423.27218-7-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

LTO complains very loudly that the x86 syscalls use their own different
prototypes. Switch it to use the real prototypes instead. This requires
adding a few extra prototypes to asm/syscalls.h.

This is a generic cleanup, useful even without LTO.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/entry/syscall_32.c     | 13 +++++--------
 arch/x86/entry/syscall_64.c     | 13 +++++--------
 arch/x86/include/asm/syscalls.h | 42 ++++++++++++++++++++++++++++++++++++-----
 3 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/arch/x86/entry/syscall_32.c b/arch/x86/entry/syscall_32.c
index 95c294963612..f7ffd4b100fd 100644
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -6,20 +6,17 @@
 #include <linux/cache.h>
 #include <asm/asm-offsets.h>
 #include <asm/syscall.h>
+#include <linux/syscalls.h>
+#include <asm/syscalls.h>
+#include <asm/sys_ia32.h>
 
-#define __SYSCALL_I386(nr, sym, qual) extern asmlinkage long sym(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long) ;
-#include <asm/syscalls_32.h>
-#undef __SYSCALL_I386
-
-#define __SYSCALL_I386(nr, sym, qual) [nr] = sym,
-
-extern asmlinkage long sys_ni_syscall(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
+#define __SYSCALL_I386(nr, sym, qual) [nr] = (sys_call_ptr_t)sym,
 
 __visible const sys_call_ptr_t ia32_sys_call_table[__NR_syscall_compat_max+1] = {
 	/*
 	 * Smells like a compiler bug -- it doesn't work
 	 * when the & below is removed.
 	 */
-	[0 ... __NR_syscall_compat_max] = &sys_ni_syscall,
+	[0 ... __NR_syscall_compat_max] = (sys_call_ptr_t)&sys_ni_syscall,
 #include <asm/syscalls_32.h>
 };
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index 9c09775e589d..1ccf4cd300a6 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -4,25 +4,22 @@
 #include <linux/linkage.h>
 #include <linux/sys.h>
 #include <linux/cache.h>
+#include <linux/syscalls.h>
+#include <linux/compat.h>
 #include <asm/asm-offsets.h>
 #include <asm/syscall.h>
+#include <asm/syscalls.h>
 
 #define __SYSCALL_64_QUAL_(sym) sym
 #define __SYSCALL_64_QUAL_ptregs(sym) ptregs_##sym
 
-#define __SYSCALL_64(nr, sym, qual) extern asmlinkage long __SYSCALL_64_QUAL_##qual(sym)(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
-#include <asm/syscalls_64.h>
-#undef __SYSCALL_64
-
-#define __SYSCALL_64(nr, sym, qual) [nr] = __SYSCALL_64_QUAL_##qual(sym),
-
-extern long sys_ni_syscall(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
+#define __SYSCALL_64(nr, sym, qual) [nr] = (sys_call_ptr_t)__SYSCALL_64_QUAL_##qual(sym),
 
 asmlinkage const sys_call_ptr_t sys_call_table[__NR_syscall_max+1] = {
 	/*
 	 * Smells like a compiler bug -- it doesn't work
 	 * when the & below is removed.
 	 */
-	[0 ... __NR_syscall_max] = &sys_ni_syscall,
+	[0 ... __NR_syscall_max] = (sys_call_ptr_t)&sys_ni_syscall,
 #include <asm/syscalls_64.h>
 };
diff --git a/arch/x86/include/asm/syscalls.h b/arch/x86/include/asm/syscalls.h
index bad25bb80679..76bf99c8b151 100644
--- a/arch/x86/include/asm/syscalls.h
+++ b/arch/x86/include/asm/syscalls.h
@@ -14,6 +14,7 @@
 #include <linux/linkage.h>
 #include <linux/signal.h>
 #include <linux/types.h>
+#include <linux/compat.h>
 
 /* Common in X86_32 and X86_64 */
 /* kernel/ioport.c */
@@ -30,6 +31,8 @@ asmlinkage long sys_rt_sigreturn(void);
 asmlinkage long sys_set_thread_area(struct user_desc __user *);
 asmlinkage long sys_get_thread_area(struct user_desc __user *);
 
+asmlinkage long sys_arch_prctl(int, unsigned long);
+
 /* X86_32 only */
 #ifdef CONFIG_X86_32
 
@@ -43,13 +46,42 @@ asmlinkage long sys_vm86(unsigned long, unsigned long);
 
 #else /* CONFIG_X86_32 */
 
-/* X86_64 only */
-/* kernel/process_64.c */
-asmlinkage long sys_arch_prctl(int, unsigned long);
-
 /* kernel/sys_x86_64.c */
 asmlinkage long sys_mmap(unsigned long, unsigned long, unsigned long,
 			 unsigned long, unsigned long, unsigned long);
 
-#endif /* CONFIG_X86_32 */
+asmlinkage long ptregs_sys_rt_sigreturn(struct pt_regs *regs);
+asmlinkage long ptregs_sys_fork(struct pt_regs *regs);
+asmlinkage long ptregs_sys_vfork(struct pt_regs *regs);
+asmlinkage long ptregs_sys_execve(const char __user *filename,
+		const char __user *const __user *argv,
+		const char __user *const __user *envp);
+asmlinkage long ptregs_sys_iopl(unsigned int);
+asmlinkage long ptregs_sys_execveat(int dfd, const char __user *filename,
+			const char __user *const __user *argv,
+			const char __user *const __user *envp, int flags);
+asmlinkage long ptregs_sys_clone(unsigned long, unsigned long, int __user *,
+	       int __user *, unsigned long);
+
+#ifdef CONFIG_COMPAT
+asmlinkage long compat_sys_preadv64v2(unsigned long fd,
+	       const struct compat_iovec __user *vec,
+	       unsigned long vlen, loff_t pos, int flags);
+asmlinkage long ptregs_compat_sys_execve(unsigned long dfd,
+		 const char __user *filename,
+		 const compat_uptr_t __user *argv,
+		 const compat_uptr_t __user *envp);
+asmlinkage long ptregs_compat_sys_execveat(int dfd, const char __user *filename,
+		     const compat_uptr_t __user *argv,
+		     const compat_uptr_t __user *envp, int flags);
+asmlinkage long compat_sys_old_getrlimit(unsigned int resource,
+	struct compat_rlimit __user *rlim);
+asmlinkage long stub32_clone(unsigned, unsigned, int __user *,
+	       compat_uptr_t __user *, unsigned);
+#endif
+
+asmlinkage long sys32_x32_rt_sigreturn(void);
+
+
+#endif /* !CONFIG_X86_32 */
 #endif /* _ASM_X86_SYSCALLS_H */
-- 
2.13.6

