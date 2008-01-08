Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail29.messagelabs.com ([216.82.249.147]:31656 "HELO
	mail29.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751084AbYAHOQ3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Jan 2008 09:16:29 -0500
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: [PATCH v2] ignore cache modifiers for generating the tag files
Date: Tue,  8 Jan 2008 15:16:24 +0100
Message-Id: <1199801784-19490-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
In-Reply-To: <1199801429-19325-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
References: <1199801429-19325-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

With this patch I'm able to find the definition of _xmit_lock defined in
include/linux/netdevice.h as follows:

	struct net_device {
		...
		spinlock_t _xmit_lock ____cacheline_aligned_in_smp;
	}

Otherwise this counts as definition of ____cacheline_aligned_in_smp.

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

Hello,

I sent out an old version of this patch by mistake, please ignore the first
post and use this one instead.

Sorry,
Uwe

diff --git a/Makefile b/Makefile
index c1825aa..d8c1029 100644
--- a/Makefile
+++ b/Makefile
@@ -1371,6 +1371,7 @@ define xtags
 	if $1 --version 2>&1 | grep -iq exuberant; then \
 	    $(all-sources) | xargs $1 -a \
 		-I __initdata,__exitdata,__acquires,__releases \
+		-I __read_mostly,____cacheline_aligned,____cacheline_aligned_in_smp,____cacheline_internodealigned_in_smp \
 		-I EXPORT_SYMBOL,EXPORT_SYMBOL_GPL \
 		--extra=+f --c-kinds=+px \
 		--regex-asm='/^ENTRY\(([^)]*)\).*/\1/'; \
-- 
1.5.3.6

