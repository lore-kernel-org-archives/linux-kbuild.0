Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48688 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753278Ab2HSC5e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:34 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 02/74] sections: Make all standard section identifiers __visible
Date: Sat, 18 Aug 2012 19:55:58 -0700
Message-Id: <1345345030-22211-3-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/asm-generic/sections.h |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index c1a1216..eab95aa 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -3,20 +3,20 @@
 
 /* References to section boundaries */
 
-extern char _text[], _stext[], _etext[];
-extern char _data[], _sdata[], _edata[];
-extern char __bss_start[], __bss_stop[];
-extern char __init_begin[], __init_end[];
-extern char _sinittext[], _einittext[];
-extern char _end[];
-extern char __per_cpu_load[], __per_cpu_start[], __per_cpu_end[];
-extern char __kprobes_text_start[], __kprobes_text_end[];
-extern char __entry_text_start[], __entry_text_end[];
-extern char __initdata_begin[], __initdata_end[];
-extern char __start_rodata[], __end_rodata[];
+extern __visible char _text[], _stext[], _etext[];
+extern __visible char _data[], _sdata[], _edata[];
+extern __visible char __bss_start[], __bss_stop[];
+extern __visible char __init_begin[], __init_end[];
+extern __visible char _sinittext[], _einittext[];
+extern __visible char _end[];
+extern __visible char __per_cpu_load[], __per_cpu_start[], __per_cpu_end[];
+extern __visible char __kprobes_text_start[], __kprobes_text_end[];
+extern __visible char __entry_text_start[], __entry_text_end[];
+extern __visible char __initdata_begin[], __initdata_end[];
+extern __visible char __start_rodata[], __end_rodata[];
 
 /* Start and end of .ctors section - used for constructor calls. */
-extern char __ctors_start[], __ctors_end[];
+extern __visible char __ctors_start[], __ctors_end[];
 
 /* function descriptor handling (if any).  Override
  * in asm/sections.h */
-- 
1.7.7.6

