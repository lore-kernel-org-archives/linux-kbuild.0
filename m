Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f174.google.com ([209.85.208.174]:36104 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390342AbgAXLQW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 06:16:22 -0500
Received: by mail-lj1-f174.google.com with SMTP id r19so2081582ljg.3
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Jan 2020 03:16:21 -0800 (PST)
Subject: Re: vmlinux ELF header sometimes corrupt
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
 <875zh1i0wj.fsf@mpe.ellerman.id.au>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <b5f6ab1c-337e-c5e4-6449-0cf73413e1be@rasmusvillemoes.dk>
Date: Fri, 24 Jan 2020 12:16:17 +0100
MIME-Version: 1.0
In-Reply-To: <875zh1i0wj.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

On 24/01/2020 11.50, Michael Ellerman wrote:
> Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:
>> I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
>> very hard to debug problem that maybe someone else has encountered. This
>> doesn't happen always, perhaps 1 in 8 times or something like that.
>>
>> The issue is that when the build gets to do "${CROSS}objcopy -O binary
>> ... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
>> that fails with
>>
>>   powerpc-oe-linux-objcopy:vmlinux: file format not recognized
>>
>>
>> Any ideas?
> 
> Not really sorry. Haven't seen or heard of that before.
> 
> Are you doing a parallel make? If so does -j 1 fix it?

Hard to say, I'll have to try that a number of times to see if it can be
reproduced with that setting.

> If it seems like sortextable is at fault then strace'ing it would be my
> next step.

I don't think sortextable is at fault, that was just my first "I know
that at least pokes around in the ELF file". I do "cp vmlinux
vmlinux.before_sort" and "cp vmlinux vmlinux.after_sort", and both of
those copies are proper ELF files - and the .after_sort is identical to
the corrupt vmlinux apart from vmlinux ending up with its ELF header wiped.

So it's something that happens during some later build step (Yocto has a
lot of steps), perhaps "make modules" or "make modules_install" or
something ends up somehow deciding "hey, vmlinux isn't quite uptodate,
let's nuke it". I'm not even sure it's a Kbuild problem, but I've seen
the same thing happen using another meta-build system called oe-lite,
which is why I'm not primarily suspecting the Yocto logic.

Rasmus
