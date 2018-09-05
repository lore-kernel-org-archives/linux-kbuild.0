Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36964 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726189AbeIEUZa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 16:25:30 -0400
Subject: [PATCH 01/11] UAPI: drm: Fix use of C++ keywords as structural
 members
From: David Howells <dhowells@redhat.com>
Date: Wed, 05 Sep 2018 16:54:40 +0100
Message-ID: <153616288089.23468.4502511671693917281.stgit@warthog.procyon.org.uk>
In-Reply-To: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, dhowells@redhat.com

The i810 and msm drm drivers use C++ keywords as structural members.  Fix
this by inserting an anonymous union that provides an alternative name and
then hide the reserved name in C++.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Rob Clark <robdclark@gmail.com>
cc: David Airlie <airlied@linux.ie>
cc: linux-arm-msm@vger.kernel.org
cc: dri-devel@lists.freedesktop.org
cc: freedreno@lists.freedesktop.org
---

 include/uapi/drm/i810_drm.h |    7 ++++++-
 include/uapi/drm/msm_drm.h  |    7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/i810_drm.h b/include/uapi/drm/i810_drm.h
index d285d5e72e6a..617d79ec3fc5 100644
--- a/include/uapi/drm/i810_drm.h
+++ b/include/uapi/drm/i810_drm.h
@@ -266,7 +266,12 @@ typedef struct _drm_i810_copy_t {
 #define PR_MASK              (0x7<<18)
 
 typedef struct drm_i810_dma {
-	void *virtual;
+	union {
+#ifndef __cplusplus
+		void *virtual;
+#endif
+		void *_virtual;
+	};
 	int request_idx;
 	int request_size;
 	int granted;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index c06d0a5bdd80..e99bab72d58c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -148,7 +148,12 @@ struct drm_msm_gem_cpu_fini {
  */
 struct drm_msm_gem_submit_reloc {
 	__u32 submit_offset;  /* in, offset from submit_bo */
-	__u32 or;             /* in, value OR'd with result */
+	union {
+#ifndef __cplusplus
+		__u32 or;	/* in, value OR'd with result */
+#endif
+		__u32 _or;	/* in, value OR'd with result */
+	};
 	__s32 shift;          /* in, amount of left shift (can be negative) */
 	__u32 reloc_idx;      /* in, index of reloc_bo buffer */
 	__u64 reloc_offset;   /* in, offset from start of reloc_bo */
