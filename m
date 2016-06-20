Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:44272 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752939AbcFTWYi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jun 2016 18:24:38 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH 02/10] kbuild: List libelf-devel as an alternative
Date: Mon, 20 Jun 2016 19:23:22 -0300
Message-Id: <1466461410-13778-3-git-send-email-acme@kernel.org>
In-Reply-To: <1466461410-13778-1-git-send-email-acme@kernel.org>
References: <1466461410-13778-1-git-send-email-acme@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, Jiri Olsa <jolsa@redhat.com>, Michal Marek <mmarek@suse.com>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Jean Delvare <jdelvare@suse.de>

On openSUSE, the libelf development files are in package libelf-devel.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kbuild@vger.kernel.org
Link: http://lkml.kernel.org/n/tip-s8nyk3pyy2927sd7qp7u42oi@git.kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 Makefile                   | 2 +-
 tools/perf/config/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b409076c7c18..4a1fe88d6839 100644
--- a/Makefile
+++ b/Makefile
@@ -1038,7 +1038,7 @@ ifdef CONFIG_STACK_VALIDATION
   ifeq ($(has_libelf),1)
     objtool_target := tools/objtool FORCE
   else
-    $(warning "Cannot use CONFIG_STACK_VALIDATION, please install libelf-dev or elfutils-libelf-devel")
+    $(warning "Cannot use CONFIG_STACK_VALIDATION, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
     SKIP_STACK_VALIDATION := 1
     export SKIP_STACK_VALIDATION
   endif
diff --git a/tools/perf/config/Makefile b/tools/perf/config/Makefile
index 80018feb99c0..534c81176f6c 100644
--- a/tools/perf/config/Makefile
+++ b/tools/perf/config/Makefile
@@ -257,7 +257,7 @@ else
       LIBC_SUPPORT := 1
     endif
     ifeq ($(LIBC_SUPPORT),1)
-      msg := $(warning No libelf found, disables 'probe' tool and BPF support in 'perf record', please install elfutils-libelf-devel/libelf-dev);
+      msg := $(warning No libelf found, disables 'probe' tool and BPF support in 'perf record', please install libelf-dev, libelf-devel or elfutils-libelf-devel);
 
       NO_LIBELF := 1
       NO_DWARF := 1
-- 
2.5.5

