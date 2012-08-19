Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:44694 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752733Ab2HSIqH convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:6:1>);
	Sun, 19 Aug 2012 04:46:07 -0400
Message-Id: <5030B5DC020000780008A226@nat28.tlf.novell.com>
Date: Sun, 19 Aug 2012 09:46:04 +0100
From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 55/74] lto, workaround: Add workaround for initcall
 reordering
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
 <1345345030-22211-56-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-56-git-send-email-andi@firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: andi@firstfloor.org, ak@linux.intel.com, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, akpm@linux-foundation.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org

>>> Andi Kleen <andi@firstfloor.org> 08/19/12 5:05 AM >>>
>Work around a LTO gcc problem: when there is no reference to a variable
>in a module it will be moved to the end of the program. This causes
>reordering of initcalls which the kernel does not like.
>Add a dummy reference function to avoid this. The function is
>deleted by the linker.

This is not even true on x86, not to speak of generally.

>+#ifdef CONFIG_LTO
>+/* Work around a LTO gcc problem: when there is no reference to a variable
>+ * in a module it will be moved to the end of the program. This causes
>+ * reordering of initcalls which the kernel does not like.
>+ * Add a dummy reference function to avoid this. The function is 
>+ * deleted by the linker.
>+ */
>+#define LTO_REFERENCE_INITCALL(x) \
>+    ; /* yes this is needed */            \
>+    static __used __exit void *reference_##x(void)     \

Why not put it into e.g. section .discard.text? That could be expected to be
discarded by the linker without being arch dependent, as long as all arches
use DISCARDS in their linker script.

Jan

