Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51582 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754539AbbDRUfN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Apr 2015 16:35:13 -0400
From: Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH 1/3] tools build: No need to make libapi for perf explicitly
Date: Sat, 18 Apr 2015 22:34:38 +0200
Message-Id: <1429389280-18720-2-git-send-email-jolsa@kernel.org>
In-Reply-To: <1429389280-18720-1-git-send-email-jolsa@kernel.org>
References: <1429389280-18720-1-git-send-email-jolsa@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

The perf build handles its dependencies by itself.

Also renaming libapi libapikfs to libapi as it got
changed just recently.

Link: http://lkml.kernel.org/n/tip-f31hq9rl838ovbyj0w1bhgzo@git.kernel.org
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 tools/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 9a617adc6675..01995cc8ac44 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -47,10 +47,10 @@ cgroup firewire hv guest usb virtio vm net: FORCE
 liblockdep: FORCE
 	$(call descend,lib/lockdep)
 
-libapikfs: FORCE
+libapi: FORCE
 	$(call descend,lib/api)
 
-perf: libapikfs FORCE
+perf: FORCE
 	$(call descend,$@)
 
 selftests: FORCE
@@ -97,10 +97,10 @@ cgroup_clean hv_clean firewire_clean lguest_clean usb_clean virtio_clean vm_clea
 liblockdep_clean:
 	$(call descend,lib/lockdep,clean)
 
-libapikfs_clean:
+libapi_clean:
 	$(call descend,lib/api,clean)
 
-perf_clean: libapikfs_clean
+perf_clean:
 	$(call descend,$(@:_clean=),clean)
 
 selftests_clean:
-- 
1.9.3

