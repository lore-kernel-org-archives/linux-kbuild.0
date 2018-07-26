Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:60869 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbeGZJar (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 05:30:47 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [stable 4.4] turn off -Wattribute-alias
Date: Thu, 26 Jul 2018 10:13:24 +0200
Message-Id: <20180726081358.3829157-3-arnd@arndb.de>
In-Reply-To: <20180726081358.3829157-1-arnd@arndb.de>
References: <20180726081358.3829157-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: stable@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: gregkh@linuxfoundation.org, Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Starting with gcc-8.1, we get a warning about all system call definitions,
which use an alias between functions with incompatible prototypes, e.g.:

In file included from ../mm/process_vm_access.c:19:
../include/linux/syscalls.h:211:18: warning: 'sys_process_vm_readv' alias between functions of incompatible types 'long int(pid_t,  const struct iovec *, long unsigned int,  const struct iovec *, long unsigned int,  long unsigned int)' {aka 'long int(int,  const struct iovec *, long unsigned int,  const struct iovec *, long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
  asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
                  ^~~
../include/linux/syscalls.h:207:2: note: in expansion of macro '__SYSCALL_DEFINEx'
  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
  ^~~~~~~~~~~~~~~~~
../include/linux/syscalls.h:201:36: note: in expansion of macro 'SYSCALL_DEFINEx'
 #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
                                    ^~~~~~~~~~~~~~~
../mm/process_vm_access.c:300:1: note: in expansion of macro 'SYSCALL_DEFINE6'
 SYSCALL_DEFINE6(process_vm_readv, pid_t, pid, const struct iovec __user *, lvec,
 ^~~~~~~~~~~~~~~
../include/linux/syscalls.h:215:18: note: aliased declaration here
  asmlinkage long SyS##name(__MAP(x,__SC_LONG,__VA_ARGS__)) \
                  ^~~
../include/linux/syscalls.h:207:2: note: in expansion of macro '__SYSCALL_DEFINEx'
  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
  ^~~~~~~~~~~~~~~~~
../include/linux/syscalls.h:201:36: note: in expansion of macro 'SYSCALL_DEFINEx'
 #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
                                    ^~~~~~~~~~~~~~~
../mm/process_vm_access.c:300:1: note: in expansion of macro 'SYSCALL_DEFINE6'
 SYSCALL_DEFINE6(process_vm_readv, pid_t, pid, const struct iovec __user *, lvec,

This is really noisy and does not indicate a real problem. In the latest
mainline kernel, this was addressed by commit bee20031772a ("disable
-Wattribute-alias warning for SYSCALL_DEFINEx()"), which seems too invasive
to backport.

This takes a much simpler approach and just disables the warning across the
kernel.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 54690fee0485..4812b35df210 100644
--- a/Makefile
+++ b/Makefile
@@ -624,6 +624,7 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, int-in-bool-context)
+KBUILD_CFLAGS	+= $(call cc-disable-warning, attribute-alias)
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS	+= -Os
-- 
2.18.0

