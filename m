Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:22257 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442476AbfIYHKj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Sep 2019 03:10:39 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: update compile-test header list for v5.4-rc1
Date: Wed, 25 Sep 2019 16:10:30 +0900
Message-Id: <20190925071032.18354-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Some build errors were fixed. Add more headers into the test coverage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 usr/include/Makefile | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 05c71ef42f51..4ef9946775ee 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -35,7 +35,6 @@ header-test- += linux/errqueue.h
 header-test- += linux/fsmap.h
 header-test- += linux/hdlc/ioctl.h
 header-test- += linux/ivtv.h
-header-test- += linux/jffs2.h
 header-test- += linux/kexec.h
 header-test- += linux/matroxfb.h
 header-test- += linux/netfilter_bridge/ebtables.h
@@ -56,20 +55,12 @@ header-test- += linux/v4l2-mediabus.h
 header-test- += linux/v4l2-subdev.h
 header-test- += linux/videodev2.h
 header-test- += linux/vm_sockets.h
-header-test- += scsi/scsi_bsg_fc.h
-header-test- += scsi/scsi_netlink.h
-header-test- += scsi/scsi_netlink_fc.h
 header-test- += sound/asequencer.h
 header-test- += sound/asoc.h
 header-test- += sound/asound.h
 header-test- += sound/compress_offload.h
 header-test- += sound/emu10k1.h
 header-test- += sound/sfnt_info.h
-header-test- += sound/sof/eq.h
-header-test- += sound/sof/fw.h
-header-test- += sound/sof/header.h
-header-test- += sound/sof/manifest.h
-header-test- += sound/sof/trace.h
 header-test- += xen/evtchn.h
 header-test- += xen/gntdev.h
 header-test- += xen/privcmd.h
-- 
2.17.1
