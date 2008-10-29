Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:58733 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754031AbYJ2VUc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 17:20:32 -0400
Message-Id: <200810292120.m9TLK97C019364@imap1.linux-foundation.org>
Subject: [patch 06/13] scripts/checksyscalls.sh: fix for non-gnu sed
From: akpm@linux-foundation.org
Date: Wed, 29 Oct 2008 14:20:09 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, tvolpini@gmx.net

From: Thomas Volpini <tvolpini@gmx.net>

Make the checksyscalls script work even on systems where sed is non-gnu.

Cc: Sam Ravnborg <sam@ravnborg.org>a
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/checksyscalls.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN scripts/checksyscalls.sh~scripts-checksyscallssh-fix-for-non-gnu-sed scripts/checksyscalls.sh
--- a/scripts/checksyscalls.sh~scripts-checksyscallssh-fix-for-non-gnu-sed
+++ a/scripts/checksyscalls.sh
@@ -113,10 +113,10 @@ EOF
 }
 
 syscall_list() {
-sed -n -e '/^\#define/ { s/[^_]*__NR_\([^[:space:]]*\).*/\
+sed -n -e '/^\#define/ s/[^_]*__NR_\([^[:space:]]*\).*/\
 \#if !defined \(__NR_\1\) \&\& !defined \(__IGNORE_\1\)\
 \#warning syscall \1 not implemented\
-\#endif/p }' $1
+\#endif/p' $1
 }
 
 (ignore_list && syscall_list ${srctree}/arch/x86/include/asm/unistd_32.h) | \
_
