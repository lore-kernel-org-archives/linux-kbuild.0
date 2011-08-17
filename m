Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:49705 "EHLO
	e23smtp03.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167Ab1HQG0H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Aug 2011 02:26:07 -0400
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [202.81.31.245])
	by e23smtp03.au.ibm.com (8.14.4/8.13.1) with ESMTP id p7H6Kc6m025795
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2011 16:20:38 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p7H6Pwmo1278022
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2011 16:25:58 +1000
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p7H6Pvmh018699
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2011 16:25:57 +1000
From: "Ian Munsie" <imunsie@au1.ibm.com>
Subject: [PATCH] tags, powerpc: Update tags.sh to support _GLOBAL symbols
Date: Wed, 17 Aug 2011 16:25:47 +1000
Message-Id: <1313562347-20099-1-git-send-email-imunsie@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Ian Munsie <imunsie@au1.ibm.com>

From: Ian Munsie <imunsie@au1.ibm.com>

On PowerPC we use _GLOBAL throughout the assembly to define symbols, but
currently these symbols are missing from the tags generated with
ARCH=powerpc make tags. This patch modifies the tags.sh script to
recognise _GLOBAL(.*) so that these symbols will be in the tags.

This is almost (but not quite) PowerPC specific and this change should
not affect anyone else:

$ git grep -E '^_GLOBAL\(([^)]*)\).*' |sed 's/^\([^/]*\/[^/]*\)\/.*$/\1/'|uniq -c
    627 arch/powerpc
      2 arch/um

Signed-off-by: Ian Munsie <imunsie@au1.ibm.com>
---
 scripts/tags.sh |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 75c5d24f1..38f6617 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -129,7 +129,7 @@ exuberant()
 	-I EXPORT_SYMBOL,EXPORT_SYMBOL_GPL                      \
 	-I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
 	--extra=+f --c-kinds=+px                                \
-	--regex-asm='/^ENTRY\(([^)]*)\).*/\1/'                  \
+	--regex-asm='/^(ENTRY|_GLOBAL)\(([^)]*)\).*/\2/'        \
 	--regex-c='/^SYSCALL_DEFINE[[:digit:]]?\(([^,)]*).*/sys_\1/' \
 	--regex-c++='/^TRACE_EVENT\(([^,)]*).*/trace_\1/'		\
 	--regex-c++='/^DEFINE_EVENT\([^,)]*, *([^,)]*).*/trace_\1/'
@@ -151,7 +151,7 @@ exuberant()
 emacs()
 {
 	all_sources | xargs $1 -a                               \
-	--regex='/^ENTRY(\([^)]*\)).*/\1/'                      \
+	--regex='/^(ENTRY|_GLOBAL)(\([^)]*\)).*/\2/'            \
 	--regex='/^SYSCALL_DEFINE[0-9]?(\([^,)]*\).*/sys_\1/'   \
 	--regex='/^TRACE_EVENT(\([^,)]*\).*/trace_\1/'		\
 	--regex='/^DEFINE_EVENT([^,)]*, *\([^,)]*\).*/trace_\1/'
-- 
1.7.2.5

