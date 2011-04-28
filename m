Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:58253 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757691Ab1D1R6z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2011 13:58:55 -0400
Date: Thu, 28 Apr 2011 10:58:52 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH] kconfig-language: add to hints
Message-Id: <20110428105852.975a6583.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

From: Randy Dunlap <randy.dunlap@oracle.com>

Explain a little about kconfig symbol dependencies and symbol
existence given optional kconfig language scenarios.
Yes, I was bitten by this.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 Documentation/kbuild/kconfig-language.txt |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

--- lnx-2639-rc5.orig/Documentation/kbuild/kconfig-language.txt
+++ lnx-2639-rc5/Documentation/kbuild/kconfig-language.txt
@@ -381,3 +381,25 @@ config FOO
 
 limits FOO to module (=m) or disabled (=n).
 
+Kconfig symbol existence
+~~~~~~~~~~~~~~~~~~~~~~~~
+The following two methods produce the same kconfig symbol dependencies
+but differ greatly in kconfig symbol existence (production) in the
+generated config file.
+
+case 1:
+
+config FOO
+	tristate "about foo"
+	depends on BAR
+
+vs. case 2:
+
+if BAR
+config FOO
+	tristate "about foo"
+endif
+
+In case 1, the symbol FOO will always exist in the config file (given
+no other dependencies).  In case 2, the symbol FOO will only exist in
+the config file if BAR is enabled.
