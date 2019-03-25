Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59630 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728991AbfCYQE4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Mar 2019 12:04:56 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH] kbuild: strip whitespace in cmd_record_mcount findstring
Date: Mon, 25 Mar 2019 12:04:38 -0400
Message-Id: <20190325160438.8982-1-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

CC_FLAGS_FTRACE may contain trailing whitespace that interferes with
findstring.

For example, commit 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on
GCC 4.9 and newer") introduced a change such that on my ppc64le box,
CC_FLAGS_FTRACE="-pg -mprofile-kernel ".  (Note the trailing space.)
When cmd_record_mcount is now invoked, findstring fails as the ftrace
flags were found at very end of _c_flags, without the trailing space.

  _c_flags=" ... -pg -mprofile-kernel"
  CC_FLAGS_FTRACE="-pg -mprofile-kernel "
                                       ^
    findstring is looking for this extra space

Remove the redundant whitespaces from CC_FLAGS_FTRACE in
cmd_record_mcount to avoid this problem.

Fixes: 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on GCC 4.9 and newer").
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---

Standard disclaimer: I'm not a kbuild expert, but this works around the
problem I reported where ftrace and livepatch self-tests were failing as
specified object files were not run through the recordmcount.pl script:

ppc64le: ftrace self-tests and $(CC_FLAGS_FTRACE) broken?
https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-March/187298.html

 scripts/Makefile.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2554a15ecf2b..74d402b5aa3c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -199,10 +199,10 @@ sub_cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(part-of-module),1,0)" "$(@)";
 recordmcount_source := $(srctree)/scripts/recordmcount.pl
 endif # BUILD_C_RECORDMCOUNT
-cmd_record_mcount =						\
-	if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =	\
-	     "$(CC_FLAGS_FTRACE)" ]; then			\
-		$(sub_cmd_record_mcount)			\
+cmd_record_mcount =							\
+	if [ "$(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags))" =	\
+	     "$(strip $(CC_FLAGS_FTRACE))" ]; then			\
+		$(sub_cmd_record_mcount)				\
 	fi
 endif # CC_USING_RECORD_MCOUNT
 endif # CONFIG_FTRACE_MCOUNT_RECORD
-- 
2.20.1
