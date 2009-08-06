Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:34628 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756804AbZHFXFF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Aug 2009 19:05:05 -0400
Message-Id: <200908062304.n76N4VwH003172@imap1.linux-foundation.org>
Subject: [patch 4/8] kbuild: remove extraneous blank line after declaration of usage()
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:04:31 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, tsrk@tsrk.net, xiyou.wangcong@gmail.com

From: Trevor Keith <tsrk@tsrk.net>

Signed-off-by: Trevor Keith <tsrk@tsrk.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/basic/fixdep.c |    1 -
 1 file changed, 1 deletion(-)

diff -puN scripts/basic/fixdep.c~kbuild-remove-extraneous-blank-line-after-declaration-of-usage scripts/basic/fixdep.c
--- a/scripts/basic/fixdep.c~kbuild-remove-extraneous-blank-line-after-declaration-of-usage
+++ a/scripts/basic/fixdep.c
@@ -125,7 +125,6 @@ char *depfile;
 char *cmdline;
 
 static void usage(void)
-
 {
 	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline>\n");
 	exit(1);
_
