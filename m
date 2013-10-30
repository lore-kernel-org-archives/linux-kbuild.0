Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:56525 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab3J3VqY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 17:46:24 -0400
Received: by mail-wg0-f51.google.com with SMTP id l18so1896802wgh.6
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2013 14:46:23 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/7] Documentation/kbuild/kconfig.txt: 'make listnewconfig' replaces: yes "" | make oldconfig
Date: Wed, 30 Oct 2013 22:46:14 +0100
Message-Id: <560909d433109e3da08757237f30576c71697914.1383168460.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1383168460.git.yann.morin.1998@free.fr>
References: <cover.1383168460.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Regid Ichira <regid23@nt1.in>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Regid Ichira <regid23@nt1.in>

Signed-off-by: Regid Ichira <regid23@nt1.in>
Acked-by: Rob Landley <rob@landley.net>
[yann.morin.1998@free.fr: fix trailing whitespace, commit subject]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Documentation/kbuild/kconfig.txt | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index 8ef6dbb..bbc99c0 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -20,16 +20,9 @@ symbols have been introduced.
 To see a list of new config symbols when using "make oldconfig", use
 
 	cp user/some/old.config .config
-	yes "" | make oldconfig >conf.new
+	make listnewconfig
 
-and the config program will list as (NEW) any new symbols that have
-unknown values.  Of course, the .config file is also updated with
-new (default) values, so you can use:
-
-	grep "(NEW)" conf.new
-
-to see the new config symbols or you can use diffconfig to see the
-differences between the previous and new .config files:
+and the config program will list any new symbols, one per line.
 
 	scripts/diffconfig .config.old .config | less
 
-- 
1.8.1.2

