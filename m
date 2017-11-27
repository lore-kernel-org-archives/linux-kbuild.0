Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:30248 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752275AbdK0Veb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:31 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 21/21] x86: Enable Link Time Optimization
Date: Mon, 27 Nov 2017 13:34:23 -0800
Message-Id: <20171127213423.27218-22-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

LTO is opt-in per architecture because it usually needs some
fixes.

LTO needs THIN_ARCHIVES because standard binutils doesn't like mixing
assembler and LTO code with ld -r.

Enable LTO and THIN_ARCHIVES for x86

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 8eed3f94bfc7..92650726f908 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -122,6 +122,8 @@ config X86
 	select HAVE_ARCH_VMAP_STACK		if X86_64
 	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_CC_STACKPROTECTOR
+	select THIN_ARCHIVES			if LTO
+	select ARCH_SUPPORTS_LTO
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING		if X86_64
-- 
2.13.6

