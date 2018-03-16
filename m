Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:32427 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751497AbeCPDiK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 23:38:10 -0400
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com [209.85.213.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w2G3bhVQ006865
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Mar 2018 12:37:44 +0900
Received: by mail-vk0-f45.google.com with SMTP id o205so1978567vke.11
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 20:37:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1803152133000.28583@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com>
 <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
 <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr> <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com>
 <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr> <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com>
 <nycvar.YSQ.7.76.1803151504080.28583@knanqh.ubzr> <CAK7LNAR8Z1H9+wcMt4nMkrBU9K4=sTZQFi5p26N1rPR_LtJVJQ@mail.gmail.com>
 <nycvar.YSQ.7.76.1803152133000.28583@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Mar 2018 12:37:02 +0900
Message-ID: <CAK7LNASBoV496V+kGaTodU1agV3O-zupPDb5nSv+iqpiMzLYyw@mail.gmail.com>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related problems
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Thomas Lindroth <thomas.lindroth@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-03-16 10:40 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> On Fri, 16 Mar 2018, Masahiro Yamada wrote:
>
>> 2018-03-16 5:56 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
>> > ----- >8
>> > Subject: [PATCH] kbuild: make scripts/adjust_autoksyms.sh robust against timestamp races
>> >
>> > Some filesystems have timestamps with coarse precision that may allow
>> > for a recently built object file to have the same timestamp as the
>> > updated time on one of its dependency files. When that happens, the
>> > object file doesn't get rebuilt as it should.
>> >
>> > This is especially the case on filesystems that don't have sub-second
>> > time precision, such as ext3 or Ext4 with 128B inodes.
>> >
>> > Let's prevent that by making sure updated dependency files have a newer
>> > timestamp than the first file we created (i.e. autoksyms.h.tmpnew).
>> >
>> > Reported-by: Thomas Lindroth <thomas.lindroth@gmail.com>
>> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
>> >
>> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>> > index 513da1a4a2..d67830e6e3 100755
>> > --- a/scripts/adjust_autoksyms.sh
>> > +++ b/scripts/adjust_autoksyms.sh
>> > @@ -84,6 +84,13 @@ while read sympath; do
>> >         depfile="include/config/ksym/${sympath}.h"
>> >         mkdir -p "$(dirname "$depfile")"
>> >         touch "$depfile"
>>
>> Just a nit.
>>
>> I think this 'touch' is unnecessary.
>> If $depfile does not exist, the '-nt' is evaluated to false,
>> so it will be touched inside the while loop anyway.
>
> Though it is more efficient with the first touch up front, as the common
> case requires only 2 stat system calls instead of 4.


Ah, you are right.
I take my comment back.

I am fine with this patch.
Thanks!



>> > +       # Filesystems with coarse time precision may create timestamps
>> > +       # equal to the one from a file that was very recently built and that
>> > +       # needs to be rebuild. Let's guard against that by making sure our
>> > +       # dep files are always newer than the first file we created here.
>> > +       while [ ! "$depfile" -nt "$new_ksyms_file" ]; do
>> > +               touch "$depfile"
>> > +       done
>> >         echo $((count += 1))
>> >  done | tail -1 )
>> >  changed=${changed:-0}
>> > ----- >8
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
