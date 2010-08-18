Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:54099 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753557Ab0HRVOY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Aug 2010 17:14:24 -0400
From: Ramkumar Ramachandra <artagnon@gmail.com>
Subject: [PATCH] scripts/mkversion: Simplify script
Date: Thu, 19 Aug 2010 02:42:25 +0530
Message-Id: <1282165945-27195-1-git-send-email-artagnon@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Simplify the script and add a line to help editors recognize this as a
shell script.

Signed-off-by: Ramkumar Ramachandra <artagnon@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>
---
 scripts/mkversion |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/mkversion b/scripts/mkversion
index c12addc..6fedcb3 100644
--- a/scripts/mkversion
+++ b/scripts/mkversion
@@ -1,6 +1,3 @@
-if [ ! -f .version ]
-then
-    echo 1
-else
-    expr 0`cat .version` + 1
-fi
+#!/bin/sh
+
+[ ! -f .version ] && echo 1 || expr 0`cat .version` + 1
-- 
1.7.1

