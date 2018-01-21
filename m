Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24984 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750912AbeAUQpm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jan 2018 11:45:42 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQuW5X5rpZMwRy=Mo=W-KZy30ojTtaatweyS=iYuk9qGQ@mail.gmail.com>
References: <20180114141205.26814-1-ulfalizer@gmail.com> <CAK7LNATbquS2RDGDK0xYv9bG8UsqFh9HXiyUR-BF995qQ3OjMQ@mail.gmail.com>
 <CAFkk2KQEsS1L19wOVQJMQdiWGCxTYMq5BmyQ=_RBy9rHt6Un0w@mail.gmail.com> <CAK7LNAQuW5X5rpZMwRy=Mo=W-KZy30ojTtaatweyS=iYuk9qGQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 22 Jan 2018 01:44:50 +0900
Message-ID: <CAK7LNATNf4oWsnF5=ywgo5929TKm9DBzXqT4fYpR-Nh+ohok-Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Clarify choice dependency propagation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-19 11:29 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Hi Ulf,
>
>
> 2018-01-19 1:58 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
>> On Thu, Jan 18, 2018 at 5:47 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> 2018-01-14 23:12 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
>>>> It's easy to miss that choices are special-cased to pass on their mode
>>>> as the parent dependency.
>>>>
>>>> No functional changes. Only comments added.
>>>>
>>>> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
>>>> ---
>>>>  scripts/kconfig/menu.c | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>>>> index 92d3f06cd8a2..53964d911708 100644
>>>> --- a/scripts/kconfig/menu.c
>>>> +++ b/scripts/kconfig/menu.c
>>>> @@ -323,6 +323,13 @@ void menu_finalize(struct menu *parent)
>>>>                                 if (menu->sym && menu->sym->type == S_UNKNOWN)
>>>>                                         menu_set_type(sym->type);
>>>>                         }
>>>> +
>>>> +                       /*
>>>> +                        * Use the choice itself as the parent dependency of
>>>> +                        * the contained items. This turns the mode of the
>>>> +                        * choice into an upper bound on the visibility of the
>>>> +                        * choice symbols.
>>>> +                        */
>>>
>>> Does the last "choice symbols" mean "choice values"?
>>> The "choice" itself is a symbol with NULL name,
>>> so I'd like to clarify it.
>>
>> Yep, means the choice values (which are symbols). "Choice values"
>> would probably be clearer, yeah, or maybe "choice value symbols".
>>
>> Should I submit a new version? I'm fine with just a
>> 's/symbols/values/' or 's/symbols/value symbols/' otherwise.
>>
>> Cheers,
>> Ulf
>
>
> It is trivial, so I will locally fix it up.
>
> s/symbols/value symbols/
>

Applied to linux-kbuild/kconfig
with s/symbols/value symbols/.

Thanks!


-- 
Best Regards
Masahiro Yamada
