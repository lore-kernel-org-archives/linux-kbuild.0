Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:37646 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750766AbeBHGBp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Feb 2018 01:01:45 -0500
MIME-Version: 1.0
In-Reply-To: <CAFkk2KSA6L_Ti_rFN9waJWZvntNT6qnvW1bzcbAbfnHpZM_wyw@mail.gmail.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
 <1517877294-4826-5-git-send-email-yamada.masahiro@socionext.com> <CAFkk2KSA6L_Ti_rFN9waJWZvntNT6qnvW1bzcbAbfnHpZM_wyw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 8 Feb 2018 15:00:56 +0900
Message-ID: <CAK7LNATE-8V=00-6g2AM6ymXR5mkc_GkL=Y-YU=raZhSG8MP1Q@mail.gmail.com>
Subject: Re: [PATCH 04/14] kconfig: print additional new line for choice for redirection
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Herbert <marc.herbert@intel.com>

2018-02-08 8:34 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> On Tue, Feb 6, 2018 at 1:34 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> If stdout is redirected to a file, prompts look differently due to
>> missing new lines.
>>
>> Currently, conf_askvalue() takes care of this by putting additional
>> new line, but conf_choice() does not.  Do likewise so that prompts
>> after 'choice' look properly.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  scripts/kconfig/conf.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
>> index d346642..6ce06c8 100644
>> --- a/scripts/kconfig/conf.c
>> +++ b/scripts/kconfig/conf.c
>> @@ -317,6 +317,8 @@ static int conf_choice(struct menu *menu)
>>                 case oldaskconfig:
>>                         fflush(stdout);
>>                         xfgets(line, sizeof(line), stdin);
>> +                       if (!tty_stdio)
>> +                               printf("\n");
>>                         strip(line);
>>                         if (line[0] == '?') {
>>                                 print_help(menu);
>> --
>> 2.7.4
>>
>
> Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
>
> Maybe this could be moved into the xfgets() function as well.
>

Thanks for your comment!
Yes, it is better to move this into xfgets().

I improve this a bit more so that the redirected stdout
contains not only '\n' but also input keys.

https://patchwork.kernel.org/patch/10206611/


-- 
Best Regards
Masahiro Yamada
