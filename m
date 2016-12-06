Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 001b2d01.pphosted.com ([148.163.156.1]:59357 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752079AbcLFG2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Dec 2016 01:28:46 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uB66O97M087882
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Dec 2016 01:28:40 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
        by mx0a-001b2d01.pphosted.com with ESMTP id 275q313yha-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Dec 2016 01:28:40 -0500
Received: from localhost
        by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Tue, 6 Dec 2016 16:28:38 +1000
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH 2/3] powerpc: correctly disable latent entropy GCC plugin on prom_init.o
Date: Tue,  6 Dec 2016 17:27:59 +1100
In-Reply-To: <20161206062800.21800-1-andrew.donnellan@au1.ibm.com>
References: <20161206062800.21800-1-andrew.donnellan@au1.ibm.com>
Message-Id: <20161206062800.21800-2-andrew.donnellan@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org, kernel-hardening@lists.openwall.com, keescook@chromium.org, re.emese@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, pageexec@freemail.hu, spender@grsecurity.net, mmarek@suse.com

Commit 38addce8b600 ("gcc-plugins: Add latent_entropy plugin") excludes
certain powerpc early boot code from the latent entropy plugin by adding
appropriate CFLAGS. It looks like this was supposed to cover prom_init.o,
but ended up saying init.o (which doesn't exist) instead. Fix the typo.

Fixes: 38addce8b600 ("gcc-plugins: Add latent_entropy plugin")
Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

---

I think that we potentially could get rid of some of these disables, but
it's safer to leave it for now.
---
 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 1925341..adb52d1 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -15,7 +15,7 @@ CFLAGS_btext.o		+= -fPIC
 endif
 
 CFLAGS_cputable.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
-CFLAGS_init.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
+CFLAGS_prom_init.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 CFLAGS_btext.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 CFLAGS_prom.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 
-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

