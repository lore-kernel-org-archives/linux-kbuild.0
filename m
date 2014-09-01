Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:41185 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752610AbaIAG0k (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Sep 2014 02:26:40 -0400
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [RFC PATCH v2 27/27] sis_drm.h: hide sis_file_private in userspace
Date: Mon,  1 Sep 2014 09:26:18 +0300
Message-Id: <1409552778-2537-28-git-send-email-mikko.rapeli@iki.fi>
In-Reply-To: <1409552778-2537-1-git-send-email-mikko.rapeli@iki.fi>
References: <1408660449-4011-1-git-send-email-mikko.rapeli@iki.fi>
 <1409552778-2537-1-git-send-email-mikko.rapeli@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, mikko.rapeli@iki.fi

Fixes compiler error:

drm/sis_drm.h:68:19: error: field ‘obj_list’ has incomplete type
  struct list_head obj_list;

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 include/uapi/drm/sis_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/sis_drm.h b/include/uapi/drm/sis_drm.h
index df37632..3d0903f 100644
--- a/include/uapi/drm/sis_drm.h
+++ b/include/uapi/drm/sis_drm.h
@@ -64,8 +64,10 @@ typedef struct {
 	unsigned long offset, size;
 } drm_sis_fb_t;
 
+#ifdef __KERNEL__
 struct sis_file_private {
 	struct list_head obj_list;
 };
+#endif
 
 #endif				/* __SIS_DRM_H__ */
-- 
2.1.0

