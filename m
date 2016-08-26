Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19165 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750927AbcHZITN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Aug 2016 04:19:13 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7Q89RSR078579
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2016 04:18:41 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2525tw8sy5-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2016 04:18:41 -0400
Received: from localhost
        by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Fri, 26 Aug 2016 18:18:38 +1000
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH 1/2] builddeb: fix typo
Date: Fri, 26 Aug 2016 18:17:15 +1000
Message-Id: <20160826081716.9435-1-andrew.donnellan@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8ea9fd2..d600fd0 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -69,7 +69,7 @@ set_debarch() {
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
 		echo "" >&2
-		echo "Your architecture doesn't have it's equivalent" >&2
+		echo "Your architecture doesn't have its equivalent" >&2
 		echo "Debian userspace architecture defined!" >&2
 		echo "Falling back to using your current userspace instead!" >&2
 		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

