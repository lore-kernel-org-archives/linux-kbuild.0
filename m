Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f201.google.com ([209.85.221.201]:40968 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393092AbfIFKdM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 06:33:12 -0400
Received: by mail-vk1-f201.google.com with SMTP id g11so2220015vkm.8
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2019 03:33:11 -0700 (PDT)
Date: Fri,  6 Sep 2019 11:32:34 +0100
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
Message-Id: <20190906103235.197072-11-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190906103235.197072-1-maennich@google.com>
Subject: [PATCH v5 10/11] usb-storage: remove single-use define for debugging
From: Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, maennich@google.com, arnd@arndb.de, gregkh@linuxfoundation.org, jeyu@kernel.org, joel@joelfernandes.org, lucas.de.marchi@gmail.com, maco@android.com, sspatil@google.com, will@kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net

USB_STORAGE was defined as "usb-storage: " and used in a single location
as argument to printk. In order to be able to use the name
'USB_STORAGE', drop the definition and use the string directly for the
printk call.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 drivers/usb/storage/debug.h    | 2 --
 drivers/usb/storage/scsiglue.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/storage/debug.h b/drivers/usb/storage/debug.h
index 6d64f342f587..16ce06039a4d 100644
--- a/drivers/usb/storage/debug.h
+++ b/drivers/usb/storage/debug.h
@@ -29,8 +29,6 @@
 
 #include <linux/kernel.h>
 
-#define USB_STORAGE "usb-storage: "
-
 #ifdef CONFIG_USB_STORAGE_DEBUG
 void usb_stor_show_command(const struct us_data *us, struct scsi_cmnd *srb);
 void usb_stor_show_sense(const struct us_data *us, unsigned char key,
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 05b80211290d..df4de8323eff 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -379,7 +379,7 @@ static int queuecommand_lck(struct scsi_cmnd *srb,
 
 	/* check for state-transition errors */
 	if (us->srb != NULL) {
-		printk(KERN_ERR USB_STORAGE "Error in %s: us->srb = %p\n",
+		printk(KERN_ERR "usb-storage: Error in %s: us->srb = %p\n",
 			__func__, us->srb);
 		return SCSI_MLQUEUE_HOST_BUSY;
 	}
-- 
2.23.0.187.g17f5b7556c-goog
