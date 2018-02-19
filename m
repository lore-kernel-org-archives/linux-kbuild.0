Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv-mh.provo.novell.com ([137.65.248.74]:40143 "EHLO
        prv-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753099AbeBSO4l (ORCPT
        <rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
        Mon, 19 Feb 2018 09:56:41 -0500
Message-Id: <5A8AF3B602000078001A920C@prv-mh.provo.novell.com>
Date: Mon, 19 Feb 2018 07:56:38 -0700
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] kconfig: really drop GENERIC_IO
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: robh@kernel.org, richard@nod.at

Commit 9de8da4774 ("kconfig: kill off GENERIC_IO option") dropped the
option, but left a "select" of it in place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 lib/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- 4.16-rc2/lib/Kconfig
+++ 4.16-rc2-Kconfig-GENERIC_IO/lib/Kconfig
@@ -396,7 +396,6 @@ config ASSOCIATIVE_ARRAY
 config HAS_IOMEM
 	bool
 	depends on !NO_IOMEM
-	select GENERIC_IO
 	default y
 
 config HAS_IOPORT_MAP



