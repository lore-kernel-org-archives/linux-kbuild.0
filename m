Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34676 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753290AbaJTK5G (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Oct 2014 06:57:06 -0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [RFC] UBSan: run-time undefined behavior sanity checker
Date: Mon, 20 Oct 2014 14:54:58 +0400
Message-id: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michal Marek <mmarek@suse.cz>, Sasha Levin <sasha.levin@oracle.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrey Ryabinin <a.ryabinin@samsung.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>

Hi

This is yet another sanitizer for linux kernel.

UBSan uses copile-time instumentation to catch undefined behavior (UB).
Compiler inserts code that perform certain kinds of
checks before operations that could cause UB.
If check fails (i.e. UB detected) __ubsan_handle_* function called.
to print error message.

Patch is also available via git:
	git://github.com/aryabinin/linux --branch ubsan/v1

GCC supports this since 4.9, however upcoming GCC 5.0 has
more checkers implemented.

Different kinds of checkers could be enabled via boot parameter:
ubsan_handle=OEAINVBSLF.
If ubsan_handle not present in cmdline default options are used: ELNVBSLF

	O - different kinds of overflows
	E - negation overflow, division overflow, division by zero.
	A - misaligned memory access.
	I - load from/store to an object with insufficient space.
	N - null argument declared with nonnull attribute,
		returned null from function which never returns null, null ptr dereference.
	V - variable size array with non-positive length
	B - out-of-bounds memory accesses.
	S - shifting out-of-bounds.
	L - load of invalid value (value out of range for the enum type, loading other then 0/1 to bool type)
	F - call to function through pointer with incorrect function type
		(AFAIK this is not implemented in gcc yet, probably works with clang,
		though I didn't check it).


Andrey Ryabinin (1):
  UBSan: run-time undefined behavior sanity checker

 Makefile                              |  12 +-
 arch/x86/Kconfig                      |   1 +
 arch/x86/boot/Makefile                |   1 +
 arch/x86/boot/compressed/Makefile     |   1 +
 arch/x86/realmode/rm/Makefile         |   1 +
 arch/x86/vdso/Makefile                |   2 +
 drivers/firmware/efi/libstub/Makefile |   1 +
 include/linux/sched.h                 |   4 +
 kernel/printk/Makefile                |   1 +
 lib/Kconfig.debug                     |  23 ++
 lib/Makefile                          |   3 +
 lib/ubsan.c                           | 559 ++++++++++++++++++++++++++++++++++
 lib/ubsan.h                           |  84 +++++
 scripts/Makefile.lib                  |   6 +
 14 files changed, 698 insertions(+), 1 deletion(-)
 create mode 100644 lib/ubsan.c
 create mode 100644 lib/ubsan.h

-- 
2.1.2

