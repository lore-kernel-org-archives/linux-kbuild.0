Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:52640 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751499AbbEFSYC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 May 2015 14:24:02 -0400
Message-Id: <20150506182359.053170180@goodmis.org>
Date: Wed, 06 May 2015 14:18:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC][PATCH 1/2] syscalls.h: Make SyS_foo() declaration static
References: <20150506181831.145849116@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=0001-syscalls.h-Make-SyS_foo-declaration-static.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Borislav Petkov <bp@alien8.de>, Christian Borntraeger <borntraeger@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Sergei Trofimovich <slyfox@gentoo.org>

From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>

Nothing should call the syscall wrapper alias (SyS_foo) directly.
It is only used to force the system call to sign extend its arguments.
See commit 1a94bc34768e "System call wrapper infrastructure".

By declaring it static, we can also remove the protoype that was
added by commit f9597f24c089 "syscalls.h: add forward declarations for
inplace syscall wrappers", that fixed the warnings that were generated
because the call was not static.

Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Sergei Trofimovich <slyfox@gentoo.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/syscalls.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 76d1e38aabe1..f8e5b696670c 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -195,8 +195,7 @@ extern struct trace_event_functions exit_syscall_print_funcs;
 	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
 		__attribute__((alias(__stringify(SyS##name))));		\
 	static inline long SYSC##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
-	asmlinkage long SyS##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
-	asmlinkage long SyS##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
+	asmlinkage static long SyS##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
 	{								\
 		long ret = SYSC##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
 		__MAP(x,__SC_TEST,__VA_ARGS__);				\
-- 
2.1.4


