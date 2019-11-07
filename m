Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:62497 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfKGPFM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 10:05:12 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: update compile-test header list for v5.5-rc1
Date: Fri,  8 Nov 2019 00:04:52 +0900
Message-Id: <20191107150452.2682-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Since commit 707816c8b050 ("netfilter: remove deprecation warnings from
uapi headers."), you can compile linux/netfilter_ipv4/ipt_LOG.h and
linux/netfilter_ipv6/ip6t_LOG.h without warnings.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 usr/include/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 57b20f7b6729..3e1adab089a4 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -26,8 +26,6 @@ header-test- += drm/vmwgfx_drm.h
 header-test- += linux/am437x-vpfe.h
 header-test- += linux/android/binder.h
 header-test- += linux/android/binderfs.h
-header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
-header-test-$(CONFIG_CPU_LITTLE_ENDIAN) += linux/byteorder/little_endian.h
 header-test- += linux/coda.h
 header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
@@ -36,8 +34,6 @@ header-test- += linux/hdlc/ioctl.h
 header-test- += linux/ivtv.h
 header-test- += linux/kexec.h
 header-test- += linux/matroxfb.h
-header-test- += linux/netfilter_ipv4/ipt_LOG.h
-header-test- += linux/netfilter_ipv6/ip6t_LOG.h
 header-test- += linux/nfc.h
 header-test- += linux/omap3isp.h
 header-test- += linux/omapfb.h
-- 
2.17.1
