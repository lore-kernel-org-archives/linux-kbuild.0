Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33728 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030280AbbD1Nbu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 09:31:50 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH 07/64] perf tests: Add build tests for building perf from kernel source root and tools
Date: Tue, 28 Apr 2015 10:29:59 -0300
Message-Id: <1430227856-25825-8-git-send-email-acme@kernel.org>
In-Reply-To: <1430227856-25825-1-git-send-email-acme@kernel.org>
References: <1430227856-25825-1-git-send-email-acme@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Jiri Olsa <jolsa@kernel.org>

Adding build tests for following make commands:
  $ make -C <kernelsrc> tools/perf
  $ make -C <kernelsrc>/tools perf

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Ahern <dsahern@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org
Link: http://lkml.kernel.org/r/1429389280-18720-4-git-send-email-jolsa@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
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

