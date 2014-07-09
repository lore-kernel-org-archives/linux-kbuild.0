Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:45164 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755596AbaGILgp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 07:36:45 -0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [RFC/PATCH RESEND -next 16/21] arm: boot: compressed: disable kasan's
 instrumentation
Date: Wed, 09 Jul 2014 15:30:10 +0400
Message-id: <1404905415-9046-17-git-send-email-a.ryabinin@samsung.com>
In-reply-to: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, Andrey Ryabinin <a.ryabinin@samsung.com>

To avoid build errors, compiler's instrumentation used for kernel
address sanitizer, must be disabled for code not linked with kernel.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
---
 arch/arm/boot/compressed/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 76a50ec..03f2976 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -4,6 +4,8 @@
 # create a compressed vmlinuz image from the original vmlinux
 #
 
+KASAN_SANITIZE := n
+
 OBJS		=
 
 # Ensure that MMCIF loader code appears early in the image
-- 
1.8.5.5

