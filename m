Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42529 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751721AbcKBGxX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 02:53:23 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uA26msdJ018617
        for <linux-kbuild@vger.kernel.org>; Wed, 2 Nov 2016 02:53:22 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
        by mx0b-001b2d01.pphosted.com with ESMTP id 26f6kv3n9e-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Nov 2016 02:53:22 -0400
Received: from localhost
        by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Wed, 2 Nov 2016 16:53:19 +1000
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH] MAINTAINERS: add GCC plugins Makefile
Date: Wed,  2 Nov 2016 17:52:41 +1100
Message-Id: <20161102065241.985-1-andrew.donnellan@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org
Cc: re.emese@gmail.com, keescook@chromium.org, mmarek@suse.com, linux-kernel@vger.kernel.org

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4012c2f..76049e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5202,6 +5202,7 @@ L:	kernel-hardening@lists.openwall.com
 S:	Maintained
 F:	scripts/gcc-plugins/
 F:	scripts/gcc-plugin.sh
+F:	scripts/Makefile.gcc-plugins
 F:	Documentation/gcc-plugins.txt
 
 GCOV BASED KERNEL PROFILING
-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

