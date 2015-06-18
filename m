Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:35301 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbbFRMv6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Jun 2015 08:51:58 -0400
Received: by labko7 with SMTP id ko7so53798903lab.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2015 05:51:57 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH] Makefile.perf: make python module depend on traceevent
Date: Thu, 18 Jun 2015 15:51:49 +0300
Message-Id: <1434631909-12636-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: acme@kernel.org, mingo@redhat.com, a.p.zijlstra@chello.nl, hekuang@huawei.com, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Building python module might fail if libtraceevent-dynamic-list
hasn't been built before:

to LDFLAGS:

  GEN      python/perf.so
/usr/bin/ld: cannot open linker script file /x/tools/lib/traceevent/libtraceevent-dynamic-list: No such file or directory
collect2: error: ld returned 1 exit status
error: command 'x86_64-linux-gnu-gcc' failed with exit status 1
cp: cannot stat ?python_ext_build/lib/perf.so?: No such file or directory

Add explicit Makefile dependency to make sure libtraceevent-dynamic-list
is built before.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 tools/perf/Makefile.perf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index b1dfcd8..66045d0 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -188,7 +188,7 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
 python-clean := $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) $(OUTPUT)python/perf.so
 
 PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
-PYTHON_EXT_DEPS := util/python-ext-sources util/setup.py $(LIBTRACEEVENT) $(LIBAPI)
+PYTHON_EXT_DEPS := util/python-ext-sources util/setup.py $(LIBTRACEEVENT) $(LIBTRACEEVENT_DYNAMIC_LIST) $(LIBAPI)
 
 $(OUTPUT)python/perf.so: $(PYTHON_EXT_SRCS) $(PYTHON_EXT_DEPS)
 	$(QUIET_GEN)CFLAGS='$(CFLAGS)' $(PYTHON_WORD) util/setup.py \
-- 
2.1.4

