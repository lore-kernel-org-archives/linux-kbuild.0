Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39888 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751255AbcLAMrw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Dec 2016 07:47:52 -0500
Message-ID: <58401BF6.4040405@redhat.com>
Date: Thu, 01 Dec 2016 07:47:50 -0500
From: Prarit Bhargava <prarit@redhat.com>
MIME-Version: 1.0
Subject: Re: Odd build breakage in 4.9-rc7
References: <20161130172435.GG8563@redhat.com> <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com> <583F1A5A.7040708@redhat.com> <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com> <583F1F6A.5010307@redhat.com> <CA+55aFyvvVG2-fZbefGXV_dznz16jfKRFukX1u4hWEtG5DfJMw@mail.gmail.com> <alpine.LFD.2.20.1611301726240.1715@knanqh.ubzr>
In-Reply-To: <alpine.LFD.2.20.1611301726240.1715@knanqh.ubzr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jarod Wilson <jarod@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>



On 11/30/2016 05:41 PM, Nicolas Pitre wrote:
> On Wed, 30 Nov 2016, Linus Torvalds wrote:
> 
>> On Wed, Nov 30, 2016 at 10:50 AM, Prarit Bhargava <prarit@redhat.com> wrote:
>>>
>>> It comes back.  The steps to reproduce this are:
>>>
>>> 1.  checkout latest linux.git
>>> 2.  make -j112
>>>
>>> (IOW, it occurs 100% of the time for me on a clean tree.)
> 
> I don't have access to such hardware where -j112 could ever make sense.  :-)

:)  I could push the builds onto the -j256 but I'm doing other stuff over there. :)

> In other words, I can't reproduce regardless of the -j value I try.
> 
>> I suspect it's not new, it's just that you are able to hit the timing
>> just right (and the new include presumable makes that just be much
>> easier).
> 
> Here's the best fix I can think of. I can't convince myself any other 
> location would be 100% safe.  Obviously I can't confirm if this actually 
> fixes anything.
> 
> ----- >8
> Subject: kbuild: make sure autoksyms.h exists early
> 

I'm building with this patch on top of latest now.  I will put it in a tight
loop and clear the drop_caches between builds to see if I can make it fail.

Thanks Nicolas -- your help is very much appreciated.

P.
