Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:52804 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755917AbZKDPVJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 10:21:09 -0500
Message-Id: <200911041519.nA4FJWEW030164@imap1.linux-foundation.org>
Subject: [patch 1/4] x86: _end symbol missing from Symbol.map
From: akpm@linux-foundation.org
Date: Wed, 04 Nov 2009 07:19:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: akpm@linux-foundation.org, hare@suse.de, mingo@elte.hu, sam@ravnborg.org, stable@kernel.org

From: Hannes Reinecke <hare@suse.de>

With 2.6.31 'crash' on x86_64 falls flat on its face as the '_end' symbol
is missing from the System.map file.

The culprit is commit 091e52c3551d3031343df24b573b770b4c6c72b6, which
moved the '_end' symbol into it's own section.  Apparently this causes
kallsyms to not reference it properly.

So either we'd need to revert part of the patch to not include _end in
it's own section.

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: <stable@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/x86/kernel/vmlinux.lds.S |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff -puN arch/x86/kernel/vmlinux.lds.S~x86-_end-symbol-missing-from-symbolmap arch/x86/kernel/vmlinux.lds.S
--- a/arch/x86/kernel/vmlinux.lds.S~x86-_end-symbol-missing-from-symbolmap
+++ a/arch/x86/kernel/vmlinux.lds.S
@@ -319,9 +319,7 @@ SECTIONS
 		__brk_limit = .;
 	}
 
-	.end : AT(ADDR(.end) - LOAD_OFFSET) {
-		_end = .;
-	}
+	_end = .;
 
         STABS_DEBUG
         DWARF_DEBUG
_
