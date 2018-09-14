Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725198AbeIOEKu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Sep 2018 00:10:50 -0400
Date: Fri, 14 Sep 2018 18:54:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [GIT PULL] tracing/Makefile: Fix handling redefinition of
 CC_FLAGS_FTRACE
Message-ID: <20180914185416.5321e0f4@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>, Michal Marek <michal.lkml@markovi.net>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kbuild@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>


Linus,

This fixes an issue with the build system caused by a change that
modifies CC_FLAGS_FTRACE. The issue is that it breaks the dependencies
and causes "make targz-pkg" to rebuild the entire world.


Please pull the latest trace-v4.19-rc3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git
trace-v4.19-rc3

Tag SHA1: f1da41d2d7997791e929e804b646dffd0765e677
Head SHA1: b1f4ff74fcb0e82664e8633cc225c2ad4234878a


Paulo Zanoni (1):
      tracing/Makefile: Fix handling redefinition of CC_FLAGS_FTRACE

----
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
---------------------------
commit b1f4ff74fcb0e82664e8633cc225c2ad4234878a
Author: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date:   Mon Sep 10 10:59:56 2018 -0700

    tracing/Makefile: Fix handling redefinition of CC_FLAGS_FTRACE
    
    As a Kernel developer, I make heavy use of "make targz-pkg" in order
    to locally compile and remotely install my development Kernels. The
    nice feature I rely on is that after a normal "make", "make targz-pkg"
    only generates the tarball without having to recompile everything.
    
    That was true until commit f28bc3c32c05 ("tracing: Handle
    CC_FLAGS_FTRACE more accurately"). After it, running "make targz-pkg"
    after "make" will recompile the whole Kernel tree, making my
    development workflow much slower.
    
    The Kernel is choosing to recompile everything because it claims the
    command line has changed. A diff of the .cmd files show a repeated
    -mfentry in one of the files. That is because "make targz-pkg" calls
    "make modules_install" and the environment is already populated with
    the exported variables, CC_FLAGS_FTRACE being one of them. Then,
    -mfentry gets duplicated because it is not protected behind an ifndef
    block, like -pg.
    
    To complicate the problem a little bit more, architectures can define
    their own version CC_FLAGS_FTRACE, so our code not only has to
    consider recursive Makefiles, but also architecture overrides.
    
    So in this patch we move CC_FLAGS_FTRACE up and unconditionally
    define it to -pg. Then we let the architecture Makefiles possibly
    override it, and finally append the extra options later. This ensures
    the variable is always fully redefined at each invocation so recursive
    Makefiles don't keep appending, and hopefully it maintains the
    intended behavior on how architectures can override the defaults..
    
    Thanks Steven Rostedt and Vasily Gorbik for the help on this
    regression.
    
    Cc: Michal Marek <michal.lkml@markovi.net>
    Cc: Ingo Molnar <mingo@redhat.com>
    Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
    Cc: linux-kbuild@vger.kernel.org
    Fixes: commit f28bc3c32c05 ("tracing: Handle CC_FLAGS_FTRACE more accurately")
    Acked-by: Vasily Gorbik <gor@linux.ibm.com>
    Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

diff --git a/Makefile b/Makefile
index 4d5c883a98e5..a5ef6818157a 100644
--- a/Makefile
+++ b/Makefile
@@ -616,6 +616,11 @@ CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage \
 	$(call cc-disable-warning,maybe-uninitialized,)
 export CFLAGS_GCOV
 
+# The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
+ifdef CONFIG_FUNCTION_TRACER
+  CC_FLAGS_FTRACE := -pg
+endif
+
 # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
 # values of the respective KBUILD_* variables
 ARCH_CPPFLAGS :=
@@ -755,9 +760,6 @@ KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
 endif
 
 ifdef CONFIG_FUNCTION_TRACER
-ifndef CC_FLAGS_FTRACE
-CC_FLAGS_FTRACE := -pg
-endif
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
   # gcc 5 supports generating the mcount tables directly
   ifeq ($(call cc-option-yn,-mrecord-mcount),y)
