Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:35968 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754430Ab2ILJbf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 12 Sep 2012 05:31:35 -0400
Received: by pbbrr13 with SMTP id rr13so2002520pbb.19
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Sep 2012 02:31:34 -0700 (PDT)
From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH v2] kbuild: setlocalversion: ignore private tags while reporting local version
Date: Wed, 12 Sep 2012 14:58:30 +0530
Message-Id: <1347442110-26569-1-git-send-email-tushar.behera@linaro.org>
In-Reply-To: <1347424996-15569-1-git-send-email-tushar.behera@linaro.org>
References: <1347424996-15569-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mmarek@suse.cz, patches@linaro.org

The output of 'git describe' is relative to the immediate preceding tag.
When the immediate tag preceding or at the HEAD is a private tag,
setlocalversion extracts information with respect to the private tag and
wrongly reports them with respect to Linux tag.

Fixing this to extract information with respect to Linux tags.

CC: Michal Marek <mmarek@suse.cz>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
Changes since v1:
* Extend the fix when the HEAD is a private tagged commit

 scripts/setlocalversion |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index bd6dca8..b65e8a9 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -47,7 +47,7 @@ scm_version()
 
 		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
 		# it, because this version is defined in the top level Makefile.
-		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
+		if [ -z "`git describe --exact-match --match v[2-9].* 2>/dev/null`" ]; then
 
 			# If only the short version is requested, don't bother
 			# running further git commands
@@ -57,7 +57,8 @@ scm_version()
 			fi
 			# If we are past a tagged commit (like
 			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
-			if atag="`git describe 2>/dev/null`"; then
+			# Also match linux tags pattern to discard private tags
+			if atag="`git describe --match v[2-9].* 2>/dev/null`"; then
 				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
 
 			# If we don't have a tag at all we print -g{commitish}.
-- 
1.7.4.1

