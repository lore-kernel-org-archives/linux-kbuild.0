Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:22987 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755828Ab1G1Pxf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:53:35 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 22/40] UAPI: Fix drmP.h to use #include <...> when referring
 to system header files [ver #3]
Date: Thu, 28 Jul 2011 16:52:52 +0100
Message-ID: <20110728155252.16618.84586.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Fix drmP.h to use #include <...> when referring to system header files to make
sure the UAPI header defaulting works correctly.  The -I flag to include/drm/
should be removed at some point.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/drm/drmP.h |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index 6fd0f16..37d0e99 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -73,7 +73,11 @@
 #include <linux/workqueue.h>
 #include <linux/poll.h>
 #include <asm/pgalloc.h>
+#ifdef __KERNEL__
 #include <drm/drm.h>
+#else
+#include "drm.h"
+#endif
 
 #include <linux/idr.h>
 
@@ -83,9 +87,15 @@
 struct drm_file;
 struct drm_device;
 
+#ifdef __KERNEL__
 #include <drm/drm_os_linux.h>
 #include <drm/drm_hashtab.h>
 #include <drm/drm_mm.h>
+#else
+#include "drm_os_linux.h"
+#include "drm_hashtab.h"
+#include "drm_mm.h"
+#endif
 
 #define DRM_UT_CORE 		0x01
 #define DRM_UT_DRIVER		0x02

