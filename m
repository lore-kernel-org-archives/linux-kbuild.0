Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:43591 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755440AbZJSABJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 18 Oct 2009 20:01:09 -0400
MIME-Version: 1.0
In-Reply-To: <20091018214704.GA26592@kroah.com>
References: <4ADACD3A.9020803@gmail.com>
	 <9b2b86520910180544g94ecc8fuf0d7849e18cd8937@mail.gmail.com>
	 <20091018214704.GA26592@kroah.com>
Date: Mon, 19 Oct 2009 01:01:12 +0100
Message-ID: <9b2b86520910181701qd038ea3r7fbabeafabf0baa3@mail.gmail.com>
Subject: Re: Fast LKM symbol resolution with SysV ELH hash table
From: Alan Jenkins <sourcejedi.lkml@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: carmelo73@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 10/18/09, Greg KH <greg@kroah.com> wrote:
> On Sun, Oct 18, 2009 at 01:44:04PM +0100, Alan Jenkins wrote:
>> Hypothetically: imagine we both finish our work and testing on the
>> same machine shows hash tables saving 100% and bsearch saving 90%.  In
>> absolute terms, hash tables might have an advantage of 0.03s on my
>> system (where bsearch saved 0.3s), and a total advantage of 0.015s for
>> the modules you tested (where hash tables saved ~0.15s).
>>
>> Would you accept bsearch in this case?  Or would you feel that the
>> performance of hash tables outweighed the extra memory requirements?
>
> The performance difference in "raw" time speed might be much different
> on embedded platforms with slower processors, so it might be worth the
> tiny complexity to get that much noticed speed.
>
>> (This leaves the question of why you need to load 0.015s worth of
>> always-needed in-tree kernel code as modules.  For those who haven't
>> read the slides, the  reasoning is that built-in code would take
>> _longer_ to load.  The boot-loader is often slower at IO, and it
>> doesn't allow other initialization to occur in parallel).
>
> Distros are forced to build almost everything as modules.  I've played
> with building some modules into the kernel directly (see the openSUSE
> moblin kernels for examples of that), but when you have to suport a much
> larger range of hardware types and features that some users use and
> others don't, and the ability to override specific drivers by others due
> to manufacturer requests for specific updates, the need to keep things
> as modules is the only way to solve the problem.

Those are all good reasons.  They're just not the reasons for loading
usbcore as a module on a 266Mhz processor as shown in the slides.
That module accounted for 84ms out of the 145ms total (without the
optimisation).  So I feel obliged to stipulate this specific reasoning
before quoting the numbers on the slide.

> So I'm glad to see this speedup happen, very nice work everyone.
>
> thanks,
>
> greg k-h
>

I neglected to say that in the first place, but let me second it.
It's great to see this work from STLinux being proposed for inclusion
in mainline.  If all my work does is serve as a baseline for some even
better numbers - I can survive that :).  My netbook will still boot
0.3s faster :).

Alan
