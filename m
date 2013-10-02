Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:55950 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753089Ab3JBFYo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 01:24:44 -0400
Received: from tacticalops.localnet ([93.132.133.153]) by smtp.web.de
 (mrweb101) with ESMTPSA (Nemesis) id 0MgOL4-1VEfcK2UGE-00NgMC for
 <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2013 07:24:42 +0200
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH 4/4] kconfig: remove unused definition from scanner
Date: Wed, 02 Oct 2013 07:24:40 +0200
Message-ID: <6249343.9Mjtul3lu5@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Benjamin Poirier <bpoirier@suse.de>, Dirk Gouders <dirk@gouders.net>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, Alan Cox <alan@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Martin Walch <walch.martin@web.de>
Date: Wed, 2 Oct 2013 06:58:46 +0200
Subject: [PATCH 4/4] kconfig: remove unused definition from scanner

The definition ws [ \n\t] is not used anywhere. Drop it to avoid confusion.

Signed-off-by: Martin Walch <walch.martin@web.de>
---
 scripts/kconfig/zconf.l | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 6555a47..1a9f53e 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -68,7 +68,6 @@ static void alloc_string(const char *str, int size)
 }
 %}
 
-ws	[ \n\t]
 n	[A-Za-z0-9_]
 
 %%
-- 
1.8.1.5


