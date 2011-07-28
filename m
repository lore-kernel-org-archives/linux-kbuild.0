Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:23388 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755637Ab1G1PvN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:51:13 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 11/40] UAPI: Fix nested __KERNEL__ guards in video/edid.h [ver
 #3]
Date: Thu, 28 Jul 2011 16:51:06 +0100
Message-ID: <20110728155106.16618.76626.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Fix nested __KERNEL__ guards in video/edid.h to make parsing easier.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/video/edid.h |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/video/edid.h b/include/video/edid.h
index 928c342..c5f1987 100644
--- a/include/video/edid.h
+++ b/include/video/edid.h
@@ -1,16 +1,14 @@
 #ifndef __linux_video_edid_h__
 #define __linux_video_edid_h__
 
-#if !defined(__KERNEL__) || defined(CONFIG_X86)
-
 struct edid_info {
 	unsigned char dummy[128];
 };
 
 #ifdef __KERNEL__
+#ifdef CONFIG_X86
 extern struct edid_info edid_info;
-#endif /* __KERNEL__ */
-
+#endif
 #endif
 
 #endif /* __linux_video_edid_h__ */

