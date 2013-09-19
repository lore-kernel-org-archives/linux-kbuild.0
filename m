Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:58540 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754214Ab3ISNJW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Sep 2013 09:09:22 -0400
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <maddy@linux.vnet.ibm.com>;
	Thu, 19 Sep 2013 18:39:20 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id E750FE0056
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2013 18:40:14 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r8JD9CQP39714940
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2013 18:39:12 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id r8JD9DGn022071
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2013 18:39:14 +0530
From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Subject: [PATCH] MIPS: fix invalid symbolic link file
Date: Thu, 19 Sep 2013 18:39:08 +0530
Message-Id: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ralf@linux-mips.org
Cc: steven.hill@imgtec.com, mmarek@suse.cz, swarren@nvidia.com, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, james.hogan@imgtec.com, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

   Commit 3b29aa5ba204c created a symlink file in include/dt-bindings.
   Even though commit diff is fine, symlink is invalid.
   ls -lb shows a newline character at the end of the filename.

lrwxrwxrwx 1 maddy maddy 35 Sep 19 18:11 dt-bindings ->
../../../../../include/dt-bindings\n

Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
---
 arch/mips/boot/dts/include/dt-bindings |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/include/dt-bindings b/arch/mips/boot/dts/include/dt-bindings
index 68ae388..08c00e4 120000
--- a/arch/mips/boot/dts/include/dt-bindings
+++ b/arch/mips/boot/dts/include/dt-bindings
@@ -1 +1 @@
-../../../../../include/dt-bindings
+../../../../../include/dt-bindings
\ No newline at end of file
-- 
1.7.10.4

