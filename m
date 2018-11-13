Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:59672 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbeKMOw5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Nov 2018 09:52:57 -0500
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
 <2c022676-9299-bb5f-023b-5c114cd79f81@deltatee.com>
 <080748A5-2588-47C9-BC2A-E643630FB9A7@vmware.com>
 <3ae6dd1f-9b59-8552-f438-c40b08771226@deltatee.com>
 <C0187502-9FC0-4FE2-BCD3-81B8B992F3A2@vmware.com>
 <88901B62-7D98-45A2-8881-352A31802933@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <258e793a-a7a6-526d-6be5-edba1c701a24@deltatee.com>
Date: Mon, 12 Nov 2018 21:56:09 -0700
MIME-Version: 1.0
In-Reply-To: <88901B62-7D98-45A2-8881-352A31802933@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, "hpa@zytor.com" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>, Masami Hiramatsu <mhiramat@kernel.org>



On 10/11/18 03:04 PM, Nadav Amit wrote:
> Err.. I hate makefiles and distcc doesn’t make life easier. For instance, if
> it sees two source files on the command-line, it freaks out and compiles it
> locally. It also has an option to distribute assembly, but it is not enabled
> by default.
> 
> Anyhow, can you try the following patch?

Very nice, great work! It works as expected. I tested with both distcc
and icecc and both work well with DISTCC=y.

Also worth noting, is that distcc has a patch to work without DISTCC=y
in pump mode (though pump mode doesn't work super great with the kernel
as some of the include processing takes a long time). When I have some
free time, I may also try to patch icecc to work with it, as in my
experience, it performs better.

Regardless, I think your patch would be very valuable to be in upstream
so there's at least some way to use the existing versions of distcc and
icecc.

Thanks!

Logan
