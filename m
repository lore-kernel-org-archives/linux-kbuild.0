Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53614 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751335AbcLFG2c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Dec 2016 01:28:32 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uB66P2B9001374
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Dec 2016 01:28:31 -0500
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
        by mx0b-001b2d01.pphosted.com with ESMTP id 275pymc61c-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Dec 2016 01:28:30 -0500
Received: from localhost
        by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Tue, 6 Dec 2016 16:28:28 +1000
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH 1/3] gcc-plugins: fix definition of DISABLE_LATENT_ENTROPY_PLUGIN
Date: Tue,  6 Dec 2016 17:27:58 +1100
Message-Id: <20161206062800.21800-1-andrew.donnellan@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org, kernel-hardening@lists.openwall.com, keescook@chromium.org, re.emese@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, pageexec@freemail.hu, spender@grsecurity.net, mmarek@suse.com

The variable DISABLE_LATENT_ENTROPY_PLUGIN is defined when
CONFIG_PAX_LATENT_ENTROPY is set. This is leftover from the original PaX
version of the plugin code and doesn't actually exist. Change the condition
to depend on CONFIG_GCC_PLUGIN_LATENT_ENTROPY instead.

Fixes: 38addce8b600 ("gcc-plugins: Add latent_entropy plugin")
Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
---
 scripts/Makefile.gcc-plugins | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 060d2cb..26c67b7 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -8,7 +8,7 @@ ifdef CONFIG_GCC_PLUGINS
 
   gcc-plugin-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)	+= latent_entropy_plugin.so
   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)	+= -DLATENT_ENTROPY_PLUGIN
-  ifdef CONFIG_PAX_LATENT_ENTROPY
+  ifdef CONFIG_GCC_PLUGIN_LATENT_ENTROPY
     DISABLE_LATENT_ENTROPY_PLUGIN			+= -fplugin-arg-latent_entropy_plugin-disable
   endif
 
-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

