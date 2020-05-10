Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726744AbgEJRuK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 13:50:10 -0400
Subject: Re: Using a custom LDFLAG for all objects and binaries
References: <CADa2P2UP1AtEmQYtyqUFKVNz8Rxii+-Zut3ibc5pMYnQB90-zw@mail.gmail.com>
 <32637993-b73f-c2cb-6823-590c1638b5a6@infradead.org>
 <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ff3401cc-e2c1-f510-c971-2151e9d540fe@infradead.org>
Date: Sun, 10 May 2020 10:50:05 -0700
MIME-Version: 1.0
In-Reply-To: <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mahmood Naderan <mahmood.nt@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On 5/10/20 10:13 AM, Mahmood Naderan wrote:
>> Have you read Documentation/kbuild/makefiles.rst ?
>>
>>     LDFLAGS
>>         Generic $(LD) options
>>
>>         Flags used for all invocations of the linker.
> 
> 
> What I see is this in Documentation/kbuild/makefiles.txt
> 
>     LDFLAGS             Generic $(LD) options
> 
>         Flags used for all invocations of the linker.
>         Often specifying the emulation is sufficient.
> 
>         Example:
>                 #arch/s390/Makefile
>                 LDFLAGS         := -m elf_s390
>         Note: ldflags-y can be used to further customise
>         the flags used. See chapter 3.7.
> 
> 
> 
> I have two questions then:
> 1- Can I use that as a bash variable? Like "LDFLAGS=--emit-relocs make"

I don't know. You could experiment with it to see.
(again by using 'make V=1' to see the commands that are being used)

> or
> 2- Editing arch/x86/Makefile with
>    KBUILD_LDFLAGS := -m --emit-relocs elf_$(UTS_MACHINE)

That should work.

> Thanks for your help.

It would be better to ask these questions on the linux-kbuild mailing list
(added now).

-- 
~Randy
