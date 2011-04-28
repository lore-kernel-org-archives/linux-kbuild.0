Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40890 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751270Ab1D1Lrf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2011 07:47:35 -0400
MIME-Version: 1.0
In-Reply-To: <4DB96E6A020000780003E9EB@vpn.id2.novell.com>
References: <4DB85404020000780003E6D7@vpn.id2.novell.com>
	<20110428104306.GC2431@osiris.boeblingen.de.ibm.com>
	<4DB96E6A020000780003E9EB@vpn.id2.novell.com>
Date: Thu, 28 Apr 2011 13:47:33 +0200
Message-ID: <BANLkTikJN92ogUfxAc+SgzvX1Q8r48ughw@mail.gmail.com>
Subject: Re: [PATCH] allow placing exception table in .rodata (and do so on x86)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, mingo@elte.hu, tglx@linutronix.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hpa@zytor.com

On Thu, Apr 28, 2011 at 13:40, Jan Beulich <JBeulich@novell.com> wrote:
>>>> On 28.04.11 at 12:43, Heiko Carstens <heiko.carstens@de.ibm.com> wrote:
>> On Wed, Apr 27, 2011 at 04:36:04PM +0100, Jan Beulich wrote:
>>> This is since the table is really a set of pointers, i.e. misplaced in
>>> .text.
>>>
>>> Quite likely other architectures would want to follow.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@novell.com>
>>>
>>
>> [...]
>>
>>> --- 2.6.39-rc5/include/asm-generic/vmlinux.lds.h
>>> +++ 2.6.39-rc5-extable-in-rodata/include/asm-generic/vmlinux.lds.h
>>> @@ -226,6 +226,7 @@
>>>              *(.rodata1)                                             \
>>>      }                                                               \
>>>                                                                      \
>>> +    EXCEPTION_TABLE_RO                                              \
>>
>> That's odd. The kernel actually writes to it (sort_main_extable()), so
>> it shouldn't be in the ro data section, but the data section.
>
> This area does get written, but only at boot time, before read-only
> data gets set to r/o (on x86 at least). With this in mind, it's better
> to place it in .rodata, as that way run-time protection will be in place
> (and I think you agree that it was misplaced in .text in any case).

Which means it may be in ROM (which is really read-only) on some embedded
devices, so it cannot be sorted?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
