Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:43749 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751056AbdFUJMA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 05:12:00 -0400
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3D6oW4vaUD9JSGXFqqydrm5-Z0x9qOwzfn_WQryXezsA@mail.gmail.com>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-3-mka@chromium.org>
 <CAD=FV=XENNp3rcD5OK1d2WmccbqaT9=bjsayvbnA2Th8zmOAwg@mail.gmail.com>
 <CAK8P3a1y0MoxhMNr2v=R7-CANaATfFy58FM8heyOP78g-JZwHA@mail.gmail.com>
 <20170517184529.GG141096@google.com> <20170524000419.GQ141096@google.com> <CAK8P3a3D6oW4vaUD9JSGXFqqydrm5-Z0x9qOwzfn_WQryXezsA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Jun 2017 18:11:51 +0900
Message-ID: <CAK7LNASXC1T_OkXD-T5XSKAHSNWrxAQCHPfk4dgnyq7MJBCSnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the 'duplicate-decl-specifier' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matthias Kaehlcke <mka@chromium.org>, Doug Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Nick Desaulniers <ndesaulniers@google.com>

Hi.


2017-05-24 17:21 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Wed, May 24, 2017 at 2:04 AM, Matthias Kaehlcke <mka@chromium.org> wrote:
>> El Wed, May 17, 2017 at 11:45:29AM -0700 Matthias Kaehlcke ha dit:
>>> El Wed, May 17, 2017 at 09:35:57AM +0200 Arnd Bergmann ha dit:
>>> > On Tue, May 16, 2017 at 11:41 PM, Doug Anderson <dianders@chromium.org> wrote:
>> It seems the duplicate-decl-specifier warning targets specifically C89:
>>
>> "The same type qualifier shall not appear more than once in the same
>> specifier list or qualifier list, either directly or via one or more
>> typedefs."
>>
>> C89 (6.5.3)
>>
>> gcc also raises a warning when '-pedantic' is specified and
>> -std=gnu89/c89 (or unspecified), but not with -std=gnu99/c99.
>>
>> This bug might help to shed more light on this:
>> https://bugs.llvm.org/show_bug.cgi?id=32985
>
> I also notice that neither compiler differentiates between a)
>
> typedef const int cint;
> const cint i;
>
> and b)
> const int i;
> const typeof(a) j;
>
> I would have expected a warning for a) but not b), but both 'clang --std=gnu89'
> and 'gcc --pedantic --std=gnu89' warn about both of b as well, and don't warn
> for newer standards.
>
>        Arnd




I think we agreed to apply 1/2.

How about 2/2?

I think we mostly discussed preferable behavior of -Wduplicate-decl-specifier,
but we did not come up with an idea to solve the problem for
already shipped clang versions.
(BTW, we have not defined the minimal supported version of clang yet.)


-- 
Best Regards
Masahiro Yamada
