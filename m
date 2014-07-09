Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53572 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755189AbaGILga (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 07:36:30 -0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [RFC/PATCH RESEND -next 05/21] x86: cpu: don't sanitize early stages
 of a secondary CPU boot
Date: Wed, 09 Jul 2014 15:29:59 +0400
Message-id: <1404905415-9046-6-git-send-email-a.ryabinin@samsung.com>
In-reply-to: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, Andrey Ryabinin <a.ryabinin@samsung.com>

Instrumentation of this files may result in unbootable machine.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
---
 arch/x86/kernel/cpu/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index 7fd54f0..a7bb360 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -8,6 +8,9 @@ CFLAGS_REMOVE_common.o = -pg
 CFLAGS_REMOVE_perf_event.o = -pg
 endif
 
+KASAN_SANITIZE_common.o := n
+KASAN_SANITIZE_perf_event.o := n
+
 # Make sure load_percpu_segment has no stackprotector
 nostackp := $(call cc-option, -fno-stack-protector)
 CFLAGS_common.o		:= $(nostackp)
-- 
1.8.5.5

