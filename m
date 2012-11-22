Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:53957 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753979Ab2KVTAH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Nov 2012 14:00:07 -0500
Received: by mail-we0-f174.google.com with SMTP id d7so2106174wer.19
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Nov 2012 11:00:06 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/3] scripts/kconfig: ensure we use proper CONFIG_ prefix
Date: Thu, 22 Nov 2012 01:06:04 +0100
Message-Id: <1353542766-24422-2-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr>
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Now that we get the CONFIG_ prefix from the environment, we must
ensure we use the proper prefix in case the user has it set in
the environment.

Simply unexport CONFIG_ to fallback to our hard-coded default.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 3091794..231b475 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -11,6 +11,9 @@ else
 Kconfig := Kconfig
 endif
 
+# We need this, in case the user has it in its environment
+unexport CONFIG_
+
 xconfig: $(obj)/qconf
 	$< $(Kconfig)
 
-- 
1.7.2.5

