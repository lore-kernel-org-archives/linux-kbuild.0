Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56479 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab1DEO7e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 10:59:34 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 06/34] kbuild: Drop unused LINUX_COMPILE_TIME and LINUX_COMPILE_DOMAIN macros
Date: Tue,  5 Apr 2011 16:58:53 +0200
Message-Id: <1302015561-21047-7-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/mkcompile_h |   16 ++--------------
 1 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 50ad317..82416a8 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -63,21 +63,9 @@ UTS_TRUNCATE="cut -b -$UTS_LEN"
 
   echo \#define UTS_VERSION \"`echo $UTS_VERSION | $UTS_TRUNCATE`\"
 
-  echo \#define LINUX_COMPILE_TIME \"`date +%T`\"
   echo \#define LINUX_COMPILE_BY \"`whoami`\"
   echo \#define LINUX_COMPILE_HOST \"`hostname | $UTS_TRUNCATE`\"
 
-  domain=`dnsdomainname 2> /dev/null`
-  if [ -z "$domain" ]; then
-    domain=`domainname 2> /dev/null`
-  fi
-
-  if [ -n "$domain" ]; then
-    echo \#define LINUX_COMPILE_DOMAIN \"`echo $domain | $UTS_TRUNCATE`\"
-  else
-    echo \#define LINUX_COMPILE_DOMAIN
-  fi
-
   echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | tail -n 1`\"
 ) > .tmpcompile
 
@@ -91,8 +79,8 @@ UTS_TRUNCATE="cut -b -$UTS_LEN"
 # first line.
 
 if [ -r $TARGET ] && \
-      grep -v 'UTS_VERSION\|LINUX_COMPILE_TIME' $TARGET > .tmpver.1 && \
-      grep -v 'UTS_VERSION\|LINUX_COMPILE_TIME' .tmpcompile > .tmpver.2 && \
+      grep -v 'UTS_VERSION' $TARGET > .tmpver.1 && \
+      grep -v 'UTS_VERSION' .tmpcompile > .tmpver.2 && \
       cmp -s .tmpver.1 .tmpver.2; then
    rm -f .tmpcompile
 else
-- 
1.7.4.1

