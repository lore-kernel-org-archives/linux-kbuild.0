Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54041 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751105AbbDRUfL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Apr 2015 16:35:11 -0400
From: Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH 3/3] perf tests: Add build tests for building perf from kernel source root and tools
Date: Sat, 18 Apr 2015 22:34:40 +0200
Message-Id: <1429389280-18720-4-git-send-email-jolsa@kernel.org>
In-Reply-To: <1429389280-18720-1-git-send-email-jolsa@kernel.org>
References: <1429389280-18720-1-git-send-email-jolsa@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Adding build tests for following make commands:
  $ make -C <kernelsrc> tools/perf
  $ make -C <kernelsrc>/tools perf

Link: http://lkml.kernel.org/n/tip-8mz4fits682bac4shmejjhw0@git.kernel.org
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 tools/perf/tests/make | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index bff85324f799..901ec9191359 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -223,7 +223,19 @@ tarpkg:
 	echo "- $@: $$cmd" && echo $$cmd > $@ && \
 	( eval $$cmd ) >> $@ 2>&1
 
-all: $(run) $(run_O) tarpkg
+make_kernelsrc:
+	@echo " - make -C <kernelsrc> tools/perf"
+	$(call clean); \
+	(make -C ../.. tools/perf) > $@ 2>&1 && \
+	test -x perf && rm -f $@ || (cat $@ ; false)
+
+make_kernelsrc_tools:
+	@echo " - make -C <kernelsrc>/tools perf"
+	$(call clean); \
+	(make -C ../../tools perf) > $@ 2>&1 && \
+	test -x perf && rm -f $@ || (cat $@ ; false)
+
+all: $(run) $(run_O) tarpkg make_kernelsrc make_kernelsrc_tools
 	@echo OK
 
 out: $(run_O)
-- 
1.9.3

