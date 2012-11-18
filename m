Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:63407 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752640Ab2KRVEv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 18 Nov 2012 16:04:51 -0500
From: pefoley2@verizon.net
Subject: [PATCH 5/5] x86: add dummy rules to avoid 'nothing to be done' messages
Date: Sun, 18 Nov 2012 15:05:17 -0500
Message-id: <1353269117-39917-5-git-send-email-pefoley2@verizon.net>
In-reply-to: <1353269117-39917-1-git-send-email-pefoley2@verizon.net>
References: <1353269117-39917-1-git-send-email-pefoley2@verizon.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: Peter Foley <pefoley2@verizon.net>

From: Peter Foley <pefoley2@verizon.net>

Add do-nothing rules to archheaders and archscripts targets to avoid
'nothing to be done' messages.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 arch/x86/syscalls/Makefile | 1 +
 arch/x86/tools/Makefile    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/syscalls/Makefile b/arch/x86/syscalls/Makefile
index f325af2..b6c923a 100644
--- a/arch/x86/syscalls/Makefile
+++ b/arch/x86/syscalls/Makefile
@@ -56,3 +56,4 @@ targets	+= $(uapisyshdr-y) $(syshdr-y)
 
 all: $(addprefix $(uapi)/,$(uapisyshdr-y))
 all: $(addprefix $(out)/,$(syshdr-y))
+	@:
diff --git a/arch/x86/tools/Makefile b/arch/x86/tools/Makefile
index bae601f..dce567c 100644
--- a/arch/x86/tools/Makefile
+++ b/arch/x86/tools/Makefile
@@ -40,3 +40,4 @@ $(obj)/insn_sanity.o: $(srctree)/arch/x86/lib/insn.c $(srctree)/arch/x86/lib/ina
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
 hostprogs-y	+= relocs
 relocs: $(obj)/relocs
+	@:
-- 
1.8.0

