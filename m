Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38438 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfIRJot (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Sep 2019 05:44:49 -0400
From: Erwan Velu <erwanaliasr1@gmail.com>
Subject: [PATCH 3/3] firmware/dmi: Report DMI Embedded Firmware release
Date: Wed, 18 Sep 2019 11:43:21 +0200
Message-Id: <20190918094323.17515-3-e.velu@criteo.com>
In-Reply-To: <20190918094323.17515-1-e.velu@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Erwan Velu <e.velu@criteo.com>, Jean Delvare <jdelvare@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Boris Brezillon <bbrezillon@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, Changbin Du <changbin.du@intel.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Servers that have a BMC encodes the release version of their firmware
in the "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.

This information is useful to know which release of the BMC is actually running.
It could be used for some quirks, debugging sessions or inventory tasks.

This patch extract these 2 fields in DMI_EMBEDDED_FW_MAJOR_RELEASE & DMI_EMBEDDED_FW_MINOR_RELEASE

A typical output for a Dell system running the 3.75 bios is :

    [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/fw_release_major
    3
    [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/fw_release_minor
    75
    [root@t1700 ~]#

Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/firmware/dmi-id.c       | 10 ++++++++--
 drivers/firmware/dmi_scan.c     |  2 ++
 include/linux/mod_devicetable.h |  2 ++
 scripts/mod/file2alias.c        |  2 ++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
index 3248c2837a4d..5262626bf9f1 100644
--- a/drivers/firmware/dmi-id.c
+++ b/drivers/firmware/dmi-id.c
@@ -42,8 +42,10 @@ DEFINE_DMI_ATTR_WITH_SHOW(bios_vendor,		0444, DMI_BIOS_VENDOR);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_version,		0444, DMI_BIOS_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_date,		0444, DMI_BIOS_DATE);
 DEFINE_DMI_ATTR_WITH_SHOW(sys_vendor,		0444, DMI_SYS_VENDOR);
-DEFINE_DMI_ATTR_WITH_SHOW(bios_release_major, 0444, DMI_BIOS_MAJOR_RELEASE);
-DEFINE_DMI_ATTR_WITH_SHOW(bios_release_minor, 0444, DMI_BIOS_MINOR_RELEASE);
+DEFINE_DMI_ATTR_WITH_SHOW(bios_release_major,	0444, DMI_BIOS_MAJOR_RELEASE);
+DEFINE_DMI_ATTR_WITH_SHOW(bios_release_minor,	0444, DMI_BIOS_MINOR_RELEASE);
+DEFINE_DMI_ATTR_WITH_SHOW(fw_release_major,	0444, DMI_EMBEDDED_FW_MAJOR_RELEASE);
+DEFINE_DMI_ATTR_WITH_SHOW(fw_release_minor,	0444, DMI_EMBEDDED_FW_MINOR_RELEASE);
 DEFINE_DMI_ATTR_WITH_SHOW(product_name,		0444, DMI_PRODUCT_NAME);
 DEFINE_DMI_ATTR_WITH_SHOW(product_version,	0444, DMI_PRODUCT_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(product_serial,	0400, DMI_PRODUCT_SERIAL);
@@ -82,6 +84,8 @@ static ssize_t get_modalias(char *buffer, size_t buffer_size)
 		{ "bd",  DMI_BIOS_DATE },
 		{ "bjr", DMI_BIOS_MAJOR_RELEASE },
 		{ "bmr", DMI_BIOS_MINOR_RELEASE },
+		{ "efj", DMI_EMBEDDED_FW_MAJOR_RELEASE },
+		{ "efm", DMI_EMBEDDED_FW_MINOR_RELEASE },
 		{ "svn", DMI_SYS_VENDOR },
 		{ "pn",  DMI_PRODUCT_NAME },
 		{ "pvr", DMI_PRODUCT_VERSION },
@@ -193,6 +197,8 @@ static void __init dmi_id_init_attr_table(void)
 	ADD_DMI_ATTR(bios_date,         DMI_BIOS_DATE);
 	ADD_DMI_ATTR(bios_release_major, DMI_BIOS_MAJOR_RELEASE);
 	ADD_DMI_ATTR(bios_release_minor, DMI_BIOS_MINOR_RELEASE);
+	ADD_DMI_ATTR(fw_release_major,  DMI_EMBEDDED_FW_MAJOR_RELEASE);
+	ADD_DMI_ATTR(fw_release_minor,  DMI_EMBEDDED_FW_MINOR_RELEASE);
 	ADD_DMI_ATTR(sys_vendor,        DMI_SYS_VENDOR);
 	ADD_DMI_ATTR(product_name,      DMI_PRODUCT_NAME);
 	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 886ace54e527..3beec6896a58 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -466,6 +466,8 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
 		dmi_save_ident(dm, DMI_BIOS_DATE, 8);
 		dmi_save_release(dm, DMI_BIOS_MAJOR_RELEASE, 20);
 		dmi_save_release(dm, DMI_BIOS_MINOR_RELEASE, 21);
+		dmi_save_release(dm, DMI_EMBEDDED_FW_MAJOR_RELEASE, 22);
+		dmi_save_release(dm, DMI_EMBEDDED_FW_MINOR_RELEASE, 23);
 		break;
 	case 1:		/* System Information */
 		dmi_save_ident(dm, DMI_SYS_VENDOR, 4);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 2471de601bd6..e6482fd94bfd 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -534,6 +534,8 @@ enum dmi_field {
 	DMI_BIOS_DATE,
 	DMI_BIOS_MAJOR_RELEASE,
 	DMI_BIOS_MINOR_RELEASE,
+	DMI_EMBEDDED_FW_MAJOR_RELEASE,
+	DMI_EMBEDDED_FW_MINOR_RELEASE,
 	DMI_SYS_VENDOR,
 	DMI_PRODUCT_NAME,
 	DMI_PRODUCT_VERSION,
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 1b4f9bc3b06c..ce03040271cd 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -933,6 +933,8 @@ static const struct dmifield {
 	{ "bd",  DMI_BIOS_DATE },
 	{ "bjr", DMI_BIOS_MAJOR_RELEASE },
 	{ "bmr", DMI_BIOS_MINOR_RELEASE },
+	{ "efj", DMI_EMBEDDED_FW_MAJOR_RELEASE },
+	{ "efm", DMI_EMBEDDED_FW_MINOR_RELEASE },
 	{ "svn", DMI_SYS_VENDOR },
 	{ "pn",  DMI_PRODUCT_NAME },
 	{ "pvr", DMI_PRODUCT_VERSION },
-- 
2.21.0
