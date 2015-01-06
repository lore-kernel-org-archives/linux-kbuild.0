Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prod-mail-xrelay02.akamai.com ([72.246.2.14]:42031 "EHLO
	prod-mail-xrelay02.akamai.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754673AbbAFPqz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Jan 2015 10:46:55 -0500
Message-ID: <54AC036E.6080507@akamai.com>
Date: Tue, 06 Jan 2015 10:46:54 -0500
From: Jason Baron <jbaron@akamai.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] jump_label: Allow jump labels to be used in assembly
References: <1420539628-17875-1-git-send-email-anton@samba.org>
In-Reply-To: <1420539628-17875-1-git-send-email-anton@samba.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Blanchard <anton@samba.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "mmarek@suse.cz" <mmarek@suse.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "peterz@infradead.org" <peterz@infradead.org>, "liuj97@gmail.com" <liuj97@gmail.com>, "mingo@kernel.org" <mingo@kernel.org>, "mgorman@suse.de" <mgorman@suse.de>, rostedt@goodmis.org
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 01/06/2015 05:20 AM, Anton Blanchard wrote:
> To use jump labels in assembly we need the HAVE_JUMP_LABEL define,
> so we select a fallback version if the toolchain does not support
> them.
>
> Modify linux/jump_label.h so it can be included by assembly files.
> We also need to add -DCC_HAVE_ASM_GOTO to KBUILD_AFLAGS.
>
> Signed-off-by: Anton Blanchard <anton@samba.org>

(adding Steven)

Acked-by: Jason Baron <jbaron@akamai.com>

The jump label stuff often gets picked up by Steve, but I guess this
could go through the powerpc tree as well...

Thanks,

-Jason
