Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:36570 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753976AbbIAOOZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Sep 2015 10:14:25 -0400
Received: by lbcao8 with SMTP id ao8so387967lbc.3
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2015 07:14:24 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v3] package Makefile: fix perf-tar targets when outdir is set
Date: Tue,  1 Sep 2015 17:14:21 +0300
Message-Id: <1441116861-28604-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

building with $srctree != $objtree, perf-tar-* targets fail
to read the MANIFEST file and add the PERF-VERSION-FILE needed
by out-of-tree builds. The build errors and an incorrect tar is created:

$ make O=build-x86 perf-targz-src-pkg
  TAR
cat: ../tools/perf/MANIFEST: No such file or directory
tar: perf-4.1.0-rc8/PERF-VERSION-FILE: Cannot stat: No such file or
dir..
tar: Exiting with failure status due to previous errors

Kbuild sets objtree to "." and srctree to ".." The command to output
MANIFEST becomes:

   $(cd ..; echo $(cat ../tools/perf/MANIFEST))

Without MANIFEST, the entire kernel source tree is added to the perf
source tarball. The *correct* fix is to keep the cd and remove srctree
from cat command line since MANIFEST has wildcards that fail to expand
working directory isn't srctree.

Second, PERF-VERSION-FILE gets not added, because in-tree build path is
hardcoded to Makefile:

   util/PERF-VERSION-GEN ../../$(perf-tar)/ 2>/dev/null)

The PERF-VERSION-GEN needs to be run from tools/perf directory,
and the output directory needs to be changed from relative to
to absolute. This can be achieved using the $(CURDIR) variable.

Also remove the error redirect to /dev/null which hid the error.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v3: use $(CURDIR)
v2: switch from easy fix to correct fix
 scripts/package/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 562aa15..f127f7e 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -117,12 +117,12 @@ quiet_cmd_perf_tar = TAR
       cmd_perf_tar = \
 git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
 	HEAD^{tree} $$(cd $(srctree);                               \
-		       echo $$(cat $(srctree)/tools/perf/MANIFEST)) \
+		       echo $$(cat tools/perf/MANIFEST)) \
 	-o $(perf-tar).tar;                                         \
 mkdir -p $(perf-tar);                                               \
 git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
 (cd $(srctree)/tools/perf;                                          \
-util/PERF-VERSION-GEN ../../$(perf-tar)/ 2>/dev/null);              \
+util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-- 
2.4.6

