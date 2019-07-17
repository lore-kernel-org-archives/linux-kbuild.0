Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:63126 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfGQGSa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:30 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 04/12] scsi: remove pointless $(MODVERDIR)/$(obj)/53c700.ver
Date: Wed, 17 Jul 2019 15:17:52 +0900
Message-Id: <20190717061800.10018-5-yamada.masahiro@socionext.com>
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org

Nothing depends on this, so it is dead code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 drivers/scsi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/Makefile b/drivers/scsi/Makefile
index aeda53901064..c00e3dd57990 100644
--- a/drivers/scsi/Makefile
+++ b/drivers/scsi/Makefile
@@ -185,7 +185,7 @@ zalon7xx-objs	:= zalon.o ncr53c8xx.o
 # Files generated that shall be removed upon make clean
 clean-files :=	53c700_d.h 53c700_u.h scsi_devinfo_tbl.c
 
-$(obj)/53c700.o $(MODVERDIR)/$(obj)/53c700.ver: $(obj)/53c700_d.h
+$(obj)/53c700.o: $(obj)/53c700_d.h
 
 $(obj)/scsi_sysfs.o: $(obj)/scsi_devinfo_tbl.c
 
-- 
2.17.1
