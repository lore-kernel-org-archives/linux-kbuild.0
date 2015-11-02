Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:64199 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754175AbbKBQ62 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Nov 2015 11:58:28 -0500
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
Date: Mon, 02 Nov 2015 11:58:27 -0500
Message-ID: <1734407.lgNIi16vzN@tjmaciei-mobl4>
In-Reply-To: <563792D1.2040301@infradead.org>
References: <20151102035340.17310681@canb.auug.org.au> <2030804.WKiRYyHexJ@tjmaciei-mobl4> <563792D1.2040301@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1759666.Y5EAeU57h2"
Content-Transfer-Encoding: 7Bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>

This is a multi-part message in MIME format.

--nextPart1759666.Y5EAeU57h2
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 November 2015 08:44:01 Randy Dunlap wrote:
> > Randy, we need a backtrace. The problem is on the function that called
> > first(). Can you make sure the crash generates a core dump, then get the
> > bt
> > from that?
> 
> ASSERT: "!isEmpty()" in file /usr/include/QtCore/qlist.h, line 282
> ../scripts/kconfig/Makefile:22: recipe for target 'xconfig' failed
> make[2]: *** [xconfig] Aborted (core dumped)
[cut]
> #4  0x00007f858c3eec44 in qFatal(char const*, ...) ()
>     at /usr/lib64/libQtCore.so.4
> #5  0x00007f858c3eec8a in  () at /usr/lib64/libQtCore.so.4
> #6  0x00000000004206cc in ConfigList::updateSelection() ()

Thanks, Randy.

This seems to be it:

        if (selectedItems().count() == 0)
                return;

        ConfigItem* item = (ConfigItem*)selectedItems().first();

Which means this shouldn't be happening. I don't know how the list could be 
non-empty in one call and empty in the next.  It's wasteful to call 
selectedItems() twice (it's not a cheap function), but it shouldn't cause this 
issue.

We can easily just cache the result and this is what the attached patch does, 
but given that this error makes no sense to me, I cannot guarantee that you 
don't have another problem elsewhere.

Boris, do you have another idea?
-- 
Thiago Macieira - thiago.macieira (AT) intel.com
  Software Architect - Intel Open Source Technology Center

--nextPart1759666.Y5EAeU57h2
Content-Disposition: attachment; filename="0001-Cache-the-result-of-QTreeWidget-selectedItems.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-Cache-the-result-of-QTreeWidget-selectedItems.patch"

From 32426c8282d0ec48f20000bc8e9a9c89c3060c8d Mon Sep 17 00:00:00 2001
From: Thiago Macieira <thiago.macieira@intel.com>
Date: Mon, 2 Nov 2015 11:55:56 -0500
Subject: [PATCH 1/1] Cache the result of QTreeWidget::selectedItems()

It's not a cheap function, so let's not call it twice.

Signed-off-by: Thiago Macieira <thiago.macieira@intel.com>
---
 scripts/kconfig/qconf.cc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 91b7e6f..920a252 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -400,10 +400,11 @@ void ConfigList::updateSelection(void)
 	struct menu *menu;
 	enum prop_type type;
 
-	if (selectedItems().count() == 0)
+	QList<QTreeWidgetItem *> items = selectedItems();
+	if (items.count() == 0)
 		return;
 
-	ConfigItem* item = (ConfigItem*)selectedItems().first();
+	ConfigItem* item = (ConfigItem*)items.first();
 	if (!item)
 		return;
 
-- 
2.6.2


--nextPart1759666.Y5EAeU57h2--

