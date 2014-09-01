Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:60438 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752619AbaIAG0k (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Sep 2014 02:26:40 -0400
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [RFC PATCH v2 19/27] scsi_netlink_fc.h: include stdint.h in userspace
Date: Mon,  1 Sep 2014 09:26:10 +0300
Message-Id: <1409552778-2537-20-git-send-email-mikko.rapeli@iki.fi>
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

scsi/scsi_netlink_fc.h:60:2: error: expected specifier-qualifier-list before ‘uint64_t’

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 include/uapi/scsi/scsi_netlink_fc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/scsi/scsi_netlink_fc.h b/include/uapi/scsi/scsi_netlink_fc.h
index cbf76e4..d969337 100644
--- a/include/uapi/scsi/scsi_netlink_fc.h
+++ b/include/uapi/scsi/scsi_netlink_fc.h
@@ -21,6 +21,11 @@
 #ifndef SCSI_NETLINK_FC_H
 #define SCSI_NETLINK_FC_H
 
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
 #include <scsi/scsi_netlink.h>
 
 /*
-- 
2.1.0

