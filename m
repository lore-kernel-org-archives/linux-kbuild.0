Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay.parallels.com ([195.214.232.42]:44543 "EHLO
	relay.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757189AbbLCPuE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Dec 2015 10:50:04 -0500
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: [PATCH v4 0/3] UBSAN: run-time undefined behavior sanity checker
Date: Thu, 3 Dec 2015 18:50:04 +0300
Message-ID: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

UBSAN is run-time undefined behaviour checker. It uses compile-time
instrumentation to catch undefined behavior (UB). Compiler inserts code
that perform certain kinds of checks before operations that could cause UB.
If check fails (i.e. UB detected) __ubsan_handle_* function called to print error message.


Changes since v3:
   - Fixed build failure/warnings reported by kbuild robot.
   - Fixed typo per Sasha.

Changes since V2:
   - Dropped -fsanitize=nonnull-attribute. It checks whether null values
     are not passed to arguments marked as requiring a non-null value by
     the "nonnull" function attribute.

     We don't have much functions with such attribute (early_shadow_write() in arch/blackfin
     and GCC builtin functions: memcpy, memset, memmove, etc). Some kernel code deliberately
     passes NULL-ptr with 0-length to mem*(). This should be fine since we compile kernel
     with -fno-delete-null-pointer-checks. And NULL-ptr with != 0 length will just crash.
     So this options is useless in kernel since it produces only false positives.
     See also: http://thread.gmane.org/gmane.linux.kernel/1810656
       

   - Also dropped enabling/disabling various checkers via boot cmdline.
     Boot time flag only disable reports, it can't disable compile-time code instrumentation.
     Thus, if we ever will need to disable some checker it would be better to
     do it in compile time via Kconfig option.

   - Alignment checks produce too much noise if CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set.
      Since there is no boottime option to disable alignment checks, CONFIG_UBSAN_ALIGNMENT
      was added. It's off by default if CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set.
   
   - Couple other small misc changes/fixes.



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


Andrey Ryabinin (3):
  kernel: printk: specify alignment for struct printk_log
  mac80211: Prevent build failure with CONFIG_UBSAN=y
  UBSAN: run-time undefined behavior sanity checker

 Documentation/ubsan.txt               |  84 +++++++
 Makefile                              |   3 +-
 arch/x86/Kconfig                      |   1 +
 arch/x86/boot/Makefile                |   1 +
 arch/x86/boot/compressed/Makefile     |   1 +
 arch/x86/entry/vdso/Makefile          |   1 +
 arch/x86/realmode/rm/Makefile         |   1 +
 drivers/firmware/efi/libstub/Makefile |   1 +
 include/linux/sched.h                 |   3 +
 kernel/printk/printk.c                |  10 +-
 lib/Kconfig.debug                     |   1 +
 lib/Kconfig.ubsan                     |  29 +++
 lib/Makefile                          |   3 +
 lib/ubsan.c                           | 456 ++++++++++++++++++++++++++++++++++
 lib/ubsan.h                           |  84 +++++++
 mm/kasan/Makefile                     |   1 +
 net/mac80211/debugfs.c                |   7 +-
 scripts/Makefile.lib                  |   6 +
 scripts/Makefile.ubsan                |  18 ++
 19 files changed, 700 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/ubsan.txt
 create mode 100644 lib/Kconfig.ubsan
 create mode 100644 lib/ubsan.c
 create mode 100644 lib/ubsan.h
 create mode 100644 scripts/Makefile.ubsan

-- 
2.4.10

