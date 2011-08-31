Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:59093 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755544Ab1HaNEV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 09:04:21 -0400
Received: by wyh22 with SMTP id 22so114045wyh.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 06:04:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMT+=WYdCTb5O5V0ny+VTe0wHS==irZ1jcY2DV1KaKyfayn4+w@mail.gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314776773-9560-1-git-send-email-crquan@gmail.com> <1314776773-9560-2-git-send-email-crquan@gmail.com>
 <1314776773-9560-3-git-send-email-crquan@gmail.com> <1314776773-9560-4-git-send-email-crquan@gmail.com>
 <1314776773-9560-5-git-send-email-crquan@gmail.com> <1314776773-9560-6-git-send-email-crquan@gmail.com>
 <1314776773-9560-7-git-send-email-crquan@gmail.com> <CAMT+=WYdCTb5O5V0ny+VTe0wHS==irZ1jcY2DV1KaKyfayn4+w@mail.gmail.com>
From: Cheng Renquan <crquan@gmail.com>
Date: Wed, 31 Aug 2011 06:04:00 -0700
Message-ID: <CAH5vBdKBM6cc=1xnp-B7PFZfbxHQ+S_AFw7S2A=Gutc-SORkpQ@mail.gmail.com>
Subject: Re: [PATCH V2 6/6] scripts/kconfig/nconf: trunc too long string
 display in menu
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Content-Transfer-Encoding: 8bit
To: Nir Tzachar <nir.tzachar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

On Wed, Aug 31, 2011 at 1:53 AM, Nir Tzachar <nir.tzachar@gmail.com> wrote:
> Hi.
>
> On Wed, Aug 31, 2011 at 10:46 AM, Cheng Renquan <crquan@gmail.com> wrote:
>> When the string is too long, only show the first COLS/2 bytes wide,
>> to make sure there is some space to show the menu prompt.
>>
>> Signed-off-by: Cheng Renquan <crquan@gmail.com>
>> ---
>>  scripts/kconfig/nconf.c |    8 +++++++-
>>  1 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
>> index 4248759..4997ebf 100644
>> --- a/scripts/kconfig/nconf.c
>> +++ b/scripts/kconfig/nconf.c
>> @@ -887,8 +887,14 @@ static void build_conf(struct menu *menu)
>>                                break;
>>                        default:
>>                                tmp = 2 + strlen(sym_get_string_value(sym));
>> -                               item_make(menu, 's', "    (%s)",
>> +                               if (tmp < COLS/2)
>> +                                       item_make(menu, 's', "    (%s)",
>>                                                sym_get_string_value(sym));
>> +                               else {
>> +                                       char *s = strndupa(sym_get_string_value(sym), COLS/2);
>> +                                       strcpy(s + COLS/2 - 5, " ...");
>> +                                       item_make(menu, 's', "    (%s)", s);
>> +                               }
>>                                tmp = indent - tmp + 4;
>>                                if (tmp < 0)
>>                                        tmp = 0;
>> --
>> 1.7.6
>>
>>
>
> Nack.
>
> I see several problems with this approach:
> 1) I do not like the use of strdupa.
Then strdup ? OK, strdupa may be glibc only but strdup should be generic,

> 2) I think it would be better to put this behavior in item_make(), as
> it will then be applied to all items, in all code paths. However, I a
> not sure that using COLS/2 is the best approach. Moreover, I think
> that this should be implemented inside the ncurses menu library and
> not worked around. Care to create a patch for ncurses?

In item_make it doesn't know if it will be followed by item_add_str,
but here our issue is sym value part too long, only in outside item_make
(the build_conf) it is aware about subsequent item_add_str, only there
we could reserve some space for menu prompt to pass to item_add_str;

but how much space do we better to reserve? the COLS/2 is just a
guessed value by me,

Even in patch for ncurses it can only truncate the string tail, no
help for our issue;

>
> Cheers,
> Nir.
���{.n�+�������+%�����ݶ��w��{.n�+����{��F�W��{ay�ʇڙ�,j��f���h��������z_�(�階�ݢj"���m������G������?����&���~��
