Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:54881 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751775Ab0BSUpe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Feb 2010 15:45:34 -0500
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] tags: Use $SRCARCH
Date: Fri, 19 Feb 2010 21:45:08 +0100
Message-Id: <1266612308-2911-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, WANG Cong <xiyou.wangcong@gmail.com>

$ make mrproper
$ make tags
  GEN     tags
  find: `arch/x86_64/': No such file or directory

Caused by commit f81b1be (tags: include headers before source files)

Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: WANG Cong <xiyou.wangcong@gmail.com>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/tags.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index c122041..9f45953 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -5,7 +5,7 @@
 # mode may be any of: tags, TAGS, cscope
 #
 # Uses the following environment variables:
-# ARCH, SUBARCH, srctree, src, obj
+# ARCH, SUBARCH, SRCARCH, srctree, src, obj
 
 if [ "$KBUILD_VERBOSE" = "1" ]; then
 	set -x
@@ -70,7 +70,7 @@ find_sources()
 
 all_sources()
 {
-	find_arch_include_sources ${ARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH} '*.[chS]'
 	if [ ! -z "$archinclude" ]; then
 		find_arch_include_sources $archinclude '*.[chS]'
 	fi
-- 
1.6.5.3

