Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:44654 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751523AbeFHJk4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 05:40:56 -0400
MIME-Version: 1.0
In-Reply-To: <8c0f8cc4-b919-9b69-4144-fd216253aa24@iogearbox.net>
References: <20180528153222.2037158-1-arnd@arndb.de> <CAMuHMdXy0uHXaGkFBh9_tr2VzmJF+8KtraTuFHJwcmqhcHs4Dg@mail.gmail.com>
 <8c0f8cc4-b919-9b69-4144-fd216253aa24@iogearbox.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jun 2018 11:40:54 +0200
Message-ID: <CAMuHMdVaiWxU83H8X11q0izK3ULrfaaOvU1mMuHT-cE0CZ0tUg@mail.gmail.com>
Subject: Re: [PATCH] [net-next, wrong] make BPFILTER_UMH depend on X86
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Daniel,

On Fri, Jun 8, 2018 at 11:33 AM, Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 06/08/2018 10:57 AM, Geert Uytterhoeven wrote:
>> On Mon, May 28, 2018 at 5:31 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> When build testing across architectures, I run into a build error on
>>> all targets other than X86:
>>>
>>> gcc-8.1.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-objdump: net/bpfilter/bpfilter_umh: File format not recognized
>>> gcc-8.1.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-objcopy:net/bpfilter/bpfilter_umh.o: Invalid bfd target
>>>
>>> The problem is that 'hostprogs' get built with 'gcc' rather than
>>> '$(CROSS_COMPILE)gcc', and my default gcc (as most people's) targets x86.
>>>
>>> To work around it, adding an X86 dependency gets randconfigs building
>>> again on my box.
>>>
>>> Clearly, this is not a good solution, since it should actually work fine
>>> when building native kernels on other architectures but that is now
>>> disabled, while cross building an x86 kernel on another host is still
>>> broken after my patch.
>>>
>>> What we probably want here is to try out if the compiler is able to build
>>> executables for the target architecture and not build the helper otherwise,
>>> at least when compile-testing. No idea how to do that though.
>>
>> So that was done in commit 819dd92b9c0bc7bc ("bpfilter: switch to CC
>> from HOSTCC"), but it is not sufficient:
>>
>>       GEN net/bpfilter/bpfilter_umh.o
>>     Usage: m68k-linux-gnu-objcopy [option(s)] in-file [out-file]
>>      Copies a binary file, possibly transforming it in the process
>>      The options are:
>>     [...]
>>
>> net/bpfilter/Makefile:29: recipe for target 'net/bpfilter/bpfilter_umh.o' failed
>> make[5]: *** [net/bpfilter/bpfilter_umh.o] Error 1
>>
>>> --- a/net/bpfilter/Kconfig
>>> +++ b/net/bpfilter/Kconfig
>>> @@ -9,6 +9,7 @@ menuconfig BPFILTER
>>>  if BPFILTER
>>>  config BPFILTER_UMH
>>>         tristate "bpfilter kernel module with user mode helper"
>>> +       depends on X86 # actually depends on native builds
>>
>> No, (currently) it does depend on X86, due to its use of:
>>
>>     $(OBJCOPY) -I binary -O $(CONFIG_OUTPUT_FORMAT)
>>
>> with CONFIG_OUTPUT_FORMAT being defined on X86 only...
>
> That hard dependency should have been fixed with the following patch in -net tree:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=8d97ca6b6755bf7ef57d323642ca9ee80d689782

Thanks, confirmed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
