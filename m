Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:63487 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755823Ab1G1PyM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:54:12 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 27/40] UAPI: Guard linux/isdn_divertif.h [ver #3]
Date: Thu, 28 Jul 2011 16:53:36 +0100
Message-ID: <20110728155336.16618.13479.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Place reinclusion guards on linux/isdn_divertif.h otherwise the splitter
script won't insert the UAPI #include.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/isdn_divertif.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/isdn_divertif.h b/include/linux/isdn_divertif.h
index 07821ca..a5a50f5 100644
--- a/include/linux/isdn_divertif.h
+++ b/include/linux/isdn_divertif.h
@@ -10,6 +10,8 @@
  *
  */
 
+#ifndef _LINUX_ISDN_DIVERTIF_H
+#define _LINUX_ISDN_DIVERTIF_H
 
 /***********************************************************/
 /* magic value is also used to control version information */
@@ -45,3 +47,5 @@ typedef struct
 /*********************/
 extern int DIVERT_REG_NAME(isdn_divert_if *);
 #endif
+
+#endif /* _LINUX_ISDN_DIVERTIF_H */

