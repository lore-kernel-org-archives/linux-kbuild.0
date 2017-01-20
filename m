Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from m50-132.163.com ([123.125.50.132]:49033 "EHLO m50-132.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752058AbdATXYT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jan 2017 18:24:19 -0500
Message-ID: <1484954637.5246.4.camel@163.com>
Subject: [PATCH] setlocalversion: fix error detectition of kernel git
 repository
From: xufeng <xufwang@163.com>
Date: Sat, 21 Jan 2017 07:23:57 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org, wsa@the-dreams.de

This patch fixed the error using 'git rev-parse --show-cdup' to check
that git is used as SCM to track the current directory. The return
value of this command is not null string when the .git directory is
not in kernel topdir.

Signed-off-by: Xufeng Wang <xufwang@163.com>
---
 scripts/setlocalversion | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 966dd39..7966e39 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -43,7 +43,7 @@ scm_version()
     fi
 
     # Check for git and a git repo.
-    if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
+    if test -z "$(git rev-parse --show-cdup &>/dev/null)" &&
        head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 
         # If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
-- 
2.9.3

