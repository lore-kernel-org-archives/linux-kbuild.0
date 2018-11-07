Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:50270 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727413AbeKHHQQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 02:16:16 -0500
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
 <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
 <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
 <192946CF-8543-4CF5-B2A3-93674FCD07E2@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <7bc80811-8ab3-d26a-6fb3-b7aeebcfce43@deltatee.com>
Date: Wed, 7 Nov 2018 14:43:39 -0700
MIME-Version: 1.0
In-Reply-To: <192946CF-8543-4CF5-B2A3-93674FCD07E2@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>



On 2018-11-07 11:56 a.m., Nadav Amit wrote:
> HPA indicated more than once that this is wrong (and that was indeed my
> initial solution), since it is not guaranteed that the compiler would put
> the macro assembly before its use.

Hmm, that's very unfortunate. I don't really understand why the compiler
would not put the macro assembly in the same order as it appears in the
code and it would be in the correct order there.

In any case, I've submitted a couple of issues to icecc[1] and distcc[2]
to see if they have any ideas about supporting this on their sides.

Thanks,

Logan

[1] https://github.com/icecc/icecream/issues/428
[2] https://github.com/distcc/distcc/issues/312
