Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:35216 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752795AbdK0Ved (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:33 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 17/21] lto, workaround: Disable LTO for BPF
Date: Mon, 27 Nov 2017 13:34:19 -0800
Message-Id: <20171127213423.27218-18-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Disable LTO for the BPF interpreter. This works around a gcc bug in the LTO
partitioner that partitions the jumptable used the BPF interpreter
into a different LTO unit. This in term causes assembler
errors because the jump table contains references to the
code labels in the original file.

gcc problem tracked in https://gcc.gnu.org/bugzilla/show_bug.cgi?id=50676

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/bpf/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
index e691da0b3bab..409d4b6762ee 100644
--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -16,3 +16,8 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
 obj-$(CONFIG_BPF_SYSCALL) += stackmap.o
 endif
 obj-$(CONFIG_CGROUP_BPF) += cgroup.o
+
+# various version of gcc have a LTO bug where the &&labels used in the
+# BPF interpreter can cause linker errors when spread incorrectly over
+# partitions. Disable LTO for BPF for now
+CFLAGS_core.o = $(DISABLE_LTO)
-- 
2.13.6

