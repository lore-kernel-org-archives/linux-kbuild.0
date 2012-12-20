Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:58834 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751745Ab2LTWI5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Dec 2012 17:08:57 -0500
Received: by mail-wg0-f41.google.com with SMTP id ds1so1164409wgb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Dec 2012 14:08:55 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/2] kconfig: document use of CONFIG_ environement variable
Date: Thu, 20 Dec 2012 23:08:46 +0100
Message-Id: <b008e630721656068f3e7e8f724a0b7e90116654.1356041188.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1356041188.git.yann.morin.1998@free.fr>
References: <cover.1356041188.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1356041188.git.yann.morin.1998@free.fr>
References: <cover.1356041188.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Documentation/kbuild/kconfig.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index a09f1a6..b8b77bb 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -46,6 +46,12 @@ KCONFIG_OVERWRITECONFIG
 If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
 break symlinks when .config is a symlink to somewhere else.
 
+CONFIG_
+--------------------------------------------------
+If you set CONFIG_ in the environment, Kconfig will prefix all symbols
+with its value when saving the configuration, instead of using the default,
+"CONFIG_".
+
 ______________________________________________________________________
 Environment variables for '{allyes/allmod/allno/rand}config'
 
-- 
1.7.2.5

