Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40584 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0PJh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Nov 2019 10:09:37 -0500
From: Erwan Velu <erwanaliasr1@gmail.com>
Subject: [PATCH 1/2] firmware/dmi: Report DMI Bios release
Date: Wed, 27 Nov 2019 16:07:25 +0100
Message-Id: <20191127150729.860625-1-e.velu@criteo.com>
In-Reply-To: <20190918094323.17515-1-e.velu@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Erwan Velu <e.velu@criteo.com>, Jean Delvare <jdelvare@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, "David S. Miller" <davem@davemloft.net>, Changbin Du <changbin.du@intel.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Some vendors like HPe or Dell, encode the release version of their BIOS
in the "System BIOS {Major|Minor} Release" fields of Type 0.

This information is used to know which bios release actually runs.
It could be used for some quirks, debugging sessions or inventory tasks.

A typical output for a Dell system running the 65.27 bios is :

	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
	65.27
	[root@t1700 ~]#

This commit add  dmi_save_release() function have the logic to
check if the field is valid. If so, it reports the actual value.

Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/firmware/dmi-id.c       |  3 +++
 drivers/firmware/dmi_scan.c     | 29 +++++++++++++++++++++++++++++
 include/linux/mod_devicetable.h |  1 +
 scripts/mod/file2alias.c        |  1 +
 4 files changed, 34 insertions(+)

diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
index ff39f64f2aae..a2aac65ff771 100644
--- a/drivers/firmware/dmi-id.c
+++ b/drivers/firmware/dmi-id.c
@@ -42,6 +42,7 @@ DEFINE_DMI_ATTR_WITH_SHOW(bios_vendor,		0444, DMI_BIOS_VENDOR);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_version,		0444, DMI_BIOS_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_date,		0444, DMI_BIOS_DATE);
 DEFINE_DMI_ATTR_WITH_SHOW(sys_vendor,		0444, DMI_SYS_VENDOR);
+DEFINE_DMI_ATTR_WITH_SHOW(bios_release,         0444, DMI_BIOS_RELEASE);
 DEFINE_DMI_ATTR_WITH_SHOW(product_name,		0444, DMI_PRODUCT_NAME);
 DEFINE_DMI_ATTR_WITH_SHOW(product_version,	0444, DMI_PRODUCT_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(product_serial,	0400, DMI_PRODUCT_SERIAL);
@@ -78,6 +79,7 @@ static ssize_t get_modalias(char *buffer, size_t buffer_size)
 		{ "bvn", DMI_BIOS_VENDOR },
 		{ "bvr", DMI_BIOS_VERSION },
 		{ "bd",  DMI_BIOS_DATE },
+		{ "br",  DMI_BIOS_RELEASE },
 		{ "svn", DMI_SYS_VENDOR },
 		{ "pn",  DMI_PRODUCT_NAME },
 		{ "pvr", DMI_PRODUCT_VERSION },
@@ -187,6 +189,7 @@ static void __init dmi_id_init_attr_table(void)
 	ADD_DMI_ATTR(bios_vendor,       DMI_BIOS_VENDOR);
 	ADD_DMI_ATTR(bios_version,      DMI_BIOS_VERSION);
 	ADD_DMI_ATTR(bios_date,         DMI_BIOS_DATE);
+	ADD_DMI_ATTR(bios_release,      DMI_BIOS_RELEASE);
 	ADD_DMI_ATTR(sys_vendor,        DMI_SYS_VENDOR);
 	ADD_DMI_ATTR(product_name,      DMI_PRODUCT_NAME);
 	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 1e21fc3e9851..d010c915c1ab 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -181,6 +181,34 @@ static void __init dmi_save_ident(const struct dmi_header *dm, int slot,
 	dmi_ident[slot] = p;
 }
 
+static void __init dmi_save_release(const struct dmi_header *dm, int slot,
+		int index)
+{
+	const u8 *minor, *major;
+	char *s;
+
+	/* If the table doesn't have the field, let's return */
+	if (dmi_ident[slot] || dm->length < index)
+		return;
+
+	minor = (u8 *) dm + index;
+	major = (u8 *) dm + index - 1;
+
+	/* As per the spec, if the system doesn't support this field,
+	 * the value is FF
+	 */
+	if (major[0] == 0xFF && minor[0] == 0xFF)
+		return;
+
+	s = dmi_alloc(4);
+	if (!s)
+		return;
+
+	sprintf(s, "%u.%u", major[0], minor[0]);
+
+	dmi_ident[slot] = s;
+}
+
 static void __init dmi_save_uuid(const struct dmi_header *dm, int slot,
 		int index)
 {
@@ -438,6 +466,7 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
 		dmi_save_ident(dm, DMI_BIOS_VENDOR, 4);
 		dmi_save_ident(dm, DMI_BIOS_VERSION, 5);
 		dmi_save_ident(dm, DMI_BIOS_DATE, 8);
+		dmi_save_release(dm, DMI_BIOS_RELEASE, 21);
 		break;
 	case 1:		/* System Information */
 		dmi_save_ident(dm, DMI_SYS_VENDOR, 4);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5714fd35a83c..618933d770e6 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -532,6 +532,7 @@ enum dmi_field {
 	DMI_BIOS_VENDOR,
 	DMI_BIOS_VERSION,
 	DMI_BIOS_DATE,
+	DMI_BIOS_RELEASE,
 	DMI_SYS_VENDOR,
 	DMI_PRODUCT_NAME,
 	DMI_PRODUCT_VERSION,
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index c91eba751804..cc48930cc02a 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -936,6 +936,7 @@ static const struct dmifield {
 	{ "bvn", DMI_BIOS_VENDOR },
 	{ "bvr", DMI_BIOS_VERSION },
 	{ "bd",  DMI_BIOS_DATE },
+	{ "br",  DMI_BIOS_RELEASE },
 	{ "svn", DMI_SYS_VENDOR },
 	{ "pn",  DMI_PRODUCT_NAME },
 	{ "pvr", DMI_PRODUCT_VERSION },
-- 
2.23.0
