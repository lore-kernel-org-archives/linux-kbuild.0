Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42522 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfIRJoi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Sep 2019 05:44:38 -0400
From: Erwan Velu <erwanaliasr1@gmail.com>
Subject: [PATCH 1/3] firmware/dmi_scan: Add dmi_save_release to save releases fields
Date: Wed, 18 Sep 2019 11:43:19 +0200
Message-Id: <20190918094323.17515-1-e.velu@criteo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Erwan Velu <e.velu@criteo.com>, Jean Delvare <jdelvare@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@linaro.org>, Changbin Du <changbin.du@intel.com>, Boris Brezillon <bbrezillon@kernel.org>, "Robert P. J. Day" <rpjday@crashcourse.ca>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

In DMI type 0, there is several fields that encodes a release.
The dmi_save_release() function have the logic to check if the field is valid.
If so, it reports the actual value.

Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/firmware/dmi_scan.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 35ed56b9c34f..202bd2c69d0f 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -181,6 +181,32 @@ static void __init dmi_save_ident(const struct dmi_header *dm, int slot,
 	dmi_ident[slot] = p;
 }
 
+static void __init dmi_save_release(const struct dmi_header *dm, int slot,
+		int index)
+{
+	const u8 *d;
+	char *s;
+
+	// If the table doesn't have the field, let's return
+	if (dmi_ident[slot] || dm->length < index)
+		return;
+
+	d = (u8 *) dm + index;
+
+	// As per the specification,
+	// if the system doesn't have the field, the value is FF
+	if (d[0] == 0xFF)
+		return;
+
+	s = dmi_alloc(4);
+	if (!s)
+		return;
+
+	sprintf(s, "%u", d[0]);
+
+	dmi_ident[slot] = s;
+}
+
 static void __init dmi_save_uuid(const struct dmi_header *dm, int slot,
 		int index)
 {
-- 
2.21.0
