Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:53302 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfJCChY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 22:37:24 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: update compile-test header list for v5.4-rc2
Date: Thu,  3 Oct 2019 11:36:29 +0900
Message-Id: <20191003023629.13175-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Commit 6dc280ebeed2 ("coda: remove uapi/linux/coda_psdev.h") removed
a header in question. Some more build errors were fixed. Add more
headers into the test coverage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - remove linux/coda_psdev.h as well

 usr/include/Makefile | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index c9449aaf438d..57b20f7b6729 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -29,13 +29,11 @@ header-test- += linux/android/binderfs.h
 header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
 header-test-$(CONFIG_CPU_LITTLE_ENDIAN) += linux/byteorder/little_endian.h
 header-test- += linux/coda.h
-header-test- += linux/coda_psdev.h
 header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
 header-test- += linux/fsmap.h
 header-test- += linux/hdlc/ioctl.h
 header-test- += linux/ivtv.h
-header-test- += linux/jffs2.h
 header-test- += linux/kexec.h
 header-test- += linux/matroxfb.h
 header-test- += linux/netfilter_ipv4/ipt_LOG.h
@@ -55,20 +53,12 @@ header-test- += linux/v4l2-mediabus.h
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
