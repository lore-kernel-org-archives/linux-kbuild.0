Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:43236 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753012AbeGECrk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 22:47:40 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: document the KBUILD_KCONFIG env. variable
Message-ID: <70d08f42-27e4-ccc2-00f6-266568123d8c@infradead.org>
Date: Wed, 4 Jul 2018 19:47:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Add usage info for the Kbuild environment variable KBUILD_KCONFIG.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/kbuild/kbuild.txt |    5 +++++
 1 file changed, 5 insertions(+)

--- lnx-418-rc3.orig/Documentation/kbuild/kbuild.txt
+++ lnx-418-rc3/Documentation/kbuild/kbuild.txt
@@ -50,6 +50,11 @@ LDFLAGS_MODULE
 --------------------------------------------------
 Additional options used for $(LD) when linking modules.
 
+KBUILD_KCONFIG
+--------------------------------------------------
+Set the top-level Kconfig file to the value of this environment
+variable.  The default name is "Kconfig".
+
 KBUILD_VERBOSE
 --------------------------------------------------
 Set the kbuild verbosity. Can be assigned same values as "V=...".


