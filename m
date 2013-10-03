Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:57994 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754678Ab3JCR0g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Oct 2013 13:26:36 -0400
Received: from tacticalops.localnet ([95.112.171.46]) by smtp.web.de
 (mrweb101) with ESMTPSA (Nemesis) id 0MXYeQ-1VMtNk1Pjq-00WRvS for
 <linux-kbuild@vger.kernel.org>; Thu, 03 Oct 2013 19:26:35 +0200
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH v2 1/5] kconfig: add short explanation to SYMBOL_WRITE
Date: Thu, 03 Oct 2013 19:24:18 +0200
Message-ID: <1756247.WUjWzOprtK@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Benjamin Poirier <bpoirier@suse.de>, Dirk Gouders <dirk@gouders.net>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org

From: Martin Walch <walch.martin@web.de>
Date: Thu, 3 Oct 2013 17:21:23 +0200
Subject: [PATCH v2 1/5] kconfig: add short explanation to SYMBOL_WRITE

replace the question mark in the comment after SYMBOL_WRITE with an explanation

Signed-off-by: Martin Walch <walch.martin@web.de>
---
 scripts/kconfig/expr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index df198a5..ba663e1 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -93,7 +93,7 @@ struct symbol {
 #define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block */
 #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
 #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
-#define SYMBOL_WRITE      0x0200  /* ? */
+#define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_CHANGED    0x0400  /* ? */
 #define SYMBOL_AUTO       0x1000  /* value from environment variable */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
-- 
1.8.1.5


