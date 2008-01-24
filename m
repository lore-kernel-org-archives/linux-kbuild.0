Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42840 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758885AbYAXWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:53 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 39/77] kbuild: ignore cache modifiers for generating the tags files
Date: Thu, 24 Jan 2008 23:03:20 +0100
Message-Id: <1201212238-4369-39-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>, Sam Ravnborg <sam@ravnborg.org>

From: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>

With this patch I'm able to find the definition of _xmit_lock defined in
include/linux/netdevice.h as follows:

	struct net_device {
		...
		spinlock_t _xmit_lock ____cacheline_aligned_in_smp;
	}

Otherwise this counts as definition of ____cacheline_aligned_in_smp.

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 4aa59b8..d599acd 100644
--- a/Makefile
+++ b/Makefile
@@ -1378,6 +1378,7 @@ define xtags
 	if $1 --version 2>&1 | grep -iq exuberant; then \
 	    $(all-sources) | xargs $1 -a \
 		-I __initdata,__exitdata,__acquires,__releases \
+		-I __read_mostly,____cacheline_aligned,____cacheline_aligned_in_smp,____cacheline_internodealigned_in_smp \
 		-I EXPORT_SYMBOL,EXPORT_SYMBOL_GPL \
 		--extra=+f --c-kinds=+px \
 		--regex-asm='/^ENTRY\(([^)]*)\).*/\1/'; \
-- 
1.5.4.rc3.14.g44397

