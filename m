Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46572 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727623AbeHPUFt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Aug 2018 16:05:49 -0400
From: Michal Suchanek <msuchanek@suse.de>
Subject: [PATCH] kbuild: Fix LOADLIBES rename in Documentation/kbuild/makefiles.txt
Date: Thu, 16 Aug 2018 19:05:55 +0200
Message-Id: <20180816170555.21623-1-msuchanek@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Michal Suchanek <msuchanek@suse.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org


Fixes: 8377bd2b9ee1 ("kbuild: Rename HOST_LOADLIBES to
		KBUILD_HOSTLDLIBS")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 Documentation/kbuild/makefiles.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 766355b1d221..7b6a2b2bdc98 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -680,7 +680,7 @@ Both possibilities are described in the following.
 
 	Example:
 		#scripts/kconfig/Makefile
-		HOSTLOADLIBES_qconf := -L$(QTDIR)/lib
+		HOSTLDLIBS_qconf := -L$(QTDIR)/lib
 
 	When linking qconf, it will be passed the extra option
 	"-L$(QTDIR)/lib".
-- 
2.13.7
