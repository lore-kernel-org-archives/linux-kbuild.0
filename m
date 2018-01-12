Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:42722 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964953AbeALQtm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 11:49:42 -0500
MIME-Version: 1.0
In-Reply-To: <CAFkk2KQmj5hMhVytCU3pd5YJ2sPZxx7Y2HH8OLiiKL3Z_ZKiDg@mail.gmail.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com> <CAFkk2KQmj5hMhVytCU3pd5YJ2sPZxx7Y2HH8OLiiKL3Z_ZKiDg@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 12 Jan 2018 17:49:40 +0100
Message-ID: <CAFkk2KQ63jJVWLYTJpKfXJLfHrbp6k=5ToSHfqE1M+nxDNG4Sw@mail.gmail.com>
Subject: Re: [PATCH 1/6] kconfig: do not call check_conf() for olddefconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Marc Herbert <marc.herbert@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 12, 2018 at 1:26 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> On Wed, Jan 10, 2018 at 7:56 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> check_conf() traverses the menu tree, but it is completely no-op for
>> olddefconfig because the following if-else block does nothing.
>>
>>     if (input_mode == listnewconfig) {
>>             ...
>>     } else if (input_mode != olddefconfig) {
>>             ...
>>     }
>>
>> As the help message says, olddefconfig automatically sets new symbols
>> to their default value.  There is no room for manual intervention.
>> So, calling check_conf() for olddefconfig is odd in the first place.
>> Rather, olddefconfig belongs to the group of alldefconfig and defconfig.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  scripts/kconfig/conf.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
>> index 866369f..52cbe5d 100644
>> --- a/scripts/kconfig/conf.c
>> +++ b/scripts/kconfig/conf.c
>> @@ -434,7 +434,7 @@ static void check_conf(struct menu *menu)
>>                                 if (sym->name && !sym_is_choice_value(sym)) {
>>                                         printf("%s%s\n", CONFIG_, sym->name);
>>                                 }
>> -                       } else if (input_mode != olddefconfig) {
>> +                       } else {
>>                                 if (!conf_cnt++)
>>                                         printf(_("*\n* Restart config...\n*\n"));
>>                                 rootEntry = menu_get_parent_menu(menu);
>> @@ -674,15 +674,15 @@ int main(int ac, char **av)
>>                 /* fall through */
>>         case oldconfig:
>>         case listnewconfig:
>> -       case olddefconfig:
>>         case silentoldconfig:
>>                 /* Update until a loop caused no more changes */
>>                 do {
>>                         conf_cnt = 0;
>>                         check_conf(&rootmenu);
>> -               } while (conf_cnt &&
>> -                        (input_mode != listnewconfig &&
>> -                         input_mode != olddefconfig));
>> +               } while (conf_cnt && input_mode != listnewconfig);
>> +               break;
>> +       case olddefconfig:
>> +       default:
>>                 break;
>>         }
>>
>> --
>> 2.7.4
>>
>
> Acked-by: Ulf Magnusson <ulfalizer@gmail.com>
>
> Cheers,
> Ulf

Should have been Reviewed-by, obviously. Sorry about that. :)

Cheers,
Ulf
