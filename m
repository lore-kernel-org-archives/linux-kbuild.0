Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:56500 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbeKICvm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 21:51:42 -0500
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
 <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
 <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
 <192946CF-8543-4CF5-B2A3-93674FCD07E2@vmware.com>
 <7bc80811-8ab3-d26a-6fb3-b7aeebcfce43@deltatee.com>
 <85B77A64-5FF3-4B82-8A07-E045E259C985@zytor.com>
 <3B824A03-AB76-4B34-B1CA-F27C0F1B0575@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <2c022676-9299-bb5f-023b-5c114cd79f81@deltatee.com>
Date: Thu, 8 Nov 2018 10:14:58 -0700
MIME-Version: 1.0
In-Reply-To: <3B824A03-AB76-4B34-B1CA-F27C0F1B0575@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, "hpa@zytor.com" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>



On 2018-11-07 11:18 p.m., Nadav Amit wrote:
>> Apparently gcc will treat them like basic blocks and possibly move them around.
> 
> Maybe it is possible to break the compilation of each object into two
> stages: first, compile the source without assembly, and then take the
> generated .s file and assemble it with the .s file of the macros.
> 
> Does it sounds as something that may work? I guess it should only be done
> when distcc is used.

In theory it would at least allow the compile step to be distributed,
the assembly step would still have to be done locally... It'd be better
than nothing, I guess.

It'd also be difficult to know when distribution is being done and that
it's necessary to split the steps. We'd have to add an environment
variable or something and users would need to know they have to set it
when using a distributed compile.

Logan
