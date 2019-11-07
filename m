Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:60222 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389190AbfKGOdB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 09:33:01 -0500
From: shile.zhang@linux.alibaba.com
Subject: [RFC PATCH 4/4] x86/Kconfig: Add a Kconfig option to sort ORC tables at build time
Date: Thu,  7 Nov 2019 22:32:05 +0800
Message-Id: <20191107143205.206606-5-shile.zhang@linux.alibaba.com>
In-Reply-To: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>

From: Shile Zhang <shile.zhang@linux.alibaba.com>

Add a new Kconfig BUILDTIME_ORCTABLE_SORT to control the ORC unwind
tables at build time. Select for ORC unwinder on x86_64 by default.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 arch/x86/Kconfig.debug | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index bf9cd83de777..320ff2af4837 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -335,6 +335,15 @@ config UNWINDER_GUESS
 
 endchoice
 
+config BUILDTIME_ORCTABLE_SORT
+	bool "Sort ORC unwind tables at build time"
+	depends on X86_64
+	depends on UNWINDER_ORC
+	default y
+	help
+	This option enables the build-time sorting for ORC unwind tables. It
+	can help to speed up kernel boot by skip the runtime sorting.
+
 config FRAME_POINTER
 	depends on !UNWINDER_ORC && !UNWINDER_GUESS
 	bool
-- 
2.24.0.rc2
