Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:42400 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754099AbeAQRAx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jan 2018 12:00:53 -0500
MIME-Version: 1.0
In-Reply-To: <CAFkk2KQ63jJVWLYTJpKfXJLfHrbp6k=5ToSHfqE1M+nxDNG4Sw@mail.gmail.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
 <CAFkk2KQmj5hMhVytCU3pd5YJ2sPZxx7Y2HH8OLiiKL3Z_ZKiDg@mail.gmail.com> <CAFkk2KQ63jJVWLYTJpKfXJLfHrbp6k=5ToSHfqE1M+nxDNG4Sw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jan 2018 01:59:49 +0900
Message-ID: <CAK7LNAQzOgJEDDaDpLeaYEywpYWFfdXWX+9g890gi3xSODv1zg@mail.gmail.com>
Subject: Re: [PATCH 1/6] kconfig: do not call check_conf() for olddefconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Marc Herbert <marc.herbert@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ulf,

2018-01-13 1:49 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> On Fri, Jan 12, 2018 at 1:26 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>> On Wed, Jan 10, 2018 at 7:56 AM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> check_conf() traverses the menu tree, but it is completely no-op for
>>> olddefconfig because the following if-else block does nothing.
>>>
>>>     if (input_mode == listnewconfig) {
>>>             ...
>>>     } else if (input_mode != olddefconfig) {
>>>             ...
>>>     }
>>>
>>> As the help message says, olddefconfig automatically sets new symbols
>>> to their default value.  There is no room for manual intervention.
>>> So, calling check_conf() for olddefconfig is odd in the first place.
>>> Rather, olddefconfig belongs to the group of alldefconfig and defconfig.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>>
>>>  scripts/kconfig/conf.c | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
>>> index 866369f..52cbe5d 100644
>>> --- a/scripts/kconfig/conf.c
>>> +++ b/scripts/kconfig/conf.c
>>> @@ -434,7 +434,7 @@ static void check_conf(struct menu *menu)
>>>                                 if (sym->name && !sym_is_choice_value(sym)) {
>>>                                         printf("%s%s\n", CONFIG_, sym->name);
>>>                                 }
>>> -                       } else if (input_mode != olddefconfig) {
>>> +                       } else {
>>>                                 if (!conf_cnt++)
>>>                                         printf(_("*\n* Restart config...\n*\n"));
>>>                                 rootEntry = menu_get_parent_menu(menu);
>>> @@ -674,15 +674,15 @@ int main(int ac, char **av)
>>>                 /* fall through */
>>>         case oldconfig:
>>>         case listnewconfig:
>>> -       case olddefconfig:
>>>         case silentoldconfig:
>>>                 /* Update until a loop caused no more changes */
>>>                 do {
>>>                         conf_cnt = 0;
>>>                         check_conf(&rootmenu);
>>> -               } while (conf_cnt &&
>>> -                        (input_mode != listnewconfig &&
>>> -                         input_mode != olddefconfig));
>>> +               } while (conf_cnt && input_mode != listnewconfig);
>>> +               break;
>>> +       case olddefconfig:
>>> +       default:
>>>                 break;
>>>         }
>>>
>>> --
>>> 2.7.4
>>>
>>
>> Acked-by: Ulf Magnusson <ulfalizer@gmail.com>
>>
>> Cheers,
>> Ulf
>
> Should have been Reviewed-by, obviously. Sorry about that. :)
>


I will turn it into Reviewed-by.

Anyway, thanks a lot for checking these patches!

-- 
Best Regards
Masahiro Yamada
