Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:42977 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752547Ab2KLVJY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Nov 2012 16:09:24 -0500
Received: by mail-wi0-f178.google.com with SMTP id hr7so2851463wib.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Nov 2012 13:09:23 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] Revert "kconfig-language: add to hints"
Date: Mon, 12 Nov 2012 22:09:18 +0100
Message-Id: <1352754558-11021-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Martin Walch <walch.martin@gmx.de>

This reverts commit 64b81ed7fb1e45c914317b20316f32827bc6444b.

As Martin says about this paragraph:
    However, I can not reproduce this. The attached file contains both
    cases. [...] AFAICS, both versions behave equivalently. I suggest
    changing the documentation accordingly.

    [in http://marc.info/?l=linux-kbuild&m=134987006202410&w=2]

Reported-by: Martin Walch <walch.martin@gmx.de>
Cc: Martin Walch <walch.martin@gmx.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Documentation/kbuild/kconfig-language.txt |   23 -----------------------
 1 files changed, 0 insertions(+), 23 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index a686f9c..c858f84 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -388,26 +388,3 @@ config FOO
 	depends on BAR && m
 
 limits FOO to module (=m) or disabled (=n).
-
-Kconfig symbol existence
-~~~~~~~~~~~~~~~~~~~~~~~~
-The following two methods produce the same kconfig symbol dependencies
-but differ greatly in kconfig symbol existence (production) in the
-generated config file.
-
-case 1:
-
-config FOO
-	tristate "about foo"
-	depends on BAR
-
-vs. case 2:
-
-if BAR
-config FOO
-	tristate "about foo"
-endif
-
-In case 1, the symbol FOO will always exist in the config file (given
-no other dependencies).  In case 2, the symbol FOO will only exist in
-the config file if BAR is enabled.
-- 
1.7.2.5

