Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42828 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756621AbYAXWD5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:57 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 24/77] A few corrections to include/linux/Kbuild
Date: Thu, 24 Jan 2008 23:03:05 +0100
Message-Id: <1201212238-4369-24-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, David Woodhouse <dwmw2@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

From: Robert P. J. Day <rpjday@crashcourse.ca>

auxvec.h, i2c-dev.h and vt.h *should* be unifdef'ed i2o-dev.h does not need
unifdef'ing

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/linux/Kbuild |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/Kbuild b/include/linux/Kbuild
index f30fa92..e6e541d 100644
--- a/include/linux/Kbuild
+++ b/include/linux/Kbuild
@@ -34,7 +34,6 @@ header-y += atmsap.h
 header-y += atmsvc.h
 header-y += atm_zatm.h
 header-y += auto_fs4.h
-header-y += auxvec.h
 header-y += ax25.h
 header-y += b1lli.h
 header-y += baycom.h
@@ -72,7 +71,7 @@ header-y += gen_stats.h
 header-y += gigaset_dev.h
 header-y += hdsmart.h
 header-y += hysdn_if.h
-header-y += i2c-dev.h
+header-y += i2o-dev.h
 header-y += i8k.h
 header-y += if_arcnet.h
 header-y += if_bonding.h
@@ -157,7 +156,6 @@ header-y += veth.h
 header-y += video_decoder.h
 header-y += video_encoder.h
 header-y += videotext.h
-header-y += vt.h
 header-y += x25.h
 
 unifdef-y += acct.h
@@ -172,6 +170,7 @@ unifdef-y += atm.h
 unifdef-y += atm_tcp.h
 unifdef-y += audit.h
 unifdef-y += auto_fs.h
+unifdef-y += auxvec.h
 unifdef-y += binfmts.h
 unifdef-y += capability.h
 unifdef-y += capi.h
@@ -213,7 +212,7 @@ unifdef-y += hdreg.h
 unifdef-y += hiddev.h
 unifdef-y += hpet.h
 unifdef-y += i2c.h
-unifdef-y += i2o-dev.h
+unifdef-y += i2c-dev.h
 unifdef-y += icmp.h
 unifdef-y += icmpv6.h
 unifdef-y += if_addr.h
@@ -348,6 +347,7 @@ unifdef-y += videodev.h
 unifdef-y += virtio_config.h
 unifdef-y += virtio_blk.h
 unifdef-y += virtio_net.h
+unifdef-y += vt.h
 unifdef-y += wait.h
 unifdef-y += wanrouter.h
 unifdef-y += watchdog.h
-- 
1.5.4.rc3.14.g44397

