Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:48944 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726938AbeKHEZN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Nov 2018 23:25:13 -0500
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
 <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
Date: Wed, 7 Nov 2018 11:53:02 -0700
MIME-Version: 1.0
In-Reply-To: <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>



On 2018-11-07 11:01 a.m., Nadav Amit wrote:
> Ideas? Do people care about it?

Just spit balling, but is there a reason we didn't just put the macros
for inline assembly directly in the header? Something like this:

asm(".macro ANNOTATE_UNREACHABLE counter:req\n\t"
    "\\counter:\n\t"
        ".pushsection .discard.unreachable\n\t"
        ".long \\counter\\()b -.\n\t"
        ".popsection\n\t"
    ".endm\n");

#define annotate_unreachable() ({                   \
    asm volatile("ANNOTATE_UNREACHABLE counter=%c0" \
                 : : "i" (__COUNTER__));            \
})

It does mean the macros won't be usable in non-inline assembly, without
duplicating them, but do we care about that?

I would have expected people compiling the kernel with distcc to be
fairly common -- it certainly speeds up my kernel compiles quite
significantly and thus saves me a lot of time.

Logan
