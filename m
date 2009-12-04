Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:37092 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932236AbZLDU6y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2009 15:58:54 -0500
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] score: add asm/asm-offsets.h wrapper
Date: Fri,  4 Dec 2009 20:58:26 +0000
Message-Id: <1259960306-19921-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>

A recent kbuild patch moved asm-offsets.h to include/generated. Provide
a wrapper header as for other architectures.

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 arch/score/include/asm/asm-offsets.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 arch/score/include/asm/asm-offsets.h

diff --git a/arch/score/include/asm/asm-offsets.h b/arch/score/include/asm/asm-offsets.h
new file mode 100644
index 0000000..d370ee3
--- /dev/null
+++ b/arch/score/include/asm/asm-offsets.h
@@ -0,0 +1 @@
+#include <generated/asm-offsets.h>
-- 
1.6.5.3

