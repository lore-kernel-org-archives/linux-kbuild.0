Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:60161 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752358AbaIAG0a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Sep 2014 02:26:30 -0400
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [RFC PATCH v2 06/27] drm_mode.h: include stdint.h and linux/types.h in userspace
Date: Mon,  1 Sep 2014 09:25:57 +0300
Message-Id: <1409552778-2537-7-git-send-email-mikko.rapeli@iki.fi>
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

Fixes compilation error:

drm/drm_mode.h:472:2: error: unknown type name ‘uint32_t’

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 include/uapi/drm/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index f104c26..93b25bae 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -27,7 +27,12 @@
 #ifndef _DRM_MODE_H
 #define _DRM_MODE_H
 
+#ifdef __KERNEL__
 #include <linux/types.h>
+#else
+#include <stdint.h>
+#include <linux/types.h>
+#endif
 
 #define DRM_DISPLAY_INFO_LEN	32
 #define DRM_CONNECTOR_NAME_LEN	32
-- 
2.1.0

