Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50681 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754140AbaKNMvJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Nov 2014 07:51:09 -0500
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [PATCH v2 0/2] UBSan: run-time undefined behavior sanity checker
Date: Fri, 14 Nov 2014 15:50:44 +0300
Message-id: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrey Ryabinin <a.ryabinin@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

Next spin of UBSan and there are two patches from now.
"Two there should be; no more, no less. One to embody the UBSan,
the other to not deadlock it."

Patches on top of v3.18-rc4. As usual they are available in git:
	git://github.com/aryabinin/linux ubsan/v2

Changes since v1:
   - Refactoring and cleanups in lib/ubsan.c including Sasha's complains.
   - Some spelling fixes from Randy
   - Fixed possible memory corruption on 64 big endian machines, spotted by Rasmus.
   - Links to the relevant GCC documentation added into changelog (Peter).
   - Added documentation.
   - Fix deadlock caused by kernel/printk/printk.c instrumentation
        (patch "kernel: printk: specify alignment for struct printk_log").
   - Dropped useless 'Indirect call of a function through a function pointer of the wrong type'
     checker. GCC doesn't support this, and as clang manual says it's for C++ only.
   - Added checker for __builtin_unreachable() calls.
   - Removed redundant -fno-sanitize=float-cast-overflow from CFLAGS.
   - Added lock to prevent mixing reports.

Andrey Ryabinin (2):
  kernel: printk: specify alignment for struct printk_log
  UBSan: run-time undefined behavior sanity checker

 Documentation/ubsan.txt               |  69 +++++
 Makefile                              |  10 +-
 arch/x86/Kconfig                      |   1 +
 arch/x86/boot/Makefile                |   1 +
 arch/x86/boot/compressed/Makefile     |   1 +
 arch/x86/realmode/rm/Makefile         |   1 +
 arch/x86/vdso/Makefile                |   2 +
 drivers/firmware/efi/libstub/Makefile |   1 +
 include/linux/sched.h                 |   3 +
 kernel/printk/printk.c                |  10 +-
 lib/Kconfig.debug                     |  22 ++
 lib/Makefile                          |   3 +
 lib/ubsan.c                           | 567 ++++++++++++++++++++++++++++++++++
 lib/ubsan.h                           |  84 +++++
 scripts/Makefile.lib                  |   6 +
 15 files changed, 775 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/ubsan.txt
 create mode 100644 lib/ubsan.c
 create mode 100644 lib/ubsan.h

-- 
2.1.3

