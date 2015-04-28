Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33667 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030267AbbD1Nbk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 09:31:40 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH 05/64] tools build: No need to make libapi for perf explicitly
Date: Tue, 28 Apr 2015 10:29:57 -0300
Message-Id: <1430227856-25825-6-git-send-email-acme@kernel.org>
In-Reply-To: <1430227856-25825-1-git-send-email-acme@kernel.org>
References: <1430227856-25825-1-git-send-email-acme@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Jiri Olsa <jolsa@kernel.org>

The perf build handles its dependencies by itself.

Also renaming libapi libapikfs to libapi as it got
changed just recently.

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
Link: http://lkml.kernel.org/r/1429389280-18720-2-git-send-email-jolsa@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
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

