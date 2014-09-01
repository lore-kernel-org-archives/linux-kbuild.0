Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:54158 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752734AbaIAG0u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Sep 2014 02:26:50 -0400
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [RFC PATCH v2 12/27] hsi_char.h: include stdint.h in userspace
Date: Mon,  1 Sep 2014 09:26:03 +0300
Message-Id: <1409552778-2537-13-git-send-email-mikko.rapeli@iki.fi>
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

linux/hsi/hsi_char.h:51:2: error: unknown type name ‘uint32_t’

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 include/uapi/linux/hsi/hsi_char.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/hsi/hsi_char.h b/include/uapi/linux/hsi/hsi_char.h
index 76160b4..9fa8f91 100644
--- a/include/uapi/linux/hsi/hsi_char.h
+++ b/include/uapi/linux/hsi/hsi_char.h
@@ -20,10 +20,15 @@
  * 02110-1301 USA
  */
 
-
 #ifndef __HSI_CHAR_H
 #define __HSI_CHAR_H
 
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
 #define HSI_CHAR_MAGIC		'k'
 #define HSC_IOW(num, dtype)	_IOW(HSI_CHAR_MAGIC, num, dtype)
 #define HSC_IOR(num, dtype)	_IOR(HSI_CHAR_MAGIC, num, dtype)
-- 
2.1.0

