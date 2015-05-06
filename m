Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:52668 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751993AbbEFSYG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 May 2015 14:24:06 -0400
Message-Id: <20150506181831.145849116@goodmis.org>
Date: Wed, 06 May 2015 14:18:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC][PATCH 0/2] kallsyms: Nuke the SyS_* aliases
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Borislav Petkov <bp@alien8.de>


This has been on my todo list for some time (years), and it has
annoyed me enough that I finally decided to look at how to handle it.

The issue is the SyS_foo() system call wrapper aliases that represent
each sys_foo() system call. Their purpose is to force a sign extend of
each argument for archs that require it. As I believe that the SyS_foo()
protocol only has a bunch of longs as its arguments that it can not
be a replacement for sys_foo(), otherwise the compiler will complain
about the mismatch arguments. Instead, the real system call is actually
a static inline of SYS_foo() and SyS_foo() calls it by typecasting
each long argument to the proper type that the system call expects.
Then sys_foo() is just aliased to SyS_foo() such that calls to sys_foo()
will really call SyS_foo(), which will do the proper sign extension.

The above pretty much sums up why system calls have those strange
SYSCALL_DEFINEx() macros.

The issue is that SyS_foo() pops up all over the place in kallsyms and
for filtering of functions in the function and function graph tracers.
And with live kernel patching, it may become even more invasive.

Al Viro mentioned nuking this in the past too:

  http://lkml.kernel.org/r/20130510211716.GN25399@ZenIV.linux.org.uk

This series is to nuke it from kallsyms, and that kallsyms_lookup() does
not see it either. That will also take it out of the function tracing
filtering mechanism.

This does not touch the compat_SyS_foo() calls though.

The first patch changes SyS_foo() to static such that nothing outside
the file can reference it.

The second patch changes scripts/kallsyms.c to ignore the SyS_foo()
calls if sys_foo() comes before or after it.

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git
kallsyms

Head SHA1: b2faf7432b822aa9b6e5c01a09f28a26102fdf02


Steven Rostedt (Red Hat) (2):
      syscalls.h: Make SyS_foo() declaration static
      kallsyms: Do not display SyS_foo() syscall aliases in kallsyms

----
 include/linux/syscalls.h |  3 +--
 scripts/kallsyms.c       | 43 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 7 deletions(-)
