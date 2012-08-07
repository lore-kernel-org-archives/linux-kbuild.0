Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:59526 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932967Ab2HGXAw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Aug 2012 19:00:52 -0400
Message-ID: <50219DD4.7020406@xenotime.net>
Date: Tue, 07 Aug 2012 15:59:32 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: [PATCH] scripts/kernel-doc: drop maintainer
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Rob Landley <rob@landley.net>

From: Randy Dunlap <rdunlap@xenotime.net>

Drop maintainership of scripts/kernel-doc.
Patches can go thru the kbuild tree.

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	Michal Marek <mmarek@suse.cz>
Cc:	Rob Landley <rob@landley.net>
---
 MAINTAINERS |    5 -----
 1 file changed, 5 deletions(-)


Michal, is this OK with you?
If so, please merge, and then I have 3 patches to
scripts/kernel-doc for you (from someone else).


--- lnx-36-rc1.orig/MAINTAINERS
+++ lnx-36-rc1/MAINTAINERS
@@ -2373,11 +2373,6 @@ S:	Maintained
 F:	Documentation/hwmon/dme1737
 F:	drivers/hwmon/dme1737.c
 
-DOCBOOK FOR DOCUMENTATION
-M:	Randy Dunlap <rdunlap@xenotime.net>
-S:	Maintained
-F:	scripts/kernel-doc
-
 DOCKING STATION DRIVER
 M:	Shaohua Li <shaohua.li@intel.com>
 L:	linux-acpi@vger.kernel.org
