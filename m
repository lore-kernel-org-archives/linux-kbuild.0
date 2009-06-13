Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:39719 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751375AbZFMLL5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Jun 2009 07:11:57 -0400
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] scripts/checksyscalls.sh: only whine perf_counter_open when supported
Date: Sat, 13 Jun 2009 07:11:42 -0400
Message-Id: <1244891502-12393-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

If the port does not support HAVE_PERF_COUNTERS, then they can't support
the perf_counter_open syscall either.  Rather than forcing everyone to add
an ignore (or suffer the warning until they get around to implementing
support), only whine about the syscall when applicable.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Acked-by: Ingo Molnar <mingo@elte.hu>
---
 scripts/checksyscalls.sh |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 60d00d1..90fb953 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -104,6 +104,11 @@ cat << EOF
 #define __IGNORE_sync_file_range
 #endif
 
+/* if the port doesn't have support for it yet */
+#ifndef CONFIG_HAVE_PERF_COUNTERS
+#define __IGNORE_perf_counter_open
+#endif
+
 /* Unmerged syscalls for AFS, STREAMS, etc. */
 #define __IGNORE_afs_syscall
 #define __IGNORE_getpmsg
-- 
1.6.3.1

