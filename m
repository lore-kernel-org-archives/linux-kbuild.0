Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:52268 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751003AbdESLm6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 May 2017 07:42:58 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3] kbuild: simplify silent build (-s) detection
Date: Fri, 19 May 2017 20:42:30 +0900
Message-Id: <1495194150-14016-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, Wang Nan <wangnan0@huawei.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Jiri Olsa <jolsa@redhat.com>

This allows to detect -s (--silent) option without checking GNU Make
version.

As commit e36aaea28972 ("kbuild: Fix silent builds with make-4")
pointed out, GNU Make 4.x changed the way/order it presents the
command line options into MAKEFLAGS.

In Make 3.8x, 's' is always be the first in a group of short options.
The group may be prefixed with '-' in some cases.

In Make 4.x, 's' is always the last in a group of short options.

As commit e6ac89fabd03 ("kbuild: Correctly deal with make options
which contain an 's'") addressed, we also need to deal with long
options that contain 's', like --warn-undefined-variables.

Test cases:

[1] command line input:    make --silent
     -> MAKEFLAGS for Make 3.8x:    s
     -> MAKEFLAGS for Make 4.x :    s

[2] command line input:    make -srR
     -> MAKEFLAGS for Make 3.8x:    sRr
     -> MAKEFLAGS for Make 4.x :    rRs

[3] command line input:    make -s -rR --warn-undefined-variables
     -> MAKEFLAGS for Make 3.8x:    --warn-undefined-variables -sRr
     -> MAKEFLAGS for Make 4.x :    rRs --warn-undefined-variables

The idea to cater to all the cases more easily is to filter out long
options (--%), then search 's' with $(findstring ...).  This way will
be more future-proof even if Make 5.x decides to put 's' in the middle
of the group.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - Even simpler way that works in any order.

Changes in v2:
  - Fix makefiles under tools as well

 Makefile                       | 9 +--------
 tools/build/Makefile.build     | 8 +-------
 tools/scripts/Makefile.include | 8 +-------
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index b1ee4a49efa2..e4da5a0ccf97 100644
--- a/Makefile
+++ b/Makefile
@@ -84,17 +84,10 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands
 
-ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
-ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
   quiet=silent_
   tools_silent=s
 endif
-else					# make-3.8x
-ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
-  quiet=silent_
-  tools_silent=-s
-endif
-endif
 
 export quiet Q KBUILD_VERBOSE
 
diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
index e279a71c650d..c46b20e4ad87 100644
--- a/tools/build/Makefile.build
+++ b/tools/build/Makefile.build
@@ -19,15 +19,9 @@ else
   Q=@
 endif
 
-ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
-ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
   quiet=silent_
 endif
-else					# make-3.8x
-ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
-  quiet=silent_
-endif
-endif
 
 build-dir := $(srctree)/tools/build
 
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index fc74db62fef4..ccad8ce925e4 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -58,15 +58,9 @@ else
 NO_SUBDIR = :
 endif
 
-ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
-ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
   silent=1
 endif
-else					# make-3.8x
-ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
-  silent=1
-endif
-endif
 
 #
 # Define a callable command for descending to a new directory
-- 
2.7.4

