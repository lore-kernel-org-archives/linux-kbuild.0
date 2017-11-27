Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:33959 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751591AbdK0M0U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 07:26:20 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQLarR5CmdzwFEnTYj+BgHu8dq2UafRR-set+GjfHGkgw@mail.gmail.com>
References: <CAK7LNAT9opHCYFfccD6EOPZVznY0aQ7dOYVkupaTesEvzs7bKA@mail.gmail.com>
 <CAMuHMdWO0D9jLi=6m6W1bQuTQURjFnZo9PM2-CtfhYxvZajjiw@mail.gmail.com> <CAK7LNAQLarR5CmdzwFEnTYj+BgHu8dq2UafRR-set+GjfHGkgw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2017 13:26:19 +0100
Message-ID: <CAMuHMdUJ+V2A+L+37M1af_EFi0N6Mm5biQ5+vLCZz_LSEcf1NA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v4.15 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Chris Fries <cfries@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Yamada-san,

On Mon, Nov 27, 2017 at 1:17 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-11-27 17:30 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
>> On Fri, Nov 24, 2017 at 5:58 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> Please pull a little more Kbuild updates for v4.15.
>>> The reason for lateness is I hesitated to put some patches
>>> in the last week pull requests due to big conflicts.
>>> Also, I applied some fixes and trivial enough ones.
>>> I hope you will pull this.
>>>
>>>
>>>
>>> The following changes since commit 2ce079f04d5914dae14fdc8618f804cc0d2a1b8f:
>>>
>>>   Merge tag 'kbuild-misc-v4.15' of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
>>> (2017-11-17 17:51:33 -0800)
>>>
>>> are available in the git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>>> tags/kbuild-v4.15-2
>>>
>>> for you to fetch changes up to 10aaa3b7e95b9649fd658ac7e9075093316425d8:
>>>
>>>   kbuild: drop $(extra-y) from real-objs-y (2017-11-23 23:29:26 +0900)
>>>
>>> ----------------------------------------------------------------
>>> Kbuild updates for v4.15 (2nd)
>>
>>> Chris Fries (1):
>>>       kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
>>
>> This broke cross-compilation using a cross-compiler that supports less
>> compiler options than the host compiler. E.g.:
>>
>>     cc1: error: unrecognized command line option "-Wno-unused-but-set-variable"
>>
>> Reverting commit ae6b289a37890909 ("kbuild: Set KBUILD_CFLAGS before incl.
>> arch Makefile", which was in linux-next since next-20171124) fixes that.
>>
>> BTW, this gets broken regularly, cfr. e.g. commits a1c48bb160f8368e ("Makefile:
>> Fix unrecognized cross-compiler command line options") and bef5b54bd7bf8117
>> ("Fix MIPS cross-compile problem").
>>
>
> Oh, thanks for the report.
>
> I do not want to revert it, but how about this?
>
> https://patchwork.kernel.org/patch/10076723/

That patch fixes the issue for me, thanks a lot!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
