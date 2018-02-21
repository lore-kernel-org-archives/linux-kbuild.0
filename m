Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58316 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750707AbeBUFAy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Feb 2018 00:00:54 -0500
MIME-Version: 1.0
In-Reply-To: <CA+55aFzu8+yaAGvdZMRYJWWZmv_OnFnocnvUiSKcAyNQ1z9kmQ@mail.gmail.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-12-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFwQLrrBeXZXK_qUXiGVFNv3qPJS4tNKFacuk0Y0WgZjCA@mail.gmail.com>
 <20180219044845.7cnqpgyiinn6hkyb@huvuddator> <CA+55aFwiRzpSRW8xhoMs9cbFFXZGmEyyVa4a7aeZzQGYuO211w@mail.gmail.com>
 <CA+55aFzu8+yaAGvdZMRYJWWZmv_OnFnocnvUiSKcAyNQ1z9kmQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Feb 2018 13:59:59 +0900
Message-ID: <CAK7LNAT1QNMrHL_JikeEk1ejen-03u_vwkdQmHhHxrxHLtaa0Q@mail.gmail.com>
Subject: Re: [PATCH 11/23] kconfig: add 'shell-stdout' function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-20 3:01 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> On Mon, Feb 19, 2018 at 9:44 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I do like your "success"/"stdout" more than "shell"/"shell-stdout",
>> because with that naming I don't get the feeling that one should
>> subsume the other.
>
> Hmm. Thinking about it some more, I really would prefer just "$(shell
> ...)" everywhere.
>
> But it would be nice if perhaps the error handling would match the
> context somehow.
>
> I'm wondering if this might tie into the whole quoting discussion in
> the other thread.
>
> Because the rule could be:
>
> (a) unquoted $(shell ) is a bool, and failing is ok (and turns into
> y/n depending on whether successful or failing)
>
> So
>
>   config CC_IS_GCC
>           bool
>           default $(shell $CC --version | grep -q gcc)
>
> works automatically.
>
> (b) but with quoting, $(shell ) is a string, and failing is an error
>
> So
>
>   config GCC_VERSION
>           int
>           default "$(shell-stdout $srctree/scripts/gcc-version.sh $CC
> | sed 's/^0*//')" if CC_IS_GCC
>           default 0
>
> would need those quotes, and if the shell-script returns a failure,
> we'd _abort_.


GCC_VERSION is int type.

Setting aside the Kconfig internal, I prefer 50700 to "50700"

According to my common sense, I do not want to quote integers.




IMO, I prefer to use different names for different purpose.
So, 'stdout' and 'success' look good to me.



BTW, I noticed just one built-in function is enough
because 'success' can be derived from 'stdout'.


So, my plan is, implement $(shell ...) as a built-in function.
This returns the stdout from the command.


Then, implement 'success' as a textual shorthand
by using macro, like this:

macro success $(shell ($(1) && echo y) || echo n)


macro can be expanded recursively, so cc-option
can be implemented based on 'success' macro.





-- 
Best Regards
Masahiro Yamada
