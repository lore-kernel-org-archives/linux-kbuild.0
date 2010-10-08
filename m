Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:55788 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680Ab0JHACG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:06 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 04/33] Staging: comedi: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:24 -0400
Message-Id: <1286496113-11897-4-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/comedi/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/comedi/Makefile b/drivers/staging/comedi/Makefile
index 20afea3..8dbd306 100644
--- a/drivers/staging/comedi/Makefile
+++ b/drivers/staging/comedi/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_COMEDI) += comedi.o
 obj-$(CONFIG_COMEDI)	+= kcomedilib/
 obj-$(CONFIG_COMEDI)	+= drivers/
 
-comedi-objs :=		\
+comedi-y :=		\
 	comedi_fops.o	\
 	proc.o		\
 	range.o		\
-- 
1.7.3.1.50.g1e633

