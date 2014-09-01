Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:36232 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752624AbaIAG0m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Sep 2014 02:26:42 -0400
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [RFC PATCH v2 18/27] scsi_netlink.h: include stdint.h in userspace
Date: Mon,  1 Sep 2014 09:26:09 +0300
Message-Id: <1409552778-2537-19-git-send-email-mikko.rapeli@iki.fi>
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

scsi/scsi_netlink.h:43:2: error: unknown type name ‘uint8_t’

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 include/uapi/scsi/scsi_netlink.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/scsi/scsi_netlink.h b/include/uapi/scsi/scsi_netlink.h
index 62b4eda..9d14592 100644
--- a/include/uapi/scsi/scsi_netlink.h
+++ b/include/uapi/scsi/scsi_netlink.h
@@ -22,8 +22,12 @@
 #ifndef SCSI_NETLINK_H
 #define SCSI_NETLINK_H
 
-#include <linux/netlink.h>
+#ifdef __KERNEL__
 #include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+#include <linux/netlink.h>
 
 /*
  * This file intended to be included by both kernel and user space
-- 
2.1.0

