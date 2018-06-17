Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45856 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756937AbeFQAsj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jun 2018 20:48:39 -0400
MIME-Version: 1.0
In-Reply-To: <20180613203614.GB10472@ravnborg.org>
References: <20180612115050.185112-1-namit@vmware.com> <20180612115050.185112-2-namit@vmware.com>
 <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com> <20180613203614.GB10472@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 17 Jun 2018 09:47:30 +0900
Message-ID: <CAK7LNATbDmzgReA0UVbayaFKkC=mXL-psQbiXckuNvjpWyHpcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] Makefile: Prepare for using macros for inline asm
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Nadav Amit <namit@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-06-14 5:36 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
>>
>> > +macros: $(obj)/macros.s
>> > +       @:
>>
>> If you add a phony target, it should be added to 'PHONY'.
>
> Or this part:
>> +archmacros:
>> +       $(Q)$(MAKE) $(build)=arch/x86/kernel macros
>
> could be modified to specify the exact filename so this indirection is not needed.

Yes, it could work.

Actually, two styles co-exist in arch/x86/Makefile.
(archprepare vs archscripts)




-- 
Best Regards
Masahiro Yamada
