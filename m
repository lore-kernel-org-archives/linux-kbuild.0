Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:33478 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752737AbaIAG0v (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Sep 2014 02:26:51 -0400
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [RFC PATCH v2 11/27] dm-log-userspace.h: include stdint.h in userspace
Date: Mon,  1 Sep 2014 09:26:02 +0300
Message-Id: <1409552778-2537-12-git-send-email-mikko.rapeli@iki.fi>
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

linux/dm-log-userspace.h:416:2: error: unknown type name ‘uint64_t’

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 include/uapi/linux/dm-log-userspace.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/dm-log-userspace.h b/include/uapi/linux/dm-log-userspace.h
index 0fa0d9e..7b9684e 100644
--- a/include/uapi/linux/dm-log-userspace.h
+++ b/include/uapi/linux/dm-log-userspace.h
@@ -7,6 +7,11 @@
 #ifndef __DM_LOG_USERSPACE_H__
 #define __DM_LOG_USERSPACE_H__
 
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
 #include <linux/dm-ioctl.h> /* For DM_UUID_LEN */
 
 /*
-- 
2.1.0

