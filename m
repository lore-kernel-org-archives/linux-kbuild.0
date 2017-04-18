Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45849 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755547AbdDRKUb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2017 06:20:31 -0400
MIME-Version: 1.0
In-Reply-To: <28460.1492509473@warthog.procyon.org.uk>
References: <1492149003-19136-1-git-send-email-yamada.masahiro@socionext.com>
 <1492149003-19136-2-git-send-email-yamada.masahiro@socionext.com> <28460.1492509473@warthog.procyon.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 18 Apr 2017 19:20:09 +0900
Message-ID: <CAK7LNATxObLqAvGgvW=gg2jUMwUFR55QfTYJUL6iNgmDLxYefQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: consolidate redundant sed script ASM offset generation
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,


2017-04-18 18:57 GMT+09:00 David Howells <dhowells@redhat.com>:
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> This part ended up in redundant code after touched by multiple
>> people.
>>
>> [1] Commit 3234282f33b2 ("x86, asm: Fix CFI macro invocations to
>> deal with shortcomings in gas") added parentheses for defined
>> expressions to support old gas for x86.
>>
>> [2] Commit a22dcdb0032c ("x86, asm: Fix ancient-GAS workaround")
>> split the pattern into two to avoid parentheses for non-numeric
>> expressions.
>>
>> [3] Commit 95a2f6f72d37 ("Partially revert patch that encloses
>> asm-offset.h numbers in brackets") removed parentheses from numeric
>> expressions as well because parentheses in MN10300 assembly have a
>> special meaning (pointer access).
>>
>> Apparently, there is a conflict between [1] and [3].  After all,
>> [3] took precedence, and a long time has passed since then.
>
> There's a conflict between [1] and various assembly code formats.  Some
> formats define, say,
>
>         mov     4,r1
>
> to move the number 4 into register r1, and:
>
>         mov     (4),r1
>
> to move the contents of the memory at address 4 into r1.  Therefore, you
> cannot simply wrap numeric operands in brackets.  What might work is adding a
> '+' on the front, e.g.:
>
>         mov     +(4),r1
>
> David


OK, thanks for this info.

But, nobody has raised a flag about the reverted [1].
(perhaps, nobody cares about the old gas any more?)
So, I think this patch will be OK.


BTW, do you still maintain mn10300?

(Before, I worked for Panasonic, i.e. former Matsushita)



-- 
Best Regards
Masahiro Yamada
