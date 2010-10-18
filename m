Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:61192 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755694Ab0JRSxQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Oct 2010 14:53:16 -0400
Subject: [PATCH][GIT PULL] ftrace: Remove recursion between recordmcount
 and scripts/mod/empty
From: Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Mon, 18 Oct 2010 14:53:09 -0400
Message-ID: <1287427989.16971.304.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, Frederic Weisbecker <fweisbec@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>


Ingo,

Please pull the latest tip/perf/recordmcount tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-2.6-trace.git
tip/perf/recordmcount


Steven Rostedt (1):
      ftrace: Remove recursion between recordmcount and scripts/mod/empty

----
 scripts/Makefile.build |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)
---------------------------
commit 0ae78b8f70eccd69febf70c688d15ae1253303e0
Author: Steven Rostedt <srostedt@redhat.com>
Date:   Mon Oct 18 14:42:00 2010 -0400

    ftrace: Remove recursion between recordmcount and scripts/mod/empty
    
    When DYNAMIC_FTRACE is enabled and we use the C version of recordmcount,
    all objects are run through the recordmcount program to create a
    separate section that stores all the callers of mcount.
    
    The build process has a special file: scripts/mod/empty.o. This is
    built from empty.c which is literally an empty file (except for a
    single comment). This file is used to find information about the target
    elf format, like endianness and word size.
    
    The problem comes up when we need to build recordmcount. The
    build process requires that empty.o is built first. The build rules
    for empty.o will try to execute recordmcount on the empty.o file.
    We get an error that recordmcount does not exist.
    
    To avoid this recursion, the build file will skip running recordmcount
    if the file that it is building is script/mod/empty.o.
    
    Perhaps a new rule is needed, or we may open-code empty.o build.
    
    Reported-by: Ingo Molnar <mingo@elte.hu>
    Tested-by: Ingo Molnar <mingo@elte.hu>
    Cc: Michal Marek <mmarek@suse.cz>
    Cc: linux-kbuild@vger.kernel.org
    Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4db60b2..9f2d5b4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -210,7 +210,11 @@ endif
 
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
 ifdef BUILD_C_RECORDMCOUNT
-cmd_record_mcount = $(objtree)/scripts/recordmcount "$(@)";
+# Due to recursion, we must skip the empty.o file
+#  TBD: Find a better way to do this.
+cmd_record_mcount = if [ $(@) != "scripts/mod/empty.o" ]; then			\
+			$(objtree)/scripts/recordmcount "$(@)";			\
+		    fi;
 else
 cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \


