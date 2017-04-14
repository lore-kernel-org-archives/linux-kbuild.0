Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35028 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750750AbdDNFxf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 01:53:35 -0400
MIME-Version: 1.0
In-Reply-To: <20170414003745.GI28657@google.com>
References: <20170403212537.124217-1-mka@chromium.org> <CAK7LNATZq8CWNxf_KAk6p4v2ZG6HEd70nxPB8MDWOcR5K5aQsA@mail.gmail.com>
 <20170411180354.GD28657@google.com> <20170414003745.GI28657@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 14 Apr 2017 14:53:20 +0900
Message-ID: <CAK7LNAQoKyyzsHuEoRppTFPA2fQhF5j8=tJmgQ2Uw2A+sC=cEA@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Fix asm-offset generation to work with clang
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Behan Webster <behanw@converseincode.com>, Peter Foley <pefoley2@pefoley.com>

Hi Matthias,


2017-04-14 9:37 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> El Tue, Apr 11, 2017 at 11:03:54AM -0700 Matthias Kaehlcke ha dit:
>
>> El Tue, Apr 11, 2017 at 09:01:41PM +0900 Masahiro Yamada ha dit:
>>
>> > 2017-04-04 6:25 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
>> > > When using clang with -no-integerated-as clang will use the gnu
>> > > assembler instead of the integrated assembler. However clang will
>> > > still perform asm error checking before sending the inline assembly
>> > > language to gas.
>> > >
>> > > The generation of asm-offsets from within C code is dependent on gcc's
>> > > blind passing of whatever is in asm() through to gas. Arbirary text is
>> > > passed through which is then modified by a sed script into the
>> > > appropriate .h and .S code. Since the arbitrary text is not valid
>> > > assembly language, clang fails.
>> > >
>> > > This can be fixed by making the arbitrary text into an ASM comment and
>> > > then updating the sed scripts accordingly to work as expected.
>> > >
>> > > This solution works for both gcc and clang.
>> > >
>> > > Based-on-patch-from: Behan Webster <behanw@converseincode.com>
>> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>> >
>> >
>> >
>> > Could you check Jeroen Hofstee's work for U-Boot?
>> >
>> > http://patchwork.ozlabs.org/patch/375026/
>>
>> No I didn't come across it, thanks for the pointer!
>>
>> > His idea is to use .ascii string
>> > in order to handle this in arch-agnostic way.
>>
>> Looks good, way cleaner than my proposed solution :)
>>
>> > If you are happy about this idea,
>> > I can forward his patch (with a little bit adjustment).
>>
>> With forward you mean you plan to port it? Otherwise I'm also happy to
>> give it a go, just let me know.
>>
>> > We may want to refactor the patch because
>> > the double mark ".ascii" and "->" seem redundant,
>> > but it is just a detail.
>>
>> Agree, since we are already touching this part we might as well remove
>> the "->".
>
> Thinking about it a bit more it seems safer to keep the "->" since
> the input file might contain actual ".ascii" directives.


I am not sure about this, but I do not have a strong option, either.

OK. I am keeping both .ascii and -> just in case.

https://patchwork.kernel.org/patch/9680709/


-- 
Best Regards
Masahiro Yamada
